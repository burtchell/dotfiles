# this file sets fish as the default shell, to be called in install.sh

# add fish to shells
echo /home/linux/.linuxbrew/bin/fish | sudo tee -a /etc/shells;

# add homebrew to fish path
fish_add_path /home/linuxbrew/.linuxbrew/bin;

# change shell
chsh -s /home/linuxbrew/.linuxbrew/bin/fish;

# install z via fisher
fisher install jethrokuan/z;
