/**
 * Created on: 21:00:47 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.CTTTBanDatMonAnDAO;
import entites.CTTTBanDatMonAn;

@Repository
public class ManagerCTTTBanDatMonAnDao {
  @Autowired
  private CTTTBanDatMonAnDAO cTTTBanDatMonAnDao;
  
  public boolean addCTTTBanDatMonAn(CTTTBanDatMonAn ct) {
    return cTTTBanDatMonAnDao.saveOrUpdate(ct);
  }
  public List<CTTTBanDatMonAn> getDSCTTheoMaBD(String maBD){
    return cTTTBanDatMonAnDao.getDSCTTBanDatMonAnTheoMaBD(maBD);
  }
}
