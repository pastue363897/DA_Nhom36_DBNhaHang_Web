/**
 * Created on: 18:03:43 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

public class CTTTBanDatModel {
  private String maMA;
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
