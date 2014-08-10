Linux
===

###Linux命令
* netstat -s 输出当前关于网络的统计值
* Shell中：export PATH=$PATH:/some/directory 修改终端的环境变量
    * /etc/profile加上这句export PATH=$PATH:/path1:/path2:/pahtn
    * source ./etc/profile 修改系统环境变量
* tar -xf xxx.tar.bz2 解压缩
* ln -s f1 f2 创建f1的软链接到f2,没有-s参数时硬链接
* & 后台执行进程
* cp 复制文件/文件夹，如果目的地文件存在则覆盖，文件夹存在则复制到目录下
    * cp [-R] file1 file2
* mv 移动/重命名文件
    * mv [-f][-i] file1 file         -i表示覆盖前提示,-f表示不提示
* rm 删除文件
    * rm [-f][-i][-R] file 	       参数含义同mv
* apt-get 
    * install xxx
    * remove xxx
    * 下载的文件在/var/cache/apt/archives
* dpkg -i[-r] package.deb 安装和反安装
* ls 文件显示
    * a     显示全部
    * R     递归的显示子文件夹
    * s     文件大小一同显示,以'块'为单位
    * t     以修改的时间戳排序
    * l     详细列表显示
* type gcc 显示gcc命令所在的目录
* locate xxx 查找包含xxx的文件,新文件未被加入数据库的,找不到
* find [文件或目录] [选项]
    * find / -name 'filename'
    * -prune 控制不递归查找
* df   查看磁盘信息 -h显示的信息相对清晰一些
* cmp file1 file2 比较两个文件,相同时没有返回,不同时返回第一个不同的行 

###换源
1. 备份原文件
sudo cp /etc/apt/sources.list /etc/apt/sources.list.old
2. 修改,覆盖/添加新的源地址
sudo vim /etc/apt/sources.list
3. 保存后，更新
sudo apt-get update
备选的源:
Ubuntu 官方更新服务器（欧洲，此为官方源，国内较慢，但无同步延迟问题，电信、移动/铁通、联通等公网用户可以使用)：
deb http://archive.ubuntu.com/ubuntu/ quantal main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ quantal-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ quantal-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ quantal-proposed main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ quantal-backports main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ quantal main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ quantal-security main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ quantal-updates main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ quantal-proposed main restricted universe multiverse
deb-src http://archive.ubuntu.com/ubuntu/ quantal-backports main restricted universe multiverse
网易163更新服务器（广东广州电信/联通千兆双线接入），包含其他开源镜像：
deb http://mirrors.163.com/ubuntu/ quantal main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ quantal-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ quantal-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ quantal-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ quantal-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ quantal main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ quantal-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ quantal-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ quantal-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ quantal-backports main restricted universe multiverse
#中科大
deb http://debian.ustc.edu.cn/ubuntu/ quantal main multiverse restricted universe
deb http://debian.ustc.edu.cn/ubuntu/ quantal-backports main multiverse restricted universe
deb http://debian.ustc.edu.cn/ubuntu/ quantal-proposed main multiverse restricted universe
deb http://debian.ustc.edu.cn/ubuntu/ quantal-security main multiverse restricted universe
deb http://debian.ustc.edu.cn/ubuntu/ quantal-updates main multiverse restricted universe
deb-src http://debian.ustc.edu.cn/ubuntu/ quantal main multiverse restricted universe
deb-src http://debian.ustc.edu.cn/ubuntu/ quantal-backports main multiverse restricted universe
deb-src http://debian.ustc.edu.cn/ubuntu/ quantal-proposed main multiverse restricted universe
deb-src http://debian.ustc.edu.cn/ubuntu/ quantal-security main multiverse restricted universe
deb-src http://debian.ustc.edu.cn/ubuntu/ quantal-updates main multiverse restricted universe

ubuntu配置android环境
1. 官网下载ADT组件
2. 百度网盘下载SDK，目前所知只需要两部分就可以了：platforms/android-**;/system-images/android-**，复制到ADT解压缩后的SDK目录下
3. 安装32位库
    libstdc++.so.6错误
    安装libstdc++6和lib32stdc++6
    解决32位库的方法
sudo apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 lib32z1 
4. 启动虚拟机如果发现没有键盘的话可能是failed to load libgl.so错误
$ sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386  libgl1-mesa-dev g++-multilib mingw32 openjdk-6-jdk tofrodos python-markdown libxml2-utils xsltproc zlib1g-dev:i386
$ sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
链接前记得修改源文件的权限
    
