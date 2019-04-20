# HOW TO INSTALL

1. Clone Project

```
git clone https://github.com/ScofieldNguyen/vimIDE ~/.vim
```

2. Create symbolic links

```
ln -s ~/.vim/.vimrc ~/.vimrc
```

3. Pull plugins

```
cd ~/.vim
git submodule init
git submodule update
```

4. Upgrade a plugin bundle

```
cd ~/.vim/bundle/indentLine
git pull origin master
```

5. Upgrade all bundled plugins

```
git submodule foreach git pull orgin master
```
