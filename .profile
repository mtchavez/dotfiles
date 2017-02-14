# Setup PATH
export PATH=/usr/local:/usr/local/bin:/usr/bin:/usr/local/sbin:usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/share/npm/lib/node_modules:/usr/local/lib/node:/usr/local/lib/node_modules:$NODE_PATH
# Add current directory bin and $HOME/bin to path
export PATH="`pwd`/bin":$HOME/bin:$PATH

# Go PATH
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GOBIN="$GOROOT/bin"

# Python
# Path for Homebrew Python
export PYTHONPATH=`brew --prefix`/lib/python2.7/site-packages:$PYTHONPATH
export VIRTENV=$HOME/.virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PYTHONSTARTUP=$HOME/.pythonrc.py
export CFLAGS=-I$(brew --prefix)/include:$CFLAGS
export LDFLAGS=-L$(brew --prefix)/lib:$LDFLAGS

# Node nonsense
export PATH="$PATH:$(yarn global bin)"

# CUDA
#export PATH=$PATH:/Developer/NVIDIA/CUDA-5.5/bin
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH/Developer/NVIDIA/CUDA-5.5/lib

# Java
# check if java_home is set and set JAVA_HOME if one is found
/usr/libexec/java_home >/dev/null 2>&1
if [ $? -eq 0 ]
then
    export JAVA_HOME=`/usr/libexec/java_home`
    export PATH=$PATH:$JAVA_HOME/bin
fi

# Ruby
# Nokogiri is happy with system libraries
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

# Chef
# export PATH=/opt/chefdk/bin:$PATH

# R
# export R_HOME=/Library/Frameworks/R.framework/Resources
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:RHOME/bin
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/jre/lib/server

# Added by the Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# MOTD
if [ -f $HOME/bin/motd ]; then $HOME/bin/motd; fi

# vim: ft=sh:
