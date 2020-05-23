/**
 * Created on: 22:06:55 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

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
    int count = Integer.parseInt("10");
    return managerBanAnDao.getDanhSachBanAnHome(count);
  }
  public List<BanAn> danhSachBanAn() {
    return managerBanAnDao.getDanhSachBanAn();
  }
  public List<BanAn> timDanhSachBanAn(String moTaBA, String gio, Timestamp ngayPhucVu, int soLuong) {
    return managerBanAnDao.searchDanhSachBanAn(moTaBA, gio, ngayPhucVu, soLuong);
  }
  
}
