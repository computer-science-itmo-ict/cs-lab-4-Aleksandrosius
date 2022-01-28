#!/bin/bash

array=($@)
host_number=$((${#array[@]}-1))
ping=0
for (( i = 0 ; i <= $host_number ; i++))
do
ping=$(ping ${array[i]} -c 1 2> /dev/null | grep 'icmp_seq' -c 2>/dev/null)
if [[ $ping != 0 ]]
then
echo "HOST IS UP"
else
echo "HOST IS DOWN"
fi
ping=0
done
