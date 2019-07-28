# HOW TO INSTALL

1. Clone Project

```
git clone https://github.com/ScofieldNguyen/vimIDE ~/vimIDE
```

2. Create symbolic links

```
rm -rf ~/.vim
rm -rf ~/.vimrc
cd ~/vimIDE
ln -s ~/vimIDE/.vim ~/.vim
ln -s ~/vimIDE/.vimrc ~/.vimrc
ln -s ~/vimIDE/.ignore ~/.ignore
```

3. Install silver searcher (ag)
Mac/os

```
brew install the_silver_searcher
```

Others OS please see [ their documents ]( https://github.com/ggreer/the_silver_searcher )

4. Install universal tags for tagbar.vim

```
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
```

5. Pull plugins

```
cd ~/.vim
git submodule init
git submodule update
```

6. Upgrade a plugin bundle

```
cd ~/.vim/bundle/indentLine
git pull origin master
```

7. Upgrade all bundled plugins

```
git submodule foreach git pull orgin master
```
