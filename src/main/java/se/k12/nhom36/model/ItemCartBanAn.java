/**
 * Created on: 17:24:21 19 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

public class ItemCartBanAn {
  private String maBA;
  private String kySoBA;
  private String moTaBA;
  private String hinhAnhBA;
  private int soGhe;
  private long phuGia;
  public ItemCartBanAn() {
    super();
  }
  public ItemCartBanAn(String maBA, String kySoBA, String moTaBA, String hinhAnhBA, int soGhe, long phuGia) {
    super();
    this.maBA = maBA;
    this.kySoBA = kySoBA;
    this.moTaBA = moTaBA;
    this.hinhAnhBA = hinhAnhBA;
    this.soGhe = soGhe;
    this.phuGia = phuGia;
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
  public String getMoTaBA() {
    return moTaBA;
  }
  public void setMoTaBA(String moTaBA) {
    this.moTaBA = moTaBA;
  }
  public String getHinhAnhBA() {
    return hinhAnhBA;
  }
  public void setHinhAnhBA(String hinhAnhBA) {
    this.hinhAnhBA = hinhAnhBA;
  }
  public int getSoGhe() {
    return soGhe;
  }
  public void setSoGhe(int soGhe) {
    this.soGhe = soGhe;
  }
  public long getPhuGia() {
    return phuGia;
  }
  public void setPhuGia(long phuGia) {
    this.phuGia = phuGia;
  }
  
}
