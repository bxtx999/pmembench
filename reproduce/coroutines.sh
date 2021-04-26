./reproduce/validate.sh || exit -1

# Building clang++ is required

# cd build
# cmake -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DLLVM_ENABLE_PROJECTS="libcxx;libcxxabi;clang" -DCMAKE_BUILD_TYPE=Release -G "Unix Makefiles" ../llvm
# make -j48

echo "" > results/coroutines.txt

/usr/bin/clang++ -fcoroutines-ts -g0 -O3 -march=native -std=c++2a -mllvm -inline-threshold=50000 coroutine/coro_insert.cpp -stdlib=libc++ -lc++abi -nostdinc++ -I/usr/lib/llvm-12/include/c++/v1 -I/usr/include/clang/12/include -I/usr/lib/clang/12/include -L/usr/lib/clang/12/lib/linux -Wl,-rpath,/usr/lib/clang/12/lib/linux -DNDEBUG=1 || exit

for GROUP_SIZE in 1 2 3 4 5 6 7 8 10 12 14 16 24 32 40 48 56 64; do
  ./a.out 1e7 1e7 ${GROUP_SIZE} nvm /mnt/pmem/renen | tee -a results/coroutines.txt
  ./a.out 1e7 1e7 ${GROUP_SIZE} ram /mnt/pmem/renen | tee -a results/coroutines.txt
done

/usr/bin/clang++ -fcoroutines-ts -g0 -O3 -march=native -std=c++2a -mllvm -inline-threshold=50000 coroutine/coro_lookup.cpp -stdlib=libc++ -lc++abi -nostdinc++ -I-I/usr/lib/llvm-12/include/c++/v1 -I/usr/include/clang/12/include -I/usr/lib/clang/12/include -L/usr/lib/clang/12/lib/linux -Wl,-rpath,/usr/lib/clang/12/lib/linux -DNDEBUG=1 || exit

for GROUP_SIZE in 1 2 3 4 5 6 7 8 10 12 14 16 24 32 40 48 56 64; do
  ./a.out 1e7 1e7 ${GROUP_SIZE} nvm /mnt/pmem/renen | tee -a results/coroutines.txt
  ./a.out 1e7 1e7 ${GROUP_SIZE} ram /mnt/pmem/renen | tee -a results/coroutines.txt
done
