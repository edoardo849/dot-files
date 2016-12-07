
# GoLang
export GOPATH=$HOME/Development/go

# Ruby
export RUBYPATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin

# Terraform
export TERRAFORM=$HOME/.terraform

# Rust
export RUST_SRC_PATH="$HOME/src/rust/src"

# PATH
export PATH="$HOME/.cargo/bin:$GOPATH/bin:/usr/local/go/bin:$TERRAFORM:$RUBYPATH:$PATH"

