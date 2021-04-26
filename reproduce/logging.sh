./reproduce/validate.sh || exit -1

# Reproduces data for figure 6
# Logging

echo "" > results/logging.txt

export PMDK=/home/aim/hjn/pmdk

clang++ -g0 -O3 -DNDEBUG=1 -march=native -std=c++17 logging/logging.cpp -I${PMDK}/src/include/ ${PMDK}/src/nondebug/libpmem.a ${PMDK}/src/nondebug/libpmemlog.a -lpthread -lndctl -ldaxctl \
&& ./a.out 56 512 10e9 5 ${PMEM_PATH}/file 0 | tee -a results/logging.txt
