import java.util.Scanner;
/*
 * 作业：计算银行本息
 */
public class InterestComp {
	public static void main(String[] args) {
		  Scanner input = new Scanner(System.in);
		  System.out.println("请输入本金：");
		 	
		  double pri_amt=Double.parseDouble(input.next()); //本金 
		  //将上面这句注释掉，使用另外一种方法读取一个double类型的值到变量pri_amt

		  double tot_amt=0;//本息总额
		  double rate1y = 2.25/100; //存期1年利率
		  double rate2y = 2.7/100;//存期2年利率
		  double rate3y = 3.24/100;//存期3年利率
		  double rate5y = 3.6/100;//存期5年利率
		  double interest;
		  
		  System.out.println("本金为： " + pri_amt);
		  /*存取一年的利息和本息*/
		  interest = pri_amt * rate1y * 1;
		  tot_amt = pri_amt + interest;
		  System.out.println("\n存取一年后的本息是： " + tot_amt);
		  
          		/*存取两年的利息和本息*/
		  interest = pri_amt * rate2y * 2;
		  tot_amt = pri_amt + interest;
		  System.out.println("\n存取两年后的本息是： " + tot_amt);
		  
          		/*存取三年的利息和本息*/
		  interest = pri_amt * rate3y * 3;
		  tot_amt = pri_amt + interest;
		  System.out.println("\n存取三年后的本息是： " + tot_amt);
		  
          		/*存取五年的利息和本息*/
		  interest = pri_amt * rate5y * 5;
		  tot_amt = pri_amt + interest;
		  System.out.println("\n存取五年后的本息是： " + tot_amt);
	}
}
