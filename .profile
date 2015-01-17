# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

export PATH=/usr/local:/usr/local/bin:/usr/bin:/usr/local/sbin:$HOME/bin:$HOME/bin/terraform:$HOME/bin/packer:/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules:/usr/local/lib/node:/usr/local/lib/node_modules:$NODE_PATH

# Go PATH
export GOPATH=$HOME/Projects/go
export GOROOT=/usr/local/go
export GOBIN="$GOROOT/bin"
export PATH=$HOME/Projects/go/bin:$GOBIN:$PATH

# Python
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
# export PYTHONPATH=$PYTHONPATH:$HOME/Library/Python/2.7/lib/python/site-packages
export VIRTENV=$HOME/.virtualenvs
export PYTHONSTARTUP=$HOME/.pythonrc.py
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# CUDA
#export PATH=$PATH:/Developer/NVIDIA/CUDA-5.5/bin
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH/Developer/NVIDIA/CUDA-5.5/lib

# Java
export JAVA_HOME=`/usr/libexec/java_home`
export PATH=$PATH:$JAVA_HOME/bin

# R
# export R_HOME=/Library/Frameworks/R.framework/Resources
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:RHOME/bin
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/jre/lib/server

# Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# vim: ft=sh:
