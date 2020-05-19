/**
 * Created on: 17:33:20 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import database.MonAnDAO;
import entites.MonAn;

@Repository
public class ManagerMonAnDao {
  
  @Autowired
  private MonAnDAO monAnDao;
  
  public List<MonAn> getDanhSachMonAnHome(int count){
    return monAnDao.danhSachMonAnHome(count);
  }
  public List<MonAn> getDanhSachMonAn(){
    return monAnDao.danhSachMonAnCoTheDat();
  }
  public MonAn getMonAn(String maMA) {
    return monAnDao.get(maMA);
  }
  public List<MonAn> searchDanhSachMonAn(String tenOrMoTa, long giaTien, int soNguoiAn) {
    return monAnDao.timMonAn(tenOrMoTa, giaTien, soNguoiAn);
  }
  
}
