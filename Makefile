CLANG=clang-3.7
OPT=opt-3.7
CXX=clang++-3.7
LLVMDIS=llvm-dis-3.7
LLVMCONFIG=llvm-config-3.7

all: bc ll pass

bc: test.bc

ll: test.ll

pass: MyPass.so

%.bc: %.c
	$(CLANG) -emit-llvm -c $< -o $@

%.ll: %.bc
	$(LLVMDIS) $<

%.so: %.cc
	$(CXX) -fPIC -shared $< -o $@ -std=c++11 `$(LLVMCONFIG) --cppflags`

check:
	$(OPT) -load ./MyPass.so -mypass test.bc -o tmp.bc
	@echo ======================
	@cat test.ll
	@echo ======================
	@$(LLVMDIS) tmp.bc
	@cat tmp.ll
	@rm tmp.ll

clean:
	rm -rf *.so *.bc *.ll
