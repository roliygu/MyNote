Android笔记
===

###应用程序权限说明
* 通过在<manifest.../>元素里添加<uses-permission../>子元素声明自身权限
	* <uses-permission android:name="android.permission.CALL_PHONE"/>

###调试
####Android Log
* Log.v() 普通
* Log.d() 调试
* Log.i() 信息
* Log.w() 警告
* Log.e() 错误
* 不同类别,输出的颜色不同
* Log.v(tag, msg)

自定义View的基本实现方法
---
1. 定义一个类，继承View
2. 添加无参构造函数
3. 复写View的onDraw函数[View被显示的过程就调用其onDraw方法]
4. 在onDraw当中使用Canvas和Paint对象绘制图形

View相关的三个基础类
---
###Color
####表示颜色的三个方法
* int Col = Color.bule
* argb四个参数：int Col = Color.argb(a,b,c,d)
* xml文件中定义颜色
	<resources>
		<color name = "ccc">#ffe6f0ff<color>
	</resources>
	
###Paint
####Paint的设置方法
* paint.setColor(Col)
* paint.setAntiAlias()  设定锯齿效果
* paint.setARGB()
* paint.setTextSize()
* paint.setAlpha()  设定透明度
* paint.setStyle()  画笔风格,空心或实心
* paint.setStrokeWidth()  设置空心的边框宽度
* paint.getColor()
* paint.getAlpha()

###Canvas
* canvas.drawCircle(float x, float y, float z, Paint p) (圆心,半径)
* canvas.drawLine(float a, float b, float c, float d, Paint p) (起点(x,y),终点(x,y))
* canvas.drawRect(float left, float top, float right, float bottom, Paint p) (指定的是边界)
* canvas.drawText(String text, float x, float y, Paint p) (x表示左边界,**y表示基准线**)
* canvas.drawBitmap(Bitmap bitmap, float left, float top, Paint p) 绘制图形
	* canvas.drawBitmap(BitmapFactory.decodeResource(getResources(), R.drawable.ic_launcher), 0, 0, paint)

###FontMetrics
* FontMetrics fm = paint.getFontMetrics()
* 让字符在单元格中居中,![如图](/图示/Android/单元格中字符居中.png)
	* top 基线到顶端高度
	* bottom 基线到底端的高度
	* ascent 基线到字符顶部高度
	* descent 基线到字符底部高度
居中调整,如![此图](/图示/Android/调整基线.png)
1. 设定基线为正中间,得到要居中的黄色单元格的ascent和descent
2. 基线向下移动[(ascent-dscent)/2],其他不变,黄色单元格就是居中

###单点触摸事件
点击View的时候就触发onTouchEvent()
View:

	public boolean onTouchEvent(MotionEvent event){
		//  获取事件的种类
		event.getAction();
		// 获取点击的坐标
		event.getX();
		event.getY();
	}
	
###Dialog
* AlertDialog
* 自定义Dialog
* 实现Dialog

