/**
 * Created on: 21:51:36 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import javax.validation.constraints.Pattern;

public class CustomerModel {
  private String maKH;
  @Pattern(regexp = "^\\p{L}{1,7}( \\p{L}{1,7}){0,5}$")
  private String hoTen;
  @Pattern(regexp = "^([1-9][0-9]{0,}[A-Z]?)(/([1-9][0-9]{0,}[A-Z]?)){0,5}(( [\\p{L}]{2,7}){1,15}( [1-9][0-9]{0,}[A-Z]?)?,){2,10}(( \\p{L}{2,7}){1,15})$")
  private String diaChi;
  @Pattern(regexp = "^[1-9](\\d{8}|\\d{11})$")
  private String cmnd;
  @Pattern(regexp = "^0[1-9][0-9]{8}$")
  private String sdt;
  @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9_\\.]{5,32}@[a-z0-9]{2,30}(\\.[a-z0-9]{2,4}){1,2}$")
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
