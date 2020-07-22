@echo off

set "list=PhpStorm2020.1 PyCharm2020.1"
echo/

set dest=.\data\scratches
if not exist "%dest%" mkdir %dest%

(for %%a in (%list%) do (
   echo Syncing '%%a' --^> 'data/' ...
   echo/

   robocopy "C:%HOMEPATH%\AppData\Roaming\JetBrains\%%a\scratches" "%dest%" /FFT /Z /XO /W:1

   echo OK
   echo/
))

(for %%a in (%list%) do (
   echo Syncing '%%a' ^<-- 'data/' ... 
   echo/

   robocopy "%dest%" "C:%HOMEPATH%\AppData\Roaming\JetBrains\%%a\scratches" /MIR /FFT /Z /W:1

   echo OK
   echo/
))

echo Done!
echo/
