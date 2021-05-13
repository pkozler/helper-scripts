if [ $# -lt 1 ]
then
	echo 'Missing input file!'
	exit(0)
fi

if [ $# -lt 2 ]
then
	echo 'Missing secret key!'
	exit(0)
fi

if [ $# -lt 3 ]
then
	echo 'Missing output dir!'
	exit(0)
fi

original_data=${1} # 'secret'
encryption_key=${2} # 'pks_rsa'
encryption_dest=${3} # '.'

random_key=$encryption_dest/.$original_data/key.bin
encrypt_key=$random_key.enc
encrypt_data=$encryption_dest/$original_data.enc

rm -R $encryption_dest/.$original_data && rm $encrypt_data && mkdir $encryption_dest/.$original_data

# Step 0) Get their public key
# The other person needs to send you their public key in .pem format.
# openssl rsa -in ~/.ssh/$encryption_key -outform pem > ~/.ssh/.$encryption_key/key.pem

# If they only have it in rsa format (e.g., they use it for ssh), then have them do:
# Have them send you <pem>.pub.pem
# openssl rsa -in ~/.ssh/$encryption_key.pub -pubout -outform pem > ~/.ssh/.$encryption_key/key.pub.pem

# Step 1) Generate a 256 bit (32 byte) random key
openssl rand -base64 32 > $random_key

# Step 2) Encrypt the key
openssl rsautl -encrypt -inkey ~/.ssh/$encryption_key.pub -pubin -in $random_key -out $encrypt_key

# Step 3) Actually Encrypt our large file
openssl enc -aes-256-cbc -salt -in $encryption_dest/$original_data -out $encrypt_data -pass file:./key.bin

# Step 4) Send/Decrypt the files
# Send the .enc files to the other person and have them do:

openssl rsautl -decrypt -inkey ~/.ssh/$encryption_key -in $encrypt_key -out $random_key

openssl enc -d -aes-256-cbc -in $encrypt_data -out $encryption_dest/$original_data -pass file:./key.bin
