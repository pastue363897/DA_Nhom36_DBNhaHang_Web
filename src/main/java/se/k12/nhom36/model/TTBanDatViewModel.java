/**
 * Created on: 23:34:05 15 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import java.sql.Timestamp;
import java.util.List;

public class TTBanDatViewModel {
  private BanAnViewModel banAn;
  private Timestamp ngayDat;
  private Timestamp ngayPhucVu;
  private List<CTTTBanDatMonAnViewModel> dsMonAn;
  private boolean daHuy;
  public TTBanDatViewModel() {
    super();
  }
  public TTBanDatViewModel(BanAnViewModel banAn, Timestamp ngayDat, Timestamp ngayPhucVu, List<CTTTBanDatMonAnViewModel> dsMonAn,
      boolean daHuy) {
    super();
    this.banAn = banAn;
    this.ngayDat = ngayDat;
    this.ngayPhucVu = ngayPhucVu;
    this.dsMonAn = dsMonAn;
    this.daHuy = daHuy;
  }
  public BanAnViewModel getBanAn() {
    return banAn;
  }
  public void setBanAn(BanAnViewModel banAn) {
    this.banAn = banAn;
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
  public List<CTTTBanDatMonAnViewModel> getDsMonAn() {
    return dsMonAn;
  }
  public void setDsMonAn(List<CTTTBanDatMonAnViewModel> dsMonAn) {
    this.dsMonAn = dsMonAn;
  }
  public boolean isDaHuy() {
    return daHuy;
  }
  public void setDaHuy(boolean daHuy) {
    this.daHuy = daHuy;
  }
  
}
