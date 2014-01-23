from numpy import *
a = array([1,2,3,4])
c = array([[1,2,3,4],[4,5,6,7],[7,8,9,10]])
把c看作矩阵的话,形状如下
1 2 3 4
4 5 6 7
7 8 9 10
c.sum(axis=0)->[12,15,18,21]
c.sum(axis=1)->[10,22,34]
array.argsort()             #返回srray升序排序之后的原下标序列
>>>c.shape                  #返回数组的形状,也就是各个纬度的长度                 
(3,4)
>>>c.shape=4,3              #change the shape,but RAM’s address don’t be changed
>>>c
array([[1,2,3],
　　[4,4,5],
　　[6,7,7],
　　[8,9,10]])
>>>c.shape=2,-1               #when someone number is -1,that’s to                              say the number just a placeholder ,                                python while compute the true value
>>>c
array([[1,2,3,4,4,5],
　　[6,7,7,8,9,10]])
>>> arange(0,1,0.1)
array([ 0. ,  0.1,  0.2,  0.3,  0.4,  0.5,  0.6,  0.7,  0.8,  0.9])
>>> linspace(0,1,11)
array([ 0. ,  0.1,  0.2,  0.3,  0.4,  0.5,  0.6,  0.7,  0.8,  0.9,  1. ])
#arange is similar to range,pay a attention on the third parameter in linspace:this function divide [a,b] into c-1 parts
>>> logspace(0,8,9,base=2)
array([   1.,    2.,    4.,    8.,   16.,   32.,   64.,  128.,  256.])
#this function divide  into c-1 parts,this is the geometric progression.
>>> X=array([[1,2],[3,4],[5,6]])
>>> zeros_like(X)
array([[0, 0],
      [0, 0],
      [0, 0]])
#zeros can be instead by ones,empty.
>>> x=arange(1,4,1)
>>> x
array([1, 2, 3])
>>> x[[2,1,0]]
array([3, 2, 1])
#this character only exist in numpy’s array.the character is so cool!!!
 the inside array or list can be instead by any dimensional .
>>> x=random.rand(10)
>>> x
array([ 0.34816436,  0.2339284 ,  0.75925431,  0.19877282,  0.29614562,
        0.0265267 ,  0.92632672,  0.34894374,  0.14326909,  0.95111668])
>>> t=x>0.5
>>> x[t]
array([ 0.75925431,  0.92632672,  0.95111668])
#cool example
>>> a=arange(0,60,10).reshape(-1,1)+arange(0,6)
>>> a
array([[ 0,  1,  2,  3,  4,  5],
       [10, 11, 12, 13, 14, 15],
       [20, 21, 22, 23, 24, 25],
       [30, 31, 32, 33, 34, 35],
       [40, 41, 42, 43, 44, 45],
       [50, 51, 52, 53, 54, 55]])
>>> a[0,3:5]
array([3, 4])
>>> a[4:,4:]
array([[44, 45],
       [54, 55]])
>>> a[:,2]
array([ 2, 12, 22, 32, 42, 52])
>>> a[2::2,::2]
array([[20, 22, 24],
       [40, 42, 44]])
# mul_dimensional read’example
>>> x
array([  0.,   1.,   2.,   3.,   4.,   5.,   6.,   7.,   8.,   9.,  10.])
>>> def chose(x):
	if x>10:
		return 2
	elif x>5:
		return 1
	else:
		return 0
>>> f=frompyfunc(chose,1,1)
>>> f(x)
array([0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1], dtype=object)
#function is single_value_function,we can use frompyfunc(a,b,c) make it to a mul_value_function,just like this example.b is input parameter number of chose(),c is output parameter number. of chose().
>>> a=arange(0,60,10).reshape(-1,1)
>>> a.shape
(6, 1)
>>> b=arange(0,5)
>>> b.shape
(5,)
>>> c=a+b
>>> c
array([[ 0,  1,  2,  3,  4],
       [10, 11, 12, 13, 14],
       [20, 21, 22, 23, 24],
       [30, 31, 32, 33, 34],
       [40, 41, 42, 43, 44],
       [50, 51, 52, 53, 54]])
# this is amazing~~sometime maybe useful~~
>>> a=random.randint(0,10,size=(4,5))
>>> a
array([[3, 9, 9, 5, 2],
       [8, 2, 2, 9, 4],
       [3, 1, 6, 1, 7],
       [5, 2, 3, 9, 5]])
>>> sum(a)
95
>>> sum(a,axis=0)
array([19, 14, 20, 24, 18])
>>> sum(a,axis=1)
array([28, 25, 18, 24])
>>> mean(a)
4.75
>>> mean(a,axis=0)
array([ 4.75,  3.5 ,  5.  ,  6.  ,  4.5 ])
>>> mean(a,axis=1)
array([ 5.6,  5. ,  3.6,  4.8])
>>> a.max()
9
>>> a.max(axis=0)
array([8, 9, 9, 9, 7])
>>> a.max(axis=1)
array([9, 9, 7, 9])
#min also ok
>>> argmax(a)
1
#return the max value’index ,but this index belong to the vector after changed to one_dimensional,
>>> sort(a)
array([[2, 3, 5, 9, 9],
       [2, 2, 4, 8, 9],
       [1, 1, 3, 6, 7],
       [2, 3, 5, 5, 9]])
>>> argsort(a)
array([[4, 0, 3, 1, 2],
       [1, 2, 4, 0, 3],
       [1, 3, 0, 2, 4],
       [1, 2, 0, 4, 3]])
# argsort() return a array of indexes~
>>> median(a)
4.5
>>> median(a,axis=1)
array([ 5.,  4.,  3.,  5.])
# return the median number.while total number is even return the mean of two middle numbers.
>>> a=array([1,-2,1])
>>> p=poly1d(a)
>>> p(1)
0
# p equal 
>>>import matplotlib.pyplot as plt
>>> x=linspace(0,10,1000)
>>> y=sin(x)
>>> z=cos(x**2)
>>> plt.figure(figsize=(8,4))       #create a object,and set up its length 										  and width
>>> plt.plot(x,y,label="$sin(x)$",color="red",linewidth=2)
　　# first and second parameter
　　are x and y’ type. 
>>> plt.plot(x,z,"b--",label="$cos(x^2)$")
>>> plt.xlabel("Time(s)")
>>> plt.ylabel("Volt")
>>> plt.ylim(-1.2,1.2)             #the range of show y
>>> plt.legend()
>>> plt.show()
##
>>> for idx,color in enumerate("rgbyck"):
	plt.subplot(321+idx,axisbg=color)
>>> plt.show()