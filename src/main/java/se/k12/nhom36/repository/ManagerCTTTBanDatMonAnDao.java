/**
 * Created on: 21:00:47 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.CTHoaDonBanDatDAO;
import entites.CTHoaDonBanDat;

@Repository
public class ManagerCTTTBanDatMonAnDao {
  @Autowired
  private CTHoaDonBanDatDAO cTTTBanDatMonAnDao;
  
  public boolean addCTTTBanDatMonAn(CTHoaDonBanDat ct) {
    return cTTTBanDatMonAnDao.saveOrUpdate(ct);
  }
//  public List<CTHoaDonBanDat> getDSCTTheoMaBD(String maBD){
//    return cTTTBanDatMonAnDao.getDSCTTBanDatMonAnTheoMaBD(maBD);
//  }
}
