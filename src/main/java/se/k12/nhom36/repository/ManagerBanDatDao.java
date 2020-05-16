/**
 * Created on: 14:48:46 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.TTBanDatDAO;
import entites.TTBanDat;

@Repository
public class ManagerBanDatDao {
  @Autowired
  private TTBanDatDAO ttBanDatDao;
  
  public String themBanDat(TTBanDat ttBanDat) {
    return ttBanDatDao.addBanDat(ttBanDat);
  }
  public List<TTBanDat> getDSBanDatKhachHang(String maKH) {
    return ttBanDatDao.getDSTTBanDatTheoCustomer(maKH);
  }
  public TTBanDat getBanDat(String maBD) {
    return ttBanDatDao.get(maBD);
  }
  /*
  public boolean capNhatTongTienBanDat(String maBD, long tongTien) {
    return ttBanDatDao.updateTongTien(maBD, tongTien);
  }*/
}
