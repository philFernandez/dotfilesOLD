###
# Python and rust things are also set (automatically) in ~/.zprofile
###


path=("/Applications/Racket v7.6/bin" $~path)
path=("/usr/local/Cellar/llvm/*/bin" $~path)
path=("/Users/philthy/Documents/Software/latexindent" $~path)
path=("/Users/philthy/Documents/Software/apache-maven-3.6.3/bin" $~path)
path=("/usr/local/mysql-8.0.22-macos10.15-x86_64/bin" $~path)
path=("/usr/local/Cellar/sqlite/*/bin" $~path)
path=("$HOME/.cargo/bin" $~path)
path=("$HOME/.bin" $~path)
path=("$HOME/.local/bin" $~path)  # pipx install executables here
path=("." $~path)

# rbenv shims ------------
# eval "$(rbenv init -)"
# -------------------------

# Pyenv shims -------------
eval "$(pyenv init -)"
# severly slows shell down (doesn't seem to be needed either, works the same without being eval'd)
# eval "$(pyenv virtualenv-init -)"
# -------------------------

eval "$(pip completion --zsh)"

# The ~ in $~path does glob expansion so things with version number dirs can
# be replaced with * and still work after a version update

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home
export CDPATH="$HOME/Source_Code"

