#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
    clear
    if test -a scan.txt;then
    echo -e "正在清除历史扫描文件..."
    sleep 2s
    rm -f scan.txt   
    clear
    fi
    echo -e "#############################################################"
    echo -e "#         欢迎使用一键扫CF端口脚本，作者：seal0207        #"
    echo -e "#############################################################"    
    echo -e
    echo -e
    read -p " 请输入需要扫描的IP或者域名：
  " ip
    read -p " 请输入需要扫描的初始端口：
  " portstart
    read -p " 请输入需要扫描的结束端口：
  " portover
    s=`expr $portover - $portstart`
    for ((i=$portstart,j=1;i<=$portover && j<=$s;i++,j++))
    do
    clear
    echo -ne "正在扫描中···请耐心等待！~ 本次扫描端口数量为$s 已经扫描 $j 个端口"
    curl -s $ip:$i --connect-timeout 1 -m 1 | grep "400 The plain HTTP request was sent to HTTPS port" >> scan.txt
    echo "#$i" >> scan.txt
    done
    clear
    echo -e "扫描完毕！"
    sleep 2s
    echo -e "以下为符合端口："
    sed -n '/400/{n;p;}' scan.txt
