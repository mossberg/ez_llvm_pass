#include"llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

namespace {
    struct MyPass : public llvm::FunctionPass
    {
        static char ID;
        MyPass() : llvm::FunctionPass(ID) { }
        bool runOnFunction(llvm::Function &llvm_function) override;
    };

    bool MyPass::runOnFunction(llvm::Function &llvm_function)
    {
        llvm::errs() << "Hi" << '\n';
        return false;
    }
}

char MyPass::ID = 0;
static llvm::RegisterPass<MyPass> X("mypass", "My Pass", false, false);
