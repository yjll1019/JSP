package jdbc;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ParseUtils {
	static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    static SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    static SimpleDateFormat datetimeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static int parseInt(String s, int defaultValue) {
        try {
            return Integer.parseInt(s);
        } catch (Exception e) {
        }
        return defaultValue;
    }//에러나면 디폴트에러 안나면 파싱한 것 리턴

    public static double parseDouble(String s, double defaultValue) {
        try {
            return Double.parseDouble(s);
        } catch (Exception e) {
        }
        return defaultValue;
    }

    public static Date parseDate(String s, Date defaultValue) { //매개변수로 받은 s를 dataFormat형식으로 바꾸겠다.StudentDAO.java
        try {
            return dateFormat.parse(s);
        } catch (Exception e) {
        }
        return defaultValue;
    }

    public static Date parseTime(String s, Date defaultValue) {
        try {
            return timeFormat.parse(s);
        } catch (Exception e) {
        }
        return defaultValue;
    }

    public static Date parseDatetime(String s, Date defaultValue) {
        try {
            return datetimeFormat.parse(s);
        } catch (Exception e) {
        }
        return defaultValue;
    }

}
