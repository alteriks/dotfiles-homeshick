# dotfiles
    # pacman -Syu git
    
    $ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    $ printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.zshrc
    $ source $HOME/.zshrc
    $ homeshick clone git@github.com:alteriks/dotfiles
