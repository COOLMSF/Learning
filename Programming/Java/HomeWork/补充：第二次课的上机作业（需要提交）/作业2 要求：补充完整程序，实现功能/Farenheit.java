import java.util.Scanner;
import java.io.*;

/**
 * 课后作业：计算温度
 */
public class Farenheit {
	public static void main(String[] args) {
		

		System.out.println("请输入当前的华氏温度：");
		
		/*定义double型的变量f，从键盘读入数据到f*/
        double f;
        Scanner scan = new Scanner(System.in);
        f = scan.nextDouble();
		/*补充完成这个功能*/

		double c;

		c = 5/9.0 * (f-32); //转换

		/*显示结果*/
		System.out.println("\n当前的摄氏温度是: " + c);
	}
}
