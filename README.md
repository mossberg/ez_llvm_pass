# ez llvm pass

Easy LLVM setup on Ubuntu which lets you get started very quickly with pass
development. That's it.

1. Follow the instructions at http://llvm.org/apt/ to install LLVM 3.7 (stable)
   via apt.
2. Develop your pass in `MyPass.cc`.
3. Develop a testing program in `test.c`, which the pass will be applied on.
4. `make` builds the pass and test program.
5. `make check` applies the pass to the program and outputs the pass output,
   the original IR, and the post-pass IR.
