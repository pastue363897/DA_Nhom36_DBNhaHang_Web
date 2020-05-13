/**
 * Created on: 22:02:02 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.BanAnDAO;
import entites.BanAn;

@Repository
public class ManagerBanAnDao {
  
  @Autowired
  private BanAnDAO banAnDao;
  public BanAn getBanAn(String idBA) {
    return banAnDao.get(idBA);
  }
  public List<BanAn> getDanhSachBanAnHome(int count){
    return banAnDao.danhSachBanAnHome(count);
  }
  public List<BanAn> getDanhSachBanAn(){
    return banAnDao.danhSachBanAnCoTheDat();
  }
}
