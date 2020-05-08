/**
 * Created on: 21:51:36 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

public class CustomerModel {
  private String maKH;
  private String hoTen;
  private String diaChi;
  private String cmnd;
  private String sdt;
  private String email;
  public CustomerModel() {
    super();
  }
  public CustomerModel(String maKH, String hoTen, String diaChi, String cmnd, String sdt, String email) {
    super();
    this.maKH = maKH;
    this.hoTen = hoTen;
    this.diaChi = diaChi;
    this.cmnd = cmnd;
    this.sdt = sdt;
    this.email = email;
  }
  public String getMaKH() {
    return maKH;
  }
  public void setMaKH(String maKH) {
    this.maKH = maKH;
  }
  public String getHoTen() {
    return hoTen;
  }
  public void setHoTen(String hoTen) {
    this.hoTen = hoTen;
  }
  public String getDiaChi() {
    return diaChi;
  }
  public void setDiaChi(String diaChi) {
    this.diaChi = diaChi;
  }
  public String getCmnd() {
    return cmnd;
  }
  public void setCmnd(String cmnd) {
    this.cmnd = cmnd;
  }
  public String getSdt() {
    return sdt;
  }
  public void setSdt(String sdt) {
    this.sdt = sdt;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  
}
