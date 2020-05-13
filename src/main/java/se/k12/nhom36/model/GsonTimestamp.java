/**
 * Created on: 19:11:12 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import java.lang.reflect.Type;
import java.sql.Date;
import java.sql.Timestamp;

import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

import se.k12.nhom36.util.DateUtil;

public class GsonTimestamp implements JsonDeserializer<Timestamp>{

  @Override
  public Timestamp deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
      throws JsonParseException {
    String date = json.getAsString().replaceAll("/", "-");
    return DateUtil.getDate(date);
  }
}
