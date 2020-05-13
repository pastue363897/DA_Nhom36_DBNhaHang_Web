/**
 * Created on: 16:18:38 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class DateUtil {
  public static SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
  public static Timestamp getDate(String date) {
    try {
      return new Timestamp(sdf.parse(date).getTime());
    } catch (ParseException e) {
      e.printStackTrace();
    }
    return null;
  }
}
