Shell脚本指南的笔记
====

第一章
---

###echo命令
* 直接加字符串
	* 双引号的字符串：缺点是其中的‘！’需要加‘\’转义
	* 单引号的字符串：缺点是其中的变量不会被解释
	* 没有引号的字符串：其中的‘；’会将字符串分割成多个命令
* 自动添加换行
* 输出带颜色的字符串
	* 字体：黑色30,红色31,绿色32,黄色33,蓝色34,青色36,白色37,重置0
	* 背景：上面对应的数值+10,重置不变
	* echo -e "\e[1;31'This is red text'\e[0m"   要去掉单引号，这里只是示意

###printf命令
* printf "%-5s %-10s %-4s\n" No Name Mark
* No   Name      Mark
* 占位符有：%s，%c，%d，%-4.2f(.2表示保留两位小数）
* 不自动添加换行

###变量和环境变量
* 变量都是字符串类型，用单引号或双引号括上即可
* 切记`var=value`不可写作`var = value`，前者是赋值，后者是判等
* 使用的时候`$var`即可
* 如果只是为了当前Shell脚本添加环境变量的话，以下的命令即可
	* JAVA_HOME=/xxx/xxx
	* export JAVA_HOME
* ${#var}返回var变量的长度

###算术运算
* let操作符,只支持整数
	* no1=4;
	* no2=5;
	* let result=no1+no2
	* let no1++
	* let no1--
	* let no1+=6
	* 所有的运算都要加`let`
* bc程序，将一个字符串通过管道给bc，得到计算结果
	* 再查查资料在补充

###重定向
* echo "this is a sample" > file.txt   添加以后覆盖原文件
* echo "this is a sample" >> file.txt  在原文件后面输出
* cmd xxx 2> err.txt   如果命令返回了错误信息，将被输出到err.txt中
* cmd 2> /dev/null     将命令产生的错误信息传进比特桶
* cmd | tee file1 file2  加上tee以后,输出到多个文件
* cmd | tee -a file     追加模式

###数组
* array_var=(1 2 3 4 5 6)  普通数组用整数做索引
* new_array[0]="test1"    Shell可以不声明直接使用,而且不管outOfIndex
* new_array[1]="test2"
* echo ${new_array[0]}
* echo ${array_var[*]}    打印数组全部值
* echo ${array_var[@]}    同上
* echo ${#array_var[*]}   打印数组长度
* 关联数组,可以用字符串做索引
	1. declare -A ass_array   先声明
	2. ass_array={[apple]=18 [banana]=10}
	3. 或者ass_array[apple]=18
	4. echo "Apple costs ${ass_array[apple]}"
* echo ${!array_var[*]}       列出所有索引

###别名
* alias install='sudo apt-get install'  使用别名来达到命令的作用,存活期仅在当前终端
* 可以添加到~/.bashrc中,每个终端打开都会执行这个文件中命令
* 不安全的环境下,使用命令前加`\`

###终端窗口
* tput cols          得到列数
* tput lines         得到行数
* tput cup x y       移动光标到(x,y)
* tput setb number   number取0到7,设置背景色,基本都没原来好看..
* tput setf number   设置字体颜色,基本也没原来好看
* tput bold  		 字体变粗体

###时间
* data
* data +%s 			转成纪元秒
* Shell中计算命令之间的时间很方便
	start=$(date +%s)
	xxx
	xxx
	end=$(date +%s)
	difference=$(( end - start))

###函数
* 定义函数:注意,没有指定参数的信息
    fname()
    {
        statements;
    }
* 调用/执行函数:
    * fname ;
    * fname arg1 arg2 ;
* 函数中使用参数:
    fname()
    {
        echo $1, $2;
        echo 
        return 0;
    }

###其他
* 通过`$?`获得上一个命令的执行情况,成功执行返回0,否则非零
