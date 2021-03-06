GCC和G++
===

GCC
---

* 用法：gcc [选项] 文件...
* 选项：
  * -pass-exit-codes         在某一阶段退出时返回最高的错误码
  * --help                   显示此帮助说明
  * --target-help            显示目标机器特定的命令行选项
  (使用‘-v --help’显示子进程的命令行参数)
  * -dumpspecs               显示所有内建 spec 字符串
  * -dumpversion             显示编译器的版本号
  * -dumpmachine             显示编译器的目标处理器
  * -print-search-dirs       显示编译器的搜索路径
  * -print-libgcc-file-name  显示编译器伴随库的名称
  * -print-file-name=<库>    显示 <库> 的完整路径
  * -print-prog-name=<程序>  显示编译器组件 <程序> 的完整路径
  * -print-multi-directory   显示不同版本 libgcc 的根目录
  * -print-multi-lib         显示命令行选项和多个版本库搜索路径间的映射
  * -print-multi-os-directory 显示操作系统库的相对路径
  * -Wa,<选项>               将逗号分隔的 <选项> 传递给汇编器
  * -Wp,<选项>               将逗号分隔的 <选项> 传递给预处理器
  * -Wl,<选项>               将逗号分隔的 <选项> 传递给链接器
  * -Xassembler <参数>       将 <参数> 传递给汇编器
  * -Xpreprocessor <参数>    将 <参数> 传递给预处理器
  * -Xlinker <参数>          将 <参数> 传递给链接器
  * -combine                 将多个源文件一次性传递给汇编器
  * -save-temps              不删除中间文件
  * -pipe                    使用管道代替临时文件
  * -time                    为每个子进程计时
  * -specs=<文件>            用 <文件> 的内容覆盖内建的 specs 文件
  * -std=<标准>              指定输入源文件遵循的标准
  * --sysroot=<目录>         将 <目录> 作为头文件和库文件的根目录
  * -B <目录>                将 <目录> 添加到编译器的搜索路径中
  * -b <机器>                为 gcc 指定目标机器(如果有安装)
  * -V <版本>                运行指定版本的 gcc(如果有安装)
  * -v                       显示编译器调用的程序
  * -###                     与 -v 类似，但选项被引号括住，并且不执行命令
  * -E                       仅作预处理，不进行编译、汇编和链接
  * -S                       编译到汇编语言，不进行汇编和链接
  * -c                       编译、汇编到目标代码，不进行链接
  * -o <文件>                输出到 <文件>
  * -x <语言>                指定其后输入文件的语言
                           允许的语言包括：c c++ assembler none
                           ‘none’意味着恢复默认行为，即根据文件的扩展名猜测
                           源文件的语言
* 以 -g、-f、-m、-O、-W 或 --param 开头的选项将由 gcc 自动传递给其调用的
 不同子进程。若要向这些进程传递其他选项，必须使用 -W<字母> 选项。
*简明命令
  1. gcc -o hello hello.c
编译并链接为可执行文件，命名为hello
  2. gcc -I/usr/include hello.c /usr/lib/libm.a
-I 包含进头文件，然后编译链接为可执行文件，最后为静态库文件
  3. gcc -c test1.c test2.c  
编译为test1.o 和 test2.o
  4. ar crv mylib.a test1.o test2.o
将.o文件封装进静态库 ranlib mylib.a 使库文件可以使用 创建自己的库文件 不要忘了建立头文件
  5. gcc -o test test.c ./include /usr/local/xxx.so
包含动态库的例子
  6. 当程序找不到库文件的时候，可以改动/etc/ld.so.conf中的配置，然后执行ldconfig来使生效。
ldd XXX 命令可以查询XXX程序所需要的函数库。

G++
---

* g++ a.cpp --save-temps      保存中间文件
* g++ a.cpp             单文件直接编译,输出的目标文件为a.out
* g++ a.cpp -o a          指定输出文件名
* g++ main.cpp source.cpp -o main 实际上存在一个同名的source.h,但是这里不需要特别列出来
* 参数:
  * E                 只进行预处理
  * S                 预处理+编译成汇编代码
  * c                 预处理+汇编+生成obj(也就是说只是不做链接)
  * Wall              允许发出警告
  * werror              把警告当成错误
  * w                 关闭警告
  * v                 显示详细的编译,汇编,连接命令(实际上也看不懂- )