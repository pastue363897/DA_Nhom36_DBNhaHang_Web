/**
 * Created on: 22:06:55 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.service;

import java.sql.Timestamp;
import java.util.ArrayList;
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
  public int soPageBanAn() {
    int page = managerBanAnDao.getSoBanAn() / 20;
    return managerBanAnDao.getSoBanAn() % 20 == 0 ? page : page + 1;
  }
  public List<BanAn> danhSachBanAn(int page) {
    return managerBanAnDao.getDanhSachBanAn(page);
  }
  public int timDanhSachBanAn(List<BanAn> output, String moTaBA, String gio, Timestamp ngayPhucVu, int soLuong, int page) {
    List<BanAn> ds = managerBanAnDao.searchDanhSachBanAn(moTaBA, gio, ngayPhucVu, soLuong);
    if (ds == null) {
      return 1;
    }
    for (int i = page * 20; i < ds.size(); i++) {
      output.add(ds.get(i));
      if (output.size() == 20) {
        break;
      }
    }
    page = ds.size() / 20;
    return ds.size() % 20 == 0 ? page : page + 1;
  }
  
}
