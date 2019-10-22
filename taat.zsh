export LSCOLORS=


alias n='echo -n ""'


# MacOS
if [[ $OSTYPE == darwin* ]]; then
    # Homebrew
    if [ -f $HOME/.homebrew_github_api_token ]; then
        HOMEBREW_GITHUB_API_TOKEN=$(cat $HOME/.homebrew_github_api_token)
    fi
    export PATH=/usr/local/sbin:$PATH

    # zsh-syntax-highlighting
    if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    # zsh-autosuggestions
    if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    # Qt
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

    # Python
    if [ -d "$HOME/Library/Python/3.7" ]; then
        export PATH="$HOME/Library/Python/3.7/bin:$PATH"
    fi

    # R
    if [ -d "/usr/local/opt/r-gui/R.app" ]; then
        alias rapp="open /usr/local/opt/r-gui/R.app"
    fi

    # Graphviz
    if [ -d "/usr/local/opt/graphviz/Graphviz.app" ]; then
        alias graphvizapp="open /usr/local/opt/graphviz/Graphviz.app"
    fi

    # wxMaxima
    if [ -d "/usr/local/opt/wxmaxima/wxMaxima.app" ]; then
        alias wxmaximaapp="open /usr/local/opt/wxmaxima/wxMaxima.app"
    fi

    # Scala
    if [ -d "/usr/local/opt/scala" ]; then
        export SCALA_HOME=/usr/local/opt/scala/libexec
    fi

    # Groovy
    if [ -d "/usr/local/opt/groovy" ]; then
        export GROOVY_HOME=/usr/local/opt/groovy/libexec
    fi

    # Gradle
    if [ -d "/usr/local/opt/gradle" ]; then
        export GRADLE_HOME=/usr/local/opt/gradle/libexec
    fi

    # Haskell
    if [ -d "$HOME/Library/Haskell" ]; then
        export PATH="$HOME/Library/Haskell/bin:$PATH"
    fi
fi


# Linux
if [[ $OSTYPE == linux* ]]; then
    # zsh-syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    # CMake
    if [ -d "/opt/cmake" ]; then
        export PATH=/opt/cmake/bin:$PATH
    fi

    # Swift
    if [ -d "/opt/swift" ]; then
        export PATH=/opt/swift/usr/bin:$PATH
    fi

    # Go
    if [ -d "/opt/go" ]; then
        export PATH=/opt/go/bin:$PATH
    fi

    # Node
    if [ -d "/opt/node" ]; then
        export PATH=/opt/node/bin:$PATH
    fi
fi


# Go
if [ -d "$HOME/opt/go" ]; then
    export GOPATH=$HOME/opt/go
    export PATH="${GOPATH//://bin:}/bin:$PATH"
fi

# Node
if [ -d "$HOME/opt/node" ]; then
    export PATH=$HOME/opt/node/bin:$PATH
fi


# User bin paths
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
