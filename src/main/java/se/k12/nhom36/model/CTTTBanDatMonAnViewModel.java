/**
 * Created on: 23:54:06 15 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

public class CTTTBanDatMonAnViewModel {
  private MonAnViewModel monAn;
  private int soLuong;
  private long donGia;
  
  public CTTTBanDatMonAnViewModel() {
    super();
  }

  public CTTTBanDatMonAnViewModel(MonAnViewModel monAn, int soLuong, long donGia) {
    super();
    this.monAn = monAn;
    this.soLuong = soLuong;
    this.donGia = donGia;
  }

  public MonAnViewModel getMonAn() {
    return monAn;
  }

  public void setMonAn(MonAnViewModel monAn) {
    this.monAn = monAn;
  }

  public int getSoLuong() {
    return soLuong;
  }

  public void setSoLuong(int soLuong) {
    this.soLuong = soLuong;
  }

  public long getDonGia() {
    return donGia;
  }

  public void setDonGia(long donGia) {
    this.donGia = donGia;
  }
  
  
}
