/**
 * Created on: 14:48:46 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.TTBanDatDAO;
import entites.TTBanDat;

@Repository
public class ManagerBanDatDao {
  @Autowired
  private TTBanDatDAO ttBanDatDao;
  
  public boolean themBanDat(TTBanDat ttBanDat) {
    return ttBanDatDao.addBanDat(ttBanDat) == null ? false : true;
  }
}
