/**
 * Created on: 14:22:13 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import java.sql.Timestamp;
import java.util.List;

import com.google.gson.annotations.JsonAdapter;

public class TTBanDatModel {
  private String maKH;
  private String maBA;
  private List<CTTTBanDatModel> dsMonAn;
  @JsonAdapter(GsonTimestamp.class)
  private Timestamp ngayDat;
  @JsonAdapter(GsonTimestamp.class)
  private Timestamp ngayPhucVu;
  public TTBanDatModel() {
    super();
  }
  public String getMaKH() {
    return maKH;
  }
  public void setMaKH(String maKH) {
    this.maKH = maKH;
  }
  public String getMaBA() {
    return maBA;
  }
  public void setMaBA(String maBA) {
    this.maBA = maBA;
  }
  
  public List<CTTTBanDatModel> getDsMonAn() {
    return dsMonAn;
  }
  public void setDsMonAn(List<CTTTBanDatModel> dsMonAn) {
    this.dsMonAn = dsMonAn;
  }
  public Timestamp getNgayDat() {
    return ngayDat;
  }
  public void setNgayDat(Timestamp ngayDat) {
    this.ngayDat = ngayDat;
  }
  public Timestamp getNgayPhucVu() {
    return ngayPhucVu;
  }
  public void setNgayPhucVu(Timestamp ngayPhucVu) {
    this.ngayPhucVu = ngayPhucVu;
  }
  @Override
  public String toString() {
    return "TTBanDatModel [maKH=" + maKH + ", maBA=" + maBA + ", dsMonAn=" + dsMonAn + ", ngayDat=" + ngayDat
        + ", ngayPhucVu=" + ngayPhucVu + "]";
  }
}
