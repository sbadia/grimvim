# Grimvim

1. Clone this repo to `~/.vim`
2. Install vim-plug
3. Link your vimrc
4. URxvt? https://gist.github.com/1630581 (update font in .Xdefaults)
5. Launch vi and run `:PlugInstall` command
6. Enjoy !

```bash
git clone https://github.com/sbadia/grimvim .vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sv ~/.vim/vimrc ~/.vimrc
vi
:PlugInstall
```
