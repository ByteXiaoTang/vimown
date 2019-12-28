#!/bin/bash

# 获取平台类型，mac还是linux平台
function get_platform_type()
{
    echo $(uname)
}

# 判断文件是否存在
function is_exist_file()
{
    filename=$1
    if [ -f $filename ]; then
        echo 1
    else
        echo 0
    fi
}

# 更新mac平台字体
function update_fonts_on_mac()
{
    rm -rf ~/Library/Fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/Library/Fonts
}

# 更新linux平台字体
function update_fonts_on_linux()
{
    mkdir -p ~/.local/share/fonts
    rm -rf ~/.local/share/fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
    cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.local/share/fonts

    fc-cache -vf ~/.local/share/fonts
}

# 更新vim插件
function update_vim_plugin()
{
    vim -c "PlugUpdate" -c "q" -c "q"
}

# 拷贝文件
function copy_files()
{
    vimrc_plugins=$HOME"/.vimrc.custom.plugins"
    is_exist=$(is_exist_file $vimrc_plugins)
    if [ $is_exist != 1 ]; then
        cp ${PWD}/.vimrc.custom.plugins ~
    fi

    vimrc_config=$HOME"/.vimrc.custom.config"
    is_exist=$(is_exist_file $vimrc_config)
    if [ $is_exist != 1 ]; then
        cp ${PWD}/.vimrc.custom.config ~
    fi
}

# 打印logo
function print_logo()
{
    color="$(tput setaf 6)"
    normal="$(tput sgr0)"
    printf "${color}"
    echo '        __                __           '
    echo '__   __/_/___ ___  ____  / /_  _______ '
    echo '\ \ / / / __ `__ \/ __ \/ / / / / ___/ '
    echo ' \ V / / / / / / / /_/ / / /_/ (__  )  '
    echo '  \_/_/_/ /_/ /_/ ,___/_/\____/____/   '
    echo '               /_/                     ...is now updated!'
    echo ''
    echo ''
    echo 'Just enjoy it!'
    echo 'p.s. Follow me at https://github.com/chxuan.'
    echo ''
    printf "${normal}"
}

# 在mac更新vimplus
function update_vimplus_on_mac()
{
    git pull origin master
    copy_files
    update_fonts_on_mac
    update_vim_plugin
    print_logo
}

# 在linux更新vimplus
function update_vimplus_on_linux()
{
    git pull origin master
    copy_files
    update_fonts_on_linux
    update_vim_plugin
    print_logo
}

# 获取当前时间戳
function get_now_timestamp()
{
    cur_sec_and_ns=`date '+%s-%N'`
    echo ${cur_sec_and_ns%-*}
}

# main函数
function main()
{
    begin=`get_now_timestamp`

    type=`get_platform_type`
    echo "Platform type: "${type}

    if [ ${type} == "Darwin" ]; then
        update_vimplus_on_mac
    elif [ ${type} == "Linux" ]; then
        update_vimplus_on_linux
    else
        echo "Not support platform type: "${type}
    fi

    end=`get_now_timestamp`
    second=`expr ${end} - ${begin}`
    min=`expr ${second} / 60`
    echo "It takes "${min}" minutes."
}

# 调用main函数
main
