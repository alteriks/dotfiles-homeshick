# Add new key
    $ ssh-keygen -t ed25519 -C `hostname`
    $ cat .ssh/id_ed25519.pub
# dotfiles
    # pacman -Syu git
    
    $ git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
    $ printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.zshrc
    $ source $HOME/.zshrc
    $ homeshick clone git@github.com:alteriks/dotfiles

*OR*
  
    $ cd $HOME/.homesick/repos/dotfiles
    $ git remote set-url origin git@github.com:alteriks/dotfiles

# Neovim plugins 
    # plasticboy/vim-markdown
    open the link under the cursor in the same browser 
```
    gx
```

# Tmux
    # zoom pane 
```
^C-a + z
```    
    # buffer history
    $ ^C-a + =
    
    # select session/window
    $ ^C-a + s
    
    # sync pane
    $ ^C-a + -
    
    
    # on selection
        # copy&paste
        $ Y
        
        # open in $EDITOR 
        $ ^C+o
        
        # rectangle selection
        $ v 
