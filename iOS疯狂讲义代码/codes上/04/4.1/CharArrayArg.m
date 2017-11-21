//  Created by yeeku on 2013-3-26.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
// 定义一个函数，该函数的形参为两个int型变量
double avg(int array[10])
{
	int sum = 0;
	for(int i = 0 ; i < 10 ; i++)
	{
		sum += array[i];
	}
	return sum / 10.0;
}

int main(int argc , char * argv[])
{
	@autoreleasepool{
		int scores[10];
		// 采用循环读入10个数值作为scores数组元素的值
		NSLog(@"请输入10个成绩：");
		for(int i = 0 ; i < 10 ; i++)
		{
			scanf("%d" , &scores[i]);
		}
		// 采用循环读入10个数值作为第二个数组元素的值
		NSLog(@"平均成绩为：%g" , avg(scores));
	}
}
