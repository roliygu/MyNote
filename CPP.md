CPP 
===

程序设计实践笔记
---

###函数指针
* `类型 (*指针变量名)(参数类型1, 参数类型2,...);`
* 例如,快速排序`qsort`的第三个参数就是函数指针

代码

	int min(int a,int b){return a<b;}
	int (*pf)(int, int);
	pf = min;
	pf(1,2) 			//函数指针名(实参表)

* C语言中的qsort函数
	* `void qsort(void *base, int nelem, unsigned int width,int(*pfCompare)(const void *,const void *))`
	* 比较函数编写规则
		* elem1排在elem2前面,返回值为负整数
		* 相等,返回0
		* 排在后面,返回正整数

代码

	int myCompare(const void *elem1, const void *elem2){
		unsigned int *p1,*p2;
		p1 = (unsigned int *)elem1;
		p2 = (unsigned int *)elem2;
		return (*p1 %10)-(*p2 %10);
	}
	#define Num 5
	int main(){
		unsigned int an[Num]={8,123,11,10,4};
		qsort(an, Num,sizeof(unsigned int), myCompare);
		for(int i=0;i<Num;i++)
		printf("%d",an[i]);
		return 0;
	}

###命令行参数
* argc:代表命令行参数的个数,包括程序名;
* argv:指针数组,其中每个元素都是一个`char *`,argv[i]指向第i个参数

代码
	
	int main(int argc, char *argv[]){
		xxx;
	}

###位运算(6种)
* `n = n & 0xffffff00;` 将低8位置成0
* n&=0xff00; n是short型
* `x & 0x80 == 0x80` x的第8位是否为1
* `n ^= 0xff` 低8位取反
* a^b=c 那么 c^b=a,c^a=b
* ~位取反

###引用
* 定义引用时一定要将其初始化成某个变量
* 引用初始化后,不能再改变其引用的对象
* 引用只能引用变量,不能引用常量和表达式
* 常引用:不能通过引用修改原值
* 常量指针:不能通过常量指针修改其指向的内容;不能把常量指针赋值给非常量指针,反过来可以;

###动态内存分配
* int *p = new int;
* int *p = new int[20];
* delete p;释放的只能是new出来的空间
* delete []p;

###函数重载:名字相同,参数个数或参数类型不同

###缺省参数:
	void F(int x, int y=1, int z=2){}

###类
* private
* public
* protected
* 缺省默认为`private`
* 写在类定义内部的函数,成为内联成员函数

####构造函数
* 构造函数中不能用`this`
* Point P
* 构造函数在分配实例的内存之后
* 对象数组的初始化
	Test array[3]={1,Test(1,2)};
	array[0]用Test(1)初始化;array[1]用Test(1,2)初始化;array[2]用Test()初始化
* 初始化列表:`Point(int m, int n):x(m),y(n){};`

####复制构造函数
* Point p(p2)
* 复制构造函数的参数是类的`引用`
* 起作用的三种情况
	1. `Point p(p1)` 或者 `Point p=p1`
	2. 某函数的参数是类的对象,则类的复制构造函数被调用
	3. 函数的返回值是类的对象,函数返回时,复制构造函数被调用

####类型转换构造函数
* `Point P = 11`或`Point P; P=11;`
* Point(int i){x=i;y=0;}
* 可以看到等号右边的`int`被转换成了`Point`
* 需要注意的是,这里会调用一次析构函数,因为转换的步骤是
	* 用类型转换构造函数生成一个`临时`实例`temp`
	* 将temp给P
	* 析构temp

####析构函数
* ~Point(){delet []x;};
* 缺省析构函数不释放用户申请的内存

###因为构造函数和析构函数的不对等(构造函数的方法比析构多),所以构造函数和析构函数处理`全局`/`静态`变量时,需要额外注意

###静态成员
* `static`关键字
* 静态成员变量,所有对象共享
* sizeof不计算静态成员变量
* 静态成员变量需要在(定义类的文件中)声明或初始化
* 静态成员不需要用过对象访问
	* Point::F()
	* Point p; p.F();其他类似的指针和引用皆可
* 静态成员函数中不能访问非静态成员变量和调用非静态成员函数

###友元
* 友元函数:可以访问类的私有成员,声明在类内部
* 友元类:A的友元类B中的任何函数能访问A的私有成员
	* 友元类没有传递和继承关系

