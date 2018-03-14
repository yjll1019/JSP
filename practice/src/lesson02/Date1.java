package lesson02;
/*
 * 작성일 : 2018년 03월 14일
 * 내 용 : java파일에서 날짜 출력하기 
 */
import java.util.Date;
import java.text.SimpleDateFormat;

public class Date1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Date today = new Date();
		
		SimpleDateFormat f1 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		String s1 = f1.format(today);
		System.out.println(s1);
		
        SimpleDateFormat f2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String s2 = f2.format(today);
        System.out.println(s2);

        SimpleDateFormat f3 = new SimpleDateFormat("yy-M-d H:m:s");
        String s3 = f3.format(today);
        System.out.println(s3);       

        //String.format() : 지정된 형식에 따라 개체의 값을 문자열로 변환하여 다른 문자열에 삽입하는 메서드.

	}

}
