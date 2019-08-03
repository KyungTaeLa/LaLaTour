package lala.com.a.util;

public class MemberUtil {
	private int count;
	private double grade;
	
	public MemberUtil() {
		// TODO Auto-generated constructor stub
	}

	public MemberUtil(int count, double grade) {
		super();
		this.count = count;
		this.grade = grade;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "MemberUtil [count=" + count + ", grade=" + grade + "]";
	}
	
	
	public static double getAvgGrade(int count, double grade) {
		double avg = grade/count;
			
		return avg;
	}
}
