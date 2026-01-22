export LSCOLORS=


alias n='echo -n ""'


# MacOS
if [[ $OSTYPE == darwin* ]]; then
    # Additional path
    export PATH="/usr/local/sbin:$PATH"

    # Homebrew
    if [ -d "/opt/homebrew/share/zsh/site-functions" ]; then
        fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
        autoload -Uz compinit
        compinit
    fi

    if [ -d "/opt/homebrew/bin" ]; then
        export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    fi

    # zsh-autosuggestions
    if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    # zsh-syntax-highlighting
    if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
    fi

    # Python
    if [ -d "$HOME/Library/Python/3.14" ]; then
        export PATH="$HOME/Library/Python/3.14/bin:$PATH"
    fi

    # Java
    /usr/libexec/java_home > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        export JAVA_HOME=$(/usr/libexec/java_home 2> /dev/null)
    fi

    # Gradle
    if [ -d "/opt/homebrew/opt/gradle" ]; then
        export GRADLE_HOME=/opt/homebrew/opt/gradle/libexec
    fi

    # Groovy
    if [ -d "/opt/homebrew/opt/groovy" ]; then
        export GROOVY_HOME=/opt/homebrew/opt/groovy/libexec
    fi

    # Scala
    if [ -d "/opt/homebrew/opt/scala" ]; then
        export SCALA_HOME=/opt/homebrew/opt/scala/libexec
    fi

    # Haskell
    if [ -d "$HOME/Library/Haskell" ]; then
        export PATH="$HOME/Library/Haskell/bin:$PATH"
    fi
fi


# Linux
if [[ $OSTYPE == linux* ]]; then
    # zsh-autosuggestions
    if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    # zsh-syntax-highlighting
    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        ZSH_HIGHLIGHT_STYLES[comment]='fg=8,bold'
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


# Rust
if [ -d "$HOME/opt/rust" ]; then
    export RUST_HOME=$HOME/opt/rust
    export RUSTUP_HOME=$HOME/opt/rust/rustup
    export CARGO_HOME=$HOME/opt/rust/cargo

    if [ -f "$CARGO_HOME/env" ]; then
        source "$CARGO_HOME/env"
    fi
fi

# Go
if [ -d "$HOME/opt/go" ]; then
    if [ -z "${GOPATH}" ]; then
        export GOPATH=$HOME/opt/go
    fi
fi

if type "go" > /dev/null; then
    export PATH="${${$(go env GOPATH)}//://bin:}/bin:$PATH"
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
