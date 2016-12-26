if [[ $OSTYPE == darwin* ]]; then
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
else
    [[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
fi


export LSCOLORS=


alias n='echo -n ""'


if [[ $OSTYPE == darwin* ]]; then
    # For Homebrew
    HOMEBREW_GITHUB_API_TOKEN=$(cat $HOME/.homebrew_github_api_token)
    export PATH=/usr/local/sbin:$PATH

    # For Qt
    export QTDIR=/usr/local/opt/qt5
    export PATH=$QTDIR/bin:$PATH
    export CMAKE_PREFIX_PATH=$QTDIR:$CMAKE_PREFIX_PATH

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


# For Node.js
which npm >> /dev/null
if [ $? = 0 ]; then
    alias lnpm="node --max-old-space-size=8192 /usr/local/bin/npm"
fi


if [[ $OSTYPE == linux* ]]; then
    export PATH="$HOME/.local/bin:$PATH"
    # For Swift
    export PATH=/opt/swift/usr/bin:$PATH
fi

# For $HOME/bin
export PATH=$PATH:$HOME/bin

# For Ansible
export ANSIBLE_HOSTS=$HOME/.ansible_hosts
