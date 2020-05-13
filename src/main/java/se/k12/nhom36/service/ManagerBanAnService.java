/**
 * Created on: 22:06:55 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entites.BanAn;
import se.k12.nhom36.repository.ManagerBanAnDao;

@Service
public class ManagerBanAnService {
  
  @Autowired
  private ManagerBanAnDao managerBanAnDao;
  public BanAn layThongTinBanAn(String idBA) {
    return managerBanAnDao.getBanAn(idBA);
  }
  public List<BanAn> danhSachBanAnHome() {
    int count = Integer.parseInt("4");
    return managerBanAnDao.getDanhSachBanAnHome(count);
  }
  public List<BanAn> danhSachBanAn() {
    return managerBanAnDao.getDanhSachBanAn();
  }
  
}
