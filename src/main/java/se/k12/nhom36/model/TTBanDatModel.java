/**
 * Created on: 14:22:13 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import java.sql.Timestamp;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.google.gson.annotations.JsonAdapter;

public class TTBanDatModel {
  private String maKH;
  @Pattern(regexp = "^(BA)\\d{6}$", message = "Không xác định được bàn ăn đã chọn")
  private String maBA;
  @NotEmpty(message = "Chưa chọn món ăn")
  @Valid
  private List<CTTTBanDatModel> dsMonAn;
  @NotNull(message = "Hệ thống không xác định được thời gian, hãy thử lại sau")
  @JsonAdapter(GsonTimestamp.class)
  private Timestamp ngayDat;
  @NotNull(message = "Thời gian đặt không đúng")
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
