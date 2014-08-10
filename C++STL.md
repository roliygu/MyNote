CPP-STL
===

Algorithms
---

* `*it adjacent_find(it1,it2[,fun])`:从[it1,it2)中找到第一次相邻两个相同的第一个元素的指针,判等的函数(bool)可作为第三个参数,找不到返回最后元素的指针(所以,使用结果前判断是否是end)
* `void sort(it1,it2[,fun])`,排序[it1,it2),比较函数可自定义,返回值为bool
* `bool binary_search(it1,it2,item[,fun])`,序列需要先排序,返回是否找到
* `int count_if (it1, it2,fun)` 返回[t1,t2)间满足fun的个数
* `copy (it1,it2,it3)` 将[it1,it2)copy到以it3为开头的地方
* `fill(it1,it2,item)` 用item刷新[it1,it2)
* `fill_n (it1,n,item)` 第二个参数n表示连续n个元素被刷新   
* `it find(it1,it2,item)`返回[it1,it2)中为item的元素指针  
* `it find_if(it1,it2,fun)` fun为自定义bool函数 
* `for_each (it1, it2, fun)`
* `max_element(it1, it2,fun)`
* `min_element(it1, it2,fun)`
* `merge (it1,it2,it3,it4,it5[,fun])`,设想归并排序的merge,(it1,it2)和(it3,it4)分别是两个序列的头尾,it5是目标指针,fum是自定义比较函数
* `make_heap(it1,it2),pop_heap(it1,it2),sort_heap(it1,it2),push_heap(item)`
	* make_heapshi使得[it1,it2)满足最大堆性质;
	* pop_heap()将堆顶元素放到序列的最后,并维持堆性质;
	* push_heap也是将元素push后自动维护堆性质;sort_heap就是堆排序;
	* push_heap(),pop_heap(),make_heap(),sort_heap(都可以自带比较函数)

math.h
---

* pow(a,b)//ab类型一样,double
* sqrt(a)//a是double
* ceil(a),floor(a)//上下取整,a是double

bitset
---

* bitset<n> b 						b的n位全为0
* bitset<n> b(s[,pos,n])				s是string对象,若s是"1100",则b对应是[0011],b的地位对应低阶,额外的参数指明了开始的位置和连续的位数
* b.any()								存在至少一个1?
* b.none()							一个1都不存在?
* b.count()							b中1的个数
* b.size(),b[pos],b.to_string()
* b.test(pos)							b[pos]是否为1
* b.set([pos]),b.reset([pos]),b.flip([pos])//对b置1,置0,取反,带参数时指明下标

string:
---

* s.append(s1) 							s1可以是string也可以是char*
* s.substr(pos,n)
* s.replace(pos,len,s1)
* s.find(s1,pos) 							从pos位置开始查找s1,返回第一次的位置
* s.rfind(s1,pos) 						返回最后一次的位置
* s.find_first_of(s1,pos) 				匹配s1中的任意字符,返回第一次匹配的位置
* s.find_last_of(s1,pos)

map:
---

* pair:
	* make_pair(a,b) 				生成(a,b),用作函数参数比较方便
	* F(pair<int,float> T)
	* 调用的时候就可以直接写作
	* F(make_pair(1,1.2))
	* pair<int,float>(1,1.2)