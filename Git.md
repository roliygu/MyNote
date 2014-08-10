---
layout: post
title:  "Roliy常用的Git命令"
date:   2014-07-24 21:16:53
categories: sf
---

这里是Roliy的Git命令备忘录,不是很适合新手.对于想学Git的爱好者,强烈推荐[版本控制之道](http://book.douban.com/subject/4813786/).你会找到你需要的东西~

###安装之后初始化
	config --global user.name "XXXXXXX"       		  # set username
	config --global user.email "XXXX@XXX.com"   	  # set email
	config --global --list                    		  # 显示全局设置
	config --global color.ui "auto"/"false"/"true"    # 使用不同颜色显示不同类型的内容
	config --global core.editor gvim.exe 			  # 将gvim设置为commit留言调用的编辑器,前提是gvim已经在环境变量里了
	git config --global merge.tool kdiff3
	git config --global mergetool.kdiff3.path "C:\Program Files\KDiff3\kdiff3.exe"

###创建仓库和提交更新
个人理解：Git管理了三个空间,一个是实际硬盘空间/工作区,直接修改源文件的地方;一个是暂存区,也就是执行了add命令之后文件存在的地方;最后一个是版本仓库,也就是使用了commit命令之后文件存在的地方.	
	
	mkdir foldername   				#这个是命令行创建文件夹命令嘛
	cd foldername
	git init          				#在文件夹目录下新建仓库
	git add filename.xx  			#把文件添加到仓库中,前提是该文件在目录下
	git commit -m "add in hello"    #提交更	
	在源文件修改之后使用：
	git status           			#查看修改状态,会有红色标注,这时候使用：
	git add index.html              #再使用git status,文件会变成绿色,这时候使用：
	git commit -m "add <head> and <title> to index"
	add -i 							#进入交互模式,详解
	1:status    2:update    3:revert    4:add untracked
	5:patch		6:diff 		7:quit 		8:help
	add untracked 	#添加未被git跟踪的文件到暂存区
	updata 			#将被修改的文件(已被跟踪)加进暂存区
	revert 			#将暂存区中的文件去掉,相当于取消add操作
	patch 			#针对文件中被修改的块执行添加缓冲区询问和操作
	add -p 			#直接进入patch模式
	git stash 		#将当前工作区的修改推入栈中,工作区还原成最近一次commit的状态			

###分支
	git checkout -b x1 x2           #从x1分支创建x2分支,并切换到x2,与下两条指令合在一起等价
	git branch x1 x2                #从父分支x2创建分支x1，没有使用切换分支指令前，修改源文件,提交：
	git checkout x1                 #切换到之前创建的分支x1,这里认为,切换分支之前的修改提交是作用于“创建了x1分支的x2分支上
									#的”而x1分支则完全是x2分支(未修改)的拷贝.当然,如果修改发生在切换分支之后,则又不一样
									#了.切换到未修改的分支之后,所有源文件将会回复到原来状态.切换分支之后的修改相当于在“回
									#到过去”的原文件上修改.
	git checkout master 			
	git rebase x1                   #将x1分支上的所有提交复制到当前分支上,此命令执行后,当前分支和x1分支一模一样
	git branch -d x1                #然后就可以删除x1分支了,大写D更强力一些
	git branch                      #显示分支名称,带*号的是当前分支
	git tag 1.0 x1                  #第一个参数是版本号,第二个参数是分支名.整个标签的意思是给(截至到目前所有文件修改到)
									#x1分支做一个版本号标记
	git tag                         #查看所有版本号
	git branch x1.1 1.0             #从标签1.0创建分支x1.1
	git merge x2                    #将x2分支的所有修改合并到当前分支
									#原文件状态是X,创建两条分支X1和X2,并在分支上修改,若要将X和X1或X2合并,则OK,若X1和X2分支
									#对同一个文件做了修改,将X1和X2合并时就会产生冲突.
	git mergr --squash x2           #相当于仅把x2分支内容提交到暂存区,之后还需要commit指令提交	
	git branch -m name1 name2       #把name1改成name2,大写的M更强力

###版本回溯
	git revert 版本号				#撤销修改,版本号最好是前一个提交的版本号,这样不用处理冲突...
	git reset --hard 版本号  复位操作

###打包
	git archive --format=zip --prefix=mysite-1.0/1.0 | gzip > mysite-1.0.zip
	git archive --format=tar --prefix=mysite-1.0/1.0 | gzip > mysite-1.0.tar.gz
	#两种打包压缩,第一种压缩成zip第二种压缩成gz;format的参数表明压缩类型,prefix参数表明目标目录,最后一部分表明压缩文件名称

###查看日志
	git log  						#查看修改日志,可以加上'-具体数字'参数表示需要显示的条数
	git log -p                      #按照日志顺序显示版本间差异
	git log number                  #根据哈希码查看日志,前七位即可
	git log --since="5 hours"       #查看5个小时内的提交记录
	git log number1...number2       #查看版本number1到number2之间的版本记录
	git blame file                  #按行输出file,每行前面会写该行提交的版本号和提交者,提交时间等
	git blame -L number1,number2 file #查看num1到num2行的记录

###其他
	文件开始状态为X1,修改之后为X2,此时使用add命令;再次修改源文件,状态为X3;也就是说版本库里文件是X1状态,暂存区文件是X2状态,实际硬盘上是X3状态,使用：
	git diff                      	#将暂存区文件X2和硬盘文件X3做比较
	git diff --cached             	#将暂存区X2和版本库X1做比较
	git diff head                 	#将硬盘X3和版本库X1做比较
	git diff number               	#number是版本号,将当前状态和该版本比较
	git mv name1 name2              #将文件名name1改成name2,相当于(在硬盘上改名,并执行了add指令),但仍需要conmit指令提交到版本库
	初始状态为X,提交之后需要修改X,但是需要把两次修改作为一次提交(比如一些错误比较低级,不想让别人知道)：
	git commit -C head -a -amend
	git reset HEAD                  #复位HEAD提交,相当与删除了最新的一个提交记录,实际文件没有什么变化
	git gc                          #整理版本库,清理一些垃圾,根据提交日志,日志里没有的东西都会被删除.比如,之前复位了一些版本,文件还存在于硬盘上,执行本操作之后就复位的日志记录之后的修改都被删除了.

###设置.gitignore文件
通过设置.gitignore文件来忽略跟踪满足特定规则的文件
Windows下命名为 .gitignore.

	fd1/* 			忽略所有名字是fd1的目录下的全部内容
	filename* 		忽略所有filenameXXX的文件

###冲突
当合并或其他时候就会遇到冲突,下面是某文本块冲突的实例

	xxx
	<<<<< HEAD:filename
		This is an apple
	=====
		This is a banana
	>>>>> filename
	xxx
	一对'<<<<'和'>>>>'将冲突的文本块标记出来,'===='将修改后和修改前分割开

修改量少的话,可以直接依据上面的提示做编辑,复杂的话,使用	 `git mergetool` 打开合并工具,图形化合并文件.

###网络通信

####三种方式
* SSH  git@github.com:roliygu/RoliyOS.git 安全
* git  git://github.com/roliygu/RoliyOS.git 据说速度最快
* HTTP https://github.com/roliygu/RoliyOS.git 需要修改防火墙,不过我用着没改
* pull和fetch的区别,前者从远程仓库取过来并合并到本地分支,后者只是取过来更新远程分支
* pull命令带两个参数,远程版本库名称`origin`即可,合并到本地分支`master`