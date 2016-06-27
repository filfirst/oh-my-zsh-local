if [[ $OSTYPE == darwin* ]]; then
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
else
    [[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
fi


export LSCOLORS=


#alias cp='cp -i'
#alias mv='mv -i'
#alias rm='rm -i'


if [[ $OSTYPE == darwin* ]]; then
    # For Homebrew
    HOMEBREW_GITHUB_API_TOKEN=$(cat $HOME/.homebrew_github_api_token)
    export PATH=/usr/local/sbin:$PATH

    # For Qt
    #export QTDIR=/usr/local/opt/qt5
    #export PATH=$QTDIR/bin:$PATH
    #export CMAKE_PREFIX_PATH=$QTDIR/lib/cmake:$CMAKE_PREFIX_PATH
    export CMAKE_PREFIX_PATH=/usr/local/opt/qt5/lib/cmake:$CMAKE_PREFIX_PATH

    # For $HOME/bin
    export PATH=$PATH:$HOME/bin

    # For Scala
    export SCALA_HOME=/usr/local/opt/scala/libexec

    # For Groovy
    export GROOVY_HOME=/usr/local/opt/groovy/libexec

    # For Gradle
    export GRADLE_HOME=/usr/local/opt/gradle/libexec

    # For Go
    export GOPATH=$HOME/opt/go

    # For Cuda
    #export PATH=/Developer/NVIDIA/CUDA-7.0/bin:$PATH
    #export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.0/lib:$DYLD_LIBRARY_PATH

    # For Haskell
    export PATH="$HOME/Library/Haskell/bin:$PATH"
fi


# For Ansible
export ANSIBLE_HOSTS=$HOME/.ansible_hosts
