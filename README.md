![vimplus-logo][1]

An automatic configuration program for vim
===============================================

## 安装

#### 安装vimplus

    git clone https://github.com/chxuan/vimplus.git ~/.vimplus
    cd ~/.vimplus
    ./install.sh
    
#### 设置Nerd Font

为防止vimplus显示乱码，需设置mac终端字体为`Droid Sans Mono Nerd Font`。

#### 更新vimplus

紧跟vimplus的步伐，尝鲜新特性

    ./update.sh
    
#### 安装vimplus

    git clone https://github.com/chxuan/vimplus.git ~/.vimplus
    cd ~/.vimplus
    ./install.sh //不加sudo
    
#### 设置Nerd Font

为防止vimplus显示乱码，需设置linux终端字体为`Droid Sans Mono Nerd Font`。   

## 自定义

> * [~/.vimrc][82]为vimplus的默认配置，一般不做修改


## 插件列表

| 插件                                | 说明                                                                           |
| -------                             | -----                                                                          |
| [tagbar][74]                        | 使用[majutsushi/tagbar][13]的v2.3版本，[taglist][14]的替代品，显示类/方法/变量 |
| [vim-plug][4]                       | 比[Vundle][54]下载更快的插件管理软件                                           |
| [YouCompleteMe][5]                  | 史上最强大的基于语义的自动补全插件，支持C/C++、C#、Python、PHP等语言           |
| [NerdTree][6]                       | 代码资源管理器                                                                 |
| [vim-surround][16]                  | 自动增加、替换配对符的插件                                                     |
| [vim-commentary][17]                | 快速注释代码插件                                                               |



## 快捷键

## FAQ

- **`vimplus安装脚本会在自己电脑上安装哪些软件？`**

    网络良好情况下，vimplus只需30分钟左右即可将vim cpp环境配置好，vimplus真正的做到了一键配置，不让用户操心。vimplus会安装一些必备软件，比如说python、cmake、gcc、fontconfig等，vimplus也考虑到了有些系统的vim不支持python，它会自动去下载vim源码将python支持编译进去，vimplus也会安装nerd-font不让vim显示出现乱码，最最重要的是vimplus实现了ycm自动编译安装，给折腾了几天ycm都没有安装好的用户带来了新的希望，而且vimplus也支持macos和linux众多发行版，让linux发烧友频繁切换发行版而不用操心vim环境配置。最后说了这么多，不如看[vimplus安装脚本][78]来的直接:smile:。

- **`启动vim报错：RequestsDependencyWarning: Old version of cryptography ([1, 2, 3]) may cause slowdown.`**

    可以尝试将cryptography删掉，具体见[issues #208][81]。

- **`vimplus不支持目前用户正在使用的系统怎么办？`**

    可以给作者提[Issues][39]，或者自己fork vimplus来修改，并提交pr，贡献自己的一份力量。

- **`安装vimplus后Airline等插件有乱码，怎么解决？`**

    linux和mac系统需设置终端字体为`Droid Sans Mono Nerd Font`。

- **`xshell连接远程主机不能使用vim-devicons或乱码。`**

    windows系统安装[Nerd Font][51]字体后并更改xshell字体即可。

- **`ubuntu18.04安装了nerd font但通过终端属性并没有看到该字体。`**

    可以试试dconf-editor软件来设置，可以参考[这里][76]。

- **`使用第三方库时怎么让ycm补全第三方库API？`**

    vimplus安装完毕之后，`~`目录下将会生成两个隐藏文件分别是.vimrc和.ycm_extra_conf.py，其中.vimrc是vim的配置文件，.ycm_extra_conf.py是ycm插件的配置文件，当你需要创建一个project时，需要将.ycm_extra_conf.py拷贝到project的顶层目录，通过修改该配置文件里面的`flags`变量来添加你的第三方库路径。

- **`怎么自定义文件头，比如说添加作者、创建时间？`**

    你可以修改[chxuan/prepare-code][67]插件来达到目的，可以参考[这里][77]。

- **`安装vimplus在“[ 95%] Building CXX object ycm/CMakeFiles/ycm_core.dir/ycm_core.cpp.o”等进度时出现编译报错`**

    编译ycm需要消耗较大内存，建议内存大于1G，实在不行也可以开启linux swap分区。

- **`以上没有我遇到的问题怎么办？`**

    您可以通过上网找解决方法，或提[Issues][39]，也可以通过加QQ`787280310`、发邮件方式`787280310@qq.com`一起讨论解决方法。

- **`vimplus用起来真的太棒了，怎么办？`**

    那就麻烦您打赏一颗:star::star:吧，给予我继续维护的动力。


## 代码贡献者

## vimplus:star:趋势图

## License
