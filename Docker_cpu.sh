#!/bin/bash
#Loop
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>Docker_log.output 2>&1
START=1
END=5
cpm_arr=(10000 20000 30000 40000 50000 60000 70000 80000)
for i in "${cpm_arr[@]}"
do
echo "CMP Value:" $i
for j in $(eval echo "{$START..$END}")
do
echo "Loop" $j
sysbench --test=cpu --cpu-max-prime=$i run
done
done

