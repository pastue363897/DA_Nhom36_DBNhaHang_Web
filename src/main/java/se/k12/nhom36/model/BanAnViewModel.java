/**
 * Created on: 23:35:14 15 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

public class BanAnViewModel {
  private String maBA;
  private String kySoBA;
  private int soLuongGhe;
  private String motaBA;
  private long phuGia;
  private String hinhAnh;
  public BanAnViewModel() {
    super();
  }
  public BanAnViewModel(String maBA, String kySoBA, int soLuongGhe, String motaBA, long phuGia, String hinhAnh) {
    super();
    this.maBA = maBA;
    this.kySoBA = kySoBA;
    this.soLuongGhe = soLuongGhe;
    this.motaBA = motaBA;
    this.phuGia = phuGia;
    this.hinhAnh = hinhAnh;
  }
  public String getMaBA() {
    return maBA;
  }
  public void setMaBA(String maBA) {
    this.maBA = maBA;
  }
  public String getKySoBA() {
    return kySoBA;
  }
  public void setKySoBA(String kySoBA) {
    this.kySoBA = kySoBA;
  }
  public int getSoLuongGhe() {
    return soLuongGhe;
  }
  public void setSoLuongGhe(int soLuongGhe) {
    this.soLuongGhe = soLuongGhe;
  }
  public String getMotaBA() {
    return motaBA;
  }
  public void setMotaBA(String motaBA) {
    this.motaBA = motaBA;
  }
  public long getPhuGia() {
    return phuGia;
  }
  public void setPhuGia(long phuGia) {
    this.phuGia = phuGia;
  }
  public String getHinhAnh() {
    return hinhAnh;
  }
  public void setHinhAnh(String hinhAnh) {
    this.hinhAnh = hinhAnh;
  }
  
}
