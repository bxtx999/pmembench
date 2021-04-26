# ./reproduce/validate.sh || exit -1

# Reproduces data for figure 4
# Interference

export PMDK=/home/aim/hjn/pmdk

clang++ -g0 -O3 -DNDEBUG=1 -march=native -std=c++17 interference/interference.cpp -I${PMDK}/src/include/ ${PMDK}/src/nondebug/libpmem.a ${PMDK}/src/nondebug/libpmemlog.a -lpthread -lndctl -ldaxctl || exit -1

# Seqential ram
echo "" > results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  1  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  4  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  8  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  1  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  4  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  8  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  1  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  4  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  8  0  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  0  1  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  0  4  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  0  8  0 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  0  0  1 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  0  0  4 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt
numactl --cpunodebind=0 ./a.out 8  0  0  0  0  8 /mnt/pmem/renen | tee -a results/interference_seq_ram.txt

# Seqential nvm
echo "" > results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  1 8  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  4 8  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  8 8  0  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  1  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  4  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  8  0  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  1  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  4  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  8  0  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  0  1  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  0  4  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  0  8  0 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  0  0  1 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  0  0  4 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt
numactl --cpunodebind=0 ./a.out  0 8  0  0  0  8 /mnt/pmem/renen | tee -a results/interference_seq_nvm.txt

# Random ram
echo "" > results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  0  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  1  0 8  0  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  4  0 8  0  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  8  0 8  0  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  1 8  0  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  4 8  0  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  8 8  0  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  1  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  4  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  0  1  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  0  4  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  0  8  0 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  0  0  1 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  0  0  4 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt
numactl --cpunodebind=0 ./a.out  0  0 8  0  0  8 /mnt/pmem/renen | tee -a results/interference_rnd_ram.txt

# Random nvm
echo "" > results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  0 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  1  0  0 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  4  0  0 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  8  0  0 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  1  0 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  4  0 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  8  0 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  1 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  4 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  8 8  0  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  0 8  1  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  0 8  4  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  0 8  8  0 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  0 8  0  1 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  0 8  0  4 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt
numactl --cpunodebind=0 ./a.out  0  0  0 8  0  8 /mnt/pmem/renen | tee -a results/interference_rnd_nvm.txt

## Log nvm
#./a.out  0  0  0  0 8  0 /mnt/pmem/renen
#./a.out  1  0  0  0 8  0 /mnt/pmem/renen
#./a.out  4  0  0  0 8  0 /mnt/pmem/renen
#./a.out  8  0  0  0 8  0 /mnt/pmem/renen
#./a.out  0  1  0  0 8  0 /mnt/pmem/renen
#./a.out  0  4  0  0 8  0 /mnt/pmem/renen
#./a.out  0  8  0  0 8  0 /mnt/pmem/renen
#./a.out  0  0  1  0 8  0 /mnt/pmem/renen
#./a.out  0  0  4  0 8  0 /mnt/pmem/renen
#./a.out  0  0  8  0 8  0 /mnt/pmem/renen
#./a.out  0  0  0  1 8  0 /mnt/pmem/renen
#./a.out  0  0  0  4 8  0 /mnt/pmem/renen
#./a.out  0  0  0  8 8  0 /mnt/pmem/renen
#./a.out  0  0  0  0 8  1 /mnt/pmem/renen
#./a.out  0  0  0  0 8  4 /mnt/pmem/renen
#./a.out  0  0  0  0 8  8 /mnt/pmem/renen
#
## Page nvm
# ./a.out  0  0  0  0  0 8 /mnt/pmem/renen
# ./a.out  1  0  0  0  0 8 /mnt/pmem/renen
# ./a.out  4  0  0  0  0 8 /mnt/pmem/renen
# ./a.out  8  0  0  0  0 8 /mnt/pmem/renen
# ./a.out  0  1  0  0  0 8 /mnt/pmem/renen
# ./a.out  0  4  0  0  0 8 /mnt/pmem/renen
# ./a.out  0  8  0  0  0 8 /mnt/pmem/renen
# ./a.out  0  0  1  0  0 8 /mnt/pmem/renen
# ./a.out  0  0  4  0  0 8 /mnt/pmem/renen
# ./a.out  0  0  8  0  0 8 /mnt/pmem/renen
# ./a.out  0  0  0  1  0 8 /mnt/pmem/renen
# ./a.out  0  0  0  4  0 8 /mnt/pmem/renen
# ./a.out  0  0  0  8  0 8 /mnt/pmem/renen
# ./a.out  0  0  0  0  1 8 /mnt/pmem/renen
# ./a.out  0  0  0  0  4 8 /mnt/pmem/renen
# ./a.out  0  0  0  0  8 8 /mnt/pmem/renen
