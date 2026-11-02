# macOS
if [[ $OSTYPE == darwin* ]]; then
    # Homebrew
    if [ -d "/opt/homebrew/share/zsh/site-functions" ]; then
        fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
        autoload -Uz compinit
        compinit
    fi

    if [ -d "/opt/homebrew/bin" ]; then
        export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    fi

    # Java
    if [[ -z $JAVA_HOME ]]; then
        if JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null); then
            export JAVA_HOME
        else
            unset JAVA_HOME
        fi
    fi

    # Gradle
    if [ -d "/opt/homebrew/opt/gradle" ]; then
        export GRADLE_HOME=${GRADLE_HOME:-/opt/homebrew/opt/gradle/libexec}
    fi

    # Groovy
    if [ -d "/opt/homebrew/opt/groovy" ]; then
        export GROOVY_HOME=${GROOVY_HOME:-/opt/homebrew/opt/groovy/libexec}
    fi
fi


# Linux
if [[ $OSTYPE == linux* ]]; then
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
if [[ -d $HOME/opt/rust ]]; then
    export RUSTUP_HOME=${RUSTUP_HOME:-$HOME/opt/rust/rustup}
    export CARGO_HOME=${CARGO_HOME:-$HOME/opt/rust/cargo}
fi

() {
    local cargo_bin=${CARGO_HOME:-$HOME/.cargo}/bin
    if [[ -d $cargo_bin ]] || (( $+commands[cargo] )); then
        path=($cargo_bin $path)
    fi
}

# Go
if (( $+commands[go] )); then
    if [ -d "$HOME/opt/go" ]; then
        export GOPATH=${GOPATH:-$HOME/opt/go}
    fi

    () {
        local gobin gopath
        (cd / && go env GOBIN GOPATH) | { read -r gobin; read -r gopath }
        local -aU gp=(${(s.:.)gopath})
        (( $#gp )) && export GOPATH=${(j.:.)gp}
        local -aU add=($gobin ${^gp}/bin)
        path=($add $path)
    }
fi

# Node
if [ -d "$HOME/opt/node" ]; then
    export PATH=$HOME/opt/node/bin:$PATH
fi

# Lean
if [[ -d $HOME/opt/elan ]]; then
    export ELAN_HOME=${ELAN_HOME:-$HOME/opt/elan}
fi

() {
    local elan_bin=${ELAN_HOME:-$HOME/.elan}/bin
    if [[ -d $elan_bin ]] || (( $+commands[elan] )); then
        path=($elan_bin $path)
    fi
}


# User bin paths
if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/bin" ]; then
    export PATH="$HOME/bin:$PATH"
fi
