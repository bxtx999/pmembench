./reproduce/validate.sh || exit -1

# Reproduces data for figure 4
# Write latency

echo "" > results/inplace.txt

export PMDK=/home/aim/hjn/pmdk

COMPILE="clang++ -g0 -O3 -DNDEBUG=1 -march=native -std=c++17 inplace/bench.cpp -I${PMDK}/src/include/ ${PMDK}/src/nondebug/libpmem.a ${PMDK}/src/nondebug/libpmemlog.a -lpthread -lndctl -ldaxctl"

for ENTRY_SIZE in `seq 16 16 128`; do
  ${COMPILE} -DENTRY_SIZE=${ENTRY_SIZE} || exit -1
  ./a.out 1e9 seq /mnt/pmem/renen | tee -a results/inplace.txt
  ./a.out 1e9 rnd /mnt/pmem/renen | tee -a results/inplace.txt
done
