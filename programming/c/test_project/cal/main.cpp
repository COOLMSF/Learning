#include <iostream>
#include <stdlib.h>
#include <ctime>
#include <conio.h>
using namespace std;
//计算式 数量
int const Num = 100;
//计算式中 最大数
int const MaxNum = 100;
//每题分数
int const PerMark = 1;
//计算结果最大值
int const MaxResult = 100;
//计算结果最小值
int const MinResult = 0;
enum enOp{Add,Subtract,Multiply,Divide};
//将 枚举类型转换为字符类型，以便输出。
char enum2char(enOp op)
{
	switch (op)
	{
		case Add:
			return '+';
		case Subtract:
			return '-';
		case Multiply:
			return 'x';
		case Divide:
			return '/';
	}
	return ' ';
}
//计算生成表达式的正确结果。
int myResult(int left,int right,enOp op)
{
	switch (op)
	{
		case Add:
			return left+right;
		case Subtract:
			return left-right;
		case Multiply:
			return left *right;
		case Divide:
			return left/ right;
	}
	return 0;
}
//检查生成计算式的正确与否。其中 减法结果不能为负数，除法结果不能为小数。
bool checkFormula(int left,int right,enOp op)
{
	switch (op)
	{
		case Add:
		{
			return true;
		}
		case Subtract:
		{
			if(left < right)
				return false;
			return true;
		}
		case Multiply:
		{
			return true;
		}
		case Divide:
		{
			if(right == 0)
				return false;
			if(double(left/right) != double(double(left)/double(right)))
				return false;
			return true;
		}
	}
	return false;
}
//依据给定操作符，生成符合条件的表达式。
void getFormula(int* left,int*right,enOp op)
{
//srand(time(NULL));
	for(;;)
	{
		*left = 1 + rand() % MaxNum;
		*right = 1 + rand() % MaxNum;
		if(checkFormula(*left,*right,op) && myResult(*left,*right,op)<= MaxResult && myResult(*left,*right,op)>= MinResult)
			break;
	}
}
int main()
{
	// time_t init
	time_t tm_start;
	time_t tm_stop;

	// Struct time init
	// struct tm *struct_tm_start;
	// struct tm *struct_tm_stop;

	time(&tm_start);
	// struct_tm_start = localtime(&tm_start);

//操作符左值
	int left[Num];
//操作符右值
	int right[Num];
//用户输入计算结果
	int result[Num];
//操作符 +-*/
	enOp oper[Num];
//正确答案个数
	int answerRight = 0;
	cout<<"正在生成，请稍等。"<<endl;
//随机种子
	srand(time(NULL));
//开始生成计算表达式。
	for(int i = 0;i<Num;i++)
	{
//srand( (unsigned)time(NULL));
//操作符
		oper[i] = enOp(rand()%4);
		getFormula(&left[i],&right[i],oper[i]);
	}
	cout<<"生成计算式完成，开始答题！"<<endl;
//输出表达式，让用户答题
	for(int i = 0;i<Num;i++)
	{
//输出表达式
		cout<<"第 "<<i+1<<" 题： \n";
		cout<<left[i]<<' '<<enum2char(oper[i])<<' '<<right[i]<< " = ";
//获取用户答案
		cin>>result[i];
//比对用户答案是否正确，正确输出 right,answerRigth加一，否则输出not correct。
		if(result[i] == myResult(left[i],right[i],oper[i]))
		{
			cout<<"Right!\n";
			answerRight++;
		}
		else
		{
			cout<<"Not correct!\n";
		}
	}

	// Get end time
	time(&tm_stop);
	// struct_tm_stop = localtime(&tm_stop);

//全部答题完毕，输出正确答案个数及得分。
	cout<<"终止答题，共 "<<Num<<" 题，每题 "<<PerMark<<" 分 ，答对 "<<answerRight<<" 题，得分 ："
	    <<answerRight*PerMark<<" 分。";

	// Print used time
	cout<<"花费时间:"<< tm_stop - tm_start <<"秒";

	getch();
	return 0;
}
