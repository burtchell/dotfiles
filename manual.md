## Manual Installation

Install the following packages with homebrew:

```
brew install oh-my-posh neofetch gh exa fish fisher
```

1. [oh-my-posh](https://ohmyposh.dev/)
1. [neofetch](https://github.com/dylanaraps/neofetch)
1. [GitHub CLI](https://github.com/cli/cli)
1. [exa (modernized ls)](https://github.com/ogham/exa) (as of 2021/04/27: install using macOS homebrew instructions)
1. [fish](https://fishshell.com)
1. [fisher](https://github.com/jorgebucaran/fisher)

To set fish as the default shell, run the following commands

```
echo /home/linuxbrew/.linuxbrew/bin/fish | sudo tee -a /etc/shells;
fish
fish_add_path /home/linuxbrew/.linuxbrew/bin
chsh -s /home/linuxbrew/.linuxbrew/bin/fish
```

If fish isn't the default shell after a terminal reload, ensure it is after a full restart. If nothing else works, as a last resort, add `fish` to the end of `.profile`.

Lastly, install [z (cd history)](https://github.com/jethrokuan/z):

```
fisher install jethrokuan/z
```

Run the following command to create symbolic links to the dotfiles in this repo. Follow the prompts to optionally make backups of preexisting dotfiles (saved in ~/dotfiles-backups):

```
bash ~/dotfiles/scripts/linkfiles.sh
```
