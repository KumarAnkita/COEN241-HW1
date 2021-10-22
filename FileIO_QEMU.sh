#!/bin/bash
#Loop
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>FileIO_log_qemu.output 2>&1
for j in {1..4}
do
for i in {1..5} 
do
sysbench --num-threads=$j --test=fileio --file-total-size=1G --file-test-mode=rndrw prepare
sysbench --num-threads=$j --test=fileio --file-total-size=1G --file-test-mode=rndrw run
sysbench --num-threads=$j --test=fileio --file-total-size=1G --file-test-mode=rndrw cleanup

done
done

