# How to use
This repo uses gnu-stow. To install one specific config use
```
$ stow -v -t $HOME <config>
```

To install everything just execute the install script
```
$ ./install.sh
$ # uninstalling works by executing the uninstall script
$ ./uninstall.sh
```

# Launcher
I use my custom dmenu alternative `launchme`. You can install it via cargo from
crates.io:
`$ cargo install launchme`

# Cargo add-ons
I use cargo-generate:
`$ cargo install cargo-generate`

# Neovim
My neovim config can be found [here](https://github.com/paulfrische/nvim)
