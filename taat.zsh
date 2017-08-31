if [[ $OSTYPE == darwin* ]]; then
    [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
else
    [[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
fi


export LSCOLORS=


alias n='echo -n ""'


# For MacOS
if [[ $OSTYPE == darwin* ]]; then
    # For Homebrew
    HOMEBREW_GITHUB_API_TOKEN=$(cat $HOME/.homebrew_github_api_token)
    export PATH=/usr/local/sbin:$PATH

    # For Qt
    if [ -d "/usr/local/opt/qt" ]; then
        export QTDIR=/usr/local/opt/qt
        export PATH=$QTDIR/bin:$PATH
        export CMAKE_PREFIX_PATH=$QTDIR:$CMAKE_PREFIX_PATH
        alias assistant="open $QTDIR/libexec/Assistant.app"
        alias designer="open $QTDIR/libexec/Designer.app"
        alias linguist="open $QTDIR/libexec/Linguist.app"
        alias pixeltool="open $QTDIR/libexec/pixeltool.app"
        alias qdbusviewer="open $QTDIR/libexec/qdbusviewer.app"
        alias qml="open $QTDIR/libexec/qml.app"
    fi

    # For R
    if [ -d "/usr/local/opt/r-gui/R.app" ]; then
        alias rapp="open /usr/local/opt/r-gui/R.app"
    fi

    # For Graphviz
    if [ -d "/usr/local/opt/graphviz/Graphviz.app" ]; then
        alias graphvizapp="open /usr/local/opt/graphviz/Graphviz.app"
    fi

    # For wxMaxima
    if [ -d "/usr/local/opt/wxmaxima/wxMaxima.app" ]; then
        alias wxmaximaapp="open /usr/local/opt/wxmaxima/wxMaxima.app"
    fi

    # For Scala
    if [ -d "/usr/local/opt/scala" ]; then
        export SCALA_HOME=/usr/local/opt/scala/libexec
    fi

    # For Groovy
    if [ -d "/usr/local/opt/groovy" ]; then
        export GROOVY_HOME=/usr/local/opt/groovy/libexec
    fi

    # For Gradle
    if [ -d "/usr/local/opt/gradle" ]; then
        export GRADLE_HOME=/usr/local/opt/gradle/libexec
    fi

    # For Go
    if [ -d "$HOME/opt/go" ]; then
        export GOPATH=$HOME/opt/go
    fi

    # For Cuda
    #export PATH=/Developer/NVIDIA/CUDA-8.0/bin${PATH:+:${PATH}}
    #export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-8.0/lib${DYLD_LIBRARY_PATH:+:${DYLD_LIBRARY_PATH}}

    # For Haskell
    if [ -d "$HOME/Library/Haskell" ]; then
        export PATH="$HOME/Library/Haskell/bin:$PATH"
    fi
fi


# For Linux
if [[ $OSTYPE == linux* ]]; then
    # For CMake
    if [ -d "/opt/cmake" ]; then
        export PATH=/opt/cmake/bin:$PATH
    fi

    # For Swift
    if [ -d "/opt/swift" ]; then
        export PATH=/opt/swift/usr/bin:$PATH
    fi
fi


# For Node.js
which npm >> /dev/null
if [ $? = 0 ]; then
    alias lnpm="node --max-old-space-size=8192 $(which npm)"
fi


# For user bin paths
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi


# For Ansible
export ANSIBLE_HOSTS=$HOME/.ansible_hosts

# For zsh syntax highlighting
if [[ $OSTYPE == darwin* ]]; then
    if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi
elif [[ $OSTYPE == linux* ]]; then
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi
fi
