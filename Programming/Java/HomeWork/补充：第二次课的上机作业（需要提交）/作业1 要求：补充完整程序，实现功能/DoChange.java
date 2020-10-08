
/*
 * 课后作业：交换两个数
 */
public class DoChange {
	public static void main(String[] args) {
		int first = 10;   //存储第一个整数
		int second = 8;   //存储第二个整数
		int third;        //中间变量
		
		/*显示互换前的数*/
		System.out.println("输出互换前手中的纸牌：");
		System.out.println("左手中的纸牌： " + first);
		System.out.println("右手中的纸牌： " + second);
		
		/*互换这两个数*/
        first ^= second;
        second ^= first;
        first ^= second;
		/*请补充在这里*/
		
		/*显示互换后的数*/
		System.out.println("\n输出互换后手中的纸牌：");
		System.out.println("左手中的纸牌： " + first);
		System.out.println("右手中的纸牌： " + second);
	}
}
