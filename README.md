# thesis

## Build
git clone ... && cd thesis  
export PROJECT_ROOT=$(pwd)  
python $PROJECT_ROOT/llvm/buildbot/configure.py -o $PROJECT_ROOT/build  
python $PROJECT_ROOT/llvm/buildbot/compile.py -o $PROJECT_ROOT/build  
