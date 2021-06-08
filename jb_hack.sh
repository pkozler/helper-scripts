#!/bin/bash

ideconfpath="/home/$(whoami)/.config/JetBrains"
idecfgcache="/home/$(whoami)/.cache/JetBrains"
sharetrashf="/home/$(whoami)/.local/share/Trash/files"
sharetrashi="/home/$(whoami)/.local/share/Trash/info"

paths="$ideconfpath/PhpStorm*
$ideconfpath/PyCharm*"
cache="$idecfgcache/PhpStorm*
$idecfgcache/PyCharm*"
trshf="$sharetrashf/PhpStorm*
$sharetrashf/PyCharm*"
trshi="$sharetrashi/PhpStorm*
$sharetrashi/PyCharm*"

optsxmlpath=options/other.xml
updtxmlpath=options/updates.xml
evalkeyhead=eval
evalkeytail=.evaluation.key

echo -e "Starting...\n"

for ide in $paths
do
    echo Path \"$ide\":

    rm -f $ide/$optsxmlpath
    echo \- deleted \"$ide/$optsxmlpath\",

    rm -f $ide/$updtxmlpath
    echo \- deleted \"$ide/$updtxmlpath\",

    rm -f $ide/$evalkeyhead/*$evalkeytail
    echo \- deleted \"$ide/$evalkeyhead/*$evalkeytail\".

    echo -e
done

for ice in $cache
do
    rm -rf $ice
    echo \- deleted \"$ice\".
done

for tsf in $trshf
do
    rm -rf $tsf
    echo \- deleted \"$tsf\".
done

for tsi in $trshi
do
    rm -rf $tsi
    echo \- deleted \"$tsi\".
done

echo -e "Finished!\n"
