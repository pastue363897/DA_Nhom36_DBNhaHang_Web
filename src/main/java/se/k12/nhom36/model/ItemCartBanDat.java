/**
 * Created on: 17:21:58 19 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import java.sql.Timestamp;
import java.util.List;

import com.google.gson.annotations.JsonAdapter;

public class ItemCartBanDat {
  private ItemCartBanAn banAn;
  private List<ItemCartMonAn> dsMonAn;
  @JsonAdapter(GsonTimestamp.class)
  private Timestamp ngayPhucVu;
  public ItemCartBanDat() {
    super();
  }
  public ItemCartBanDat(ItemCartBanAn banAn, List<ItemCartMonAn> dsMonAn, Timestamp ngayPhucVu) {
    super();
    this.banAn = banAn;
    this.dsMonAn = dsMonAn;
    this.ngayPhucVu = ngayPhucVu;
  }
  public ItemCartBanAn getBanAn() {
    return banAn;
  }
  public void setBanAn(ItemCartBanAn banAn) {
    this.banAn = banAn;
  }
  public List<ItemCartMonAn> getDsMonAn() {
    return dsMonAn;
  }
  public void setDsMonAn(List<ItemCartMonAn> dsMonAn) {
    this.dsMonAn = dsMonAn;
  }
  public Timestamp getNgayPhucVu() {
    return ngayPhucVu;
  }
  public void setNgayPhucVu(Timestamp ngayPhucVu) {
    this.ngayPhucVu = ngayPhucVu;
  }
  
}
