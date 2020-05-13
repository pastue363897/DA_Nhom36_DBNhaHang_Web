/**
 * Created on: 21:00:47 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.CTTTTBanDatMonAnDAO;
import entites.CTTTBanDatMonAn;

@Repository
public class ManagerCTTTBanDatMonAnDao {
  @Autowired
  private CTTTTBanDatMonAnDAO cTTTTBanDatMonAnDao;
  
  public boolean addCTTTBanDatMonAn(CTTTBanDatMonAn ct) {
    return cTTTTBanDatMonAnDao.saveOrUpdate(ct);
  }
}
