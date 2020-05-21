/**
 * Created on: 14:48:46 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.HoaDonBanDatDAO;
import entites.HoaDonBanDat;

@Repository
public class ManagerBanDatDao {
  @Autowired
  private HoaDonBanDatDAO ttBanDatDao;
  
  public String themBanDat(HoaDonBanDat ttBanDat) {
    return ttBanDatDao.addBanDat(ttBanDat);
  }
  public List<HoaDonBanDat> getDSBanDatKhachHang(String maKH) {
    return ttBanDatDao.getDSTTBanDatTheoCustomer(maKH);
  }
//  public HoaDonBanDat getBanDat(String maBD) {
//    return ttBanDatDao.get(maBD);
//  }
  /*
  public boolean capNhatTongTienBanDat(String maBD, long tongTien) {
    return ttBanDatDao.updateTongTien(maBD, tongTien);
  }*/
  public boolean checkBanDaDat(String maBA, Timestamp date) {
    return ttBanDatDao.checkBanDaDat(maBA, date);
  }
  public boolean checkSoLuongMonAnDat(String maBA, Timestamp date, int soLuongMonAn) {
    return ttBanDatDao.checkSoLuongMonAnHoaDonBanDat(maBA, date, soLuongMonAn);
  }
  /**
   * @param maBA
   * @param date
   * @return null ngày chưa có hóa đơn đặt, size() = 0 ngày đã được đặt hết, size() > 0 còn một số khoảng thời gian trống
   */
  public Map<Timestamp, Timestamp> toolTipDatBan(String maBA, Date date) {
    Map<Timestamp, Timestamp> thoiGianTrong = null;
    Map<Timestamp, Timestamp> thoiGianDaDat = ttBanDatDao.thoiGianBanDaDatTrongMotNgay(maBA, date);
    if (thoiGianDaDat != null) {
      thoiGianTrong = new LinkedHashMap<Timestamp, Timestamp>();
      Timestamp[] start = (Timestamp[]) thoiGianDaDat.keySet().toArray(new Timestamp[0]);
      int len = start.length - 1;
      Timestamp s = new Timestamp(date.getYear(), date.getMonth(), date.getDate(), 0, 0, 0, 0);
      boolean c = start[0].after(s);
      boolean h = thoiGianDaDat.get(start[len]).before(new Timestamp(date.getYear(), date.getMonth(), date.getDate(), 23, 30, 0, 0));
      if (c == true || h == true) {
        if (c == true) {
          thoiGianTrong.put(s, new Timestamp(start[0].getTime() + (29 * 60 * 1000)));
        }
        for(int i = 1; i < len; i++) {
          s = thoiGianDaDat.get(start[i]);
          System.out.println(start[i] + " - " + new Timestamp(s.getTime() + (29 * 60 * 1000)));
          if (s.before(start[i + 1])) {
            thoiGianTrong.put(new Timestamp(s.getTime() + (60 * 1000)), new Timestamp(start[i + 1].getTime() + (29 * 60 * 1000)));
          }
        }
        if (h == true) {
          thoiGianTrong.put(new Timestamp(thoiGianDaDat.get(start[len]).getTime() + (60 * 1000)), new Timestamp(date.getYear(), date.getMonth(), date.getDate(), 23, 59, 59, 999999999));
        }
      }
    }
    return thoiGianTrong;
  }
}
