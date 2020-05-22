/**
 * Created on: 18:03:43 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.Pattern;

public class CTTTBanDatModel {
  @Pattern(regexp = "^(MA)\\d{6}$", message = "Không xác định được món ăn")
  private String maMA;
  @Min(value = 1, message = "Số lượng của một món phải lớn hơn hoặc bằng 1")
  private int soLuong;
  public CTTTBanDatModel() {
    super();
  }
  public CTTTBanDatModel(String maMA, int soLuong) {
    super();
    this.maMA = maMA;
    this.soLuong = soLuong;
  }
  public String getMaMA() {
    return maMA;
  }
  public void setMaMA(String maMA) {
    this.maMA = maMA;
  }
  public int getSoLuong() {
    return soLuong;
  }
  public void setSoLuong(int soLuong) {
    this.soLuong = soLuong;
  }
  
}
