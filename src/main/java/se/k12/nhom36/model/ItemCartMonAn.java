/**
 * Created on: 17:24:11 19 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

public class ItemCartMonAn {
  private String maMA;
  private String tenMA;
  private String hinhAnh;
  private int soLuong;
  private long giaTien;
  public ItemCartMonAn() {
    super();
  }
  public ItemCartMonAn(String maMA, String tenMA, String hinhAnh, int soLuong, long giaTien) {
    super();
    this.maMA = maMA;
    this.tenMA = tenMA;
    this.hinhAnh = hinhAnh;
    this.soLuong = soLuong;
    this.giaTien = giaTien;
  }
  public String getMaMA() {
    return maMA;
  }
  public void setMaMA(String maMA) {
    this.maMA = maMA;
  }
  public String getTenMA() {
    return tenMA;
  }
  public void setTenMA(String tenMA) {
    this.tenMA = tenMA;
  }
  public String getHinhAnh() {
    return hinhAnh;
  }
  public void setHinhAnh(String hinhAnh) {
    this.hinhAnh = hinhAnh;
  }
  public int getSoLuong() {
    return soLuong;
  }
  public void setSoLuong(int soLuong) {
    this.soLuong = soLuong;
  }
  public long getGiaTien() {
    return giaTien;
  }
  public void setGiaTien(long giaTien) {
    this.giaTien = giaTien;
  }
  
}
