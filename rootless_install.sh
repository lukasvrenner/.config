#!/usr/bin/sh
# installs everything it can without root

ln -s ~/.config/.bashrc ~/.bashrc
ln -s ~/.config/.bash_profile ~/.bash_profile

# rust
# note: will require user input to complete
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo component add rust-analyzer # LSP

