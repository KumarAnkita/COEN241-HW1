#!/bin/bash
#Loop
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>fo.output 2>&1

Begin_loop=1
end_loop=5
cpu_memory_arr=(10000 20000 30000 40000 50000 60000 70000 80000)
#cpu_memory_arr=(10000 20000)
for i in "${cpu_memory_arr[@]}"
do
echo "CMP Value:" $i
for j in $(eval echo "{$Begin_loop..$end_loop}")
do
echo "Loop" $j
sysbench --test=cpu --cpu-max-prime=$i run
#echo "I will just append to my custom log file" >> /home/akumar/output.log
done
done
