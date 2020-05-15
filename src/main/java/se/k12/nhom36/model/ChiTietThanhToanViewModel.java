/**
 * Created on: 23:41:24 15 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import java.sql.Timestamp;

public class ChiTietThanhToanViewModel {
  private String maHD;
  private long tongTien;
  private long tienDaDua;
  private long tienThoiLai;
  private Timestamp ngayThanhToan;
  public ChiTietThanhToanViewModel() {
    super();
  }
  public ChiTietThanhToanViewModel(String maHD, long tongTien, long tienDaDua, long tienThoiLai,
      Timestamp ngayThanhToan) {
    super();
    this.maHD = maHD;
    this.tongTien = tongTien;
    this.tienDaDua = tienDaDua;
    this.tienThoiLai = tienThoiLai;
    this.ngayThanhToan = ngayThanhToan;
  }
  public String getMaHD() {
    return maHD;
  }
  public void setMaHD(String maHD) {
    this.maHD = maHD;
  }
  public long getTongTien() {
    return tongTien;
  }
  public void setTongTien(long tongTien) {
    this.tongTien = tongTien;
  }
  public long getTienDaDua() {
    return tienDaDua;
  }
  public void setTienDaDua(long tienDaDua) {
    this.tienDaDua = tienDaDua;
  }
  public long getTienThoiLai() {
    return tienThoiLai;
  }
  public void setTienThoiLai(long tienThoiLai) {
    this.tienThoiLai = tienThoiLai;
  }
  public Timestamp getNgayThanhToan() {
    return ngayThanhToan;
  }
  public void setNgayThanhToan(Timestamp ngayThanhToan) {
    this.ngayThanhToan = ngayThanhToan;
  }
  
}
