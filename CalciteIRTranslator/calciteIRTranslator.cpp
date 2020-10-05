#include <iostream>
#include <string>

#include "llvm/ADT/Triple.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"

int translate(const std::string &filename) {
  using namespace llvm;
  SMDiagnostic Err;
  LLVMContext context;
  std::unique_ptr<Module> M = parseIRFile(filename.c_str(), Err, context);
  if (!M) {
    Err.print(filename.c_str(), errs());
    return 1;
  }
  // Set spv triple
  auto triple = M->getTargetTriple();
  M->setTargetTriple("spir64-unknown-unknown");

  // Export functions
  for (auto f = M->begin(); f != M->end(); f++) {
    if (f->getName() == "multifrag_query_hoisted_literals") {
      f->setCallingConv(CallingConv::SPIR_KERNEL);
    }
    // errs() << f->getName() << "\n";
  }

  // Dump to stderr for now
  M->print(errs(), nullptr);
  return 0;
}

void dumpToFile(const llvm::Module *M) {
  std::error_code ec;
  // todo
}

using namespace std;
int main(int argc, char *argv[]) {
  if (argc == 2) {
    string filename = argv[1];
    //cout << "Reading IR from " << filename << endl;
    return translate(filename);
  } else {
    cerr << "Usage: " << argv[0] << " <ir_to_translate.ll>" << endl;
  }
}