/**
 * Created on: 23:32:14 15 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

public class MonAnViewModel {
  private String tenMA;
  private String nguyenLieu;
  private String moTaMA;
  private int soLuongNguoi;
  private String hinhAnhMA;
  private long giaTien;
  public MonAnViewModel() {
    super();
  }
  public MonAnViewModel(String tenMA, String nguyenLieu, String moTaMA, int soLuongNguoi, String hinhAnhMA,
      long giaTien) {
    super();
    this.tenMA = tenMA;
    this.nguyenLieu = nguyenLieu;
    this.moTaMA = moTaMA;
    this.soLuongNguoi = soLuongNguoi;
    this.hinhAnhMA = hinhAnhMA;
    this.giaTien = giaTien;
  }
  public String getTenMA() {
    return tenMA;
  }
  public void setTenMA(String tenMA) {
    this.tenMA = tenMA;
  }
  public String getNguyenLieu() {
    return nguyenLieu;
  }
  public void setNguyenLieu(String nguyenLieu) {
    this.nguyenLieu = nguyenLieu;
  }
  public String getMoTaMA() {
    return moTaMA;
  }
  public void setMoTaMA(String moTaMA) {
    this.moTaMA = moTaMA;
  }
  public int getSoLuongNguoi() {
    return soLuongNguoi;
  }
  public void setSoLuongNguoi(int soLuongNguoi) {
    this.soLuongNguoi = soLuongNguoi;
  }
  public String getHinhAnhMA() {
    return hinhAnhMA;
  }
  public void setHinhAnhMA(String hinhAnhMA) {
    this.hinhAnhMA = hinhAnhMA;
  }
  public long getGiaTien() {
    return giaTien;
  }
  public void setGiaTien(long giaTien) {
    this.giaTien = giaTien;
  }
  
}
