/**
 * Created on: 14:52:05 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entites.BanAn;
import entites.CTTTBanDatMonAn;
import entites.Customer;
import entites.MonAn;
import entites.TTBanDat;
import se.k12.nhom36.model.CTTTBanDatModel;
import se.k12.nhom36.model.TTBanDatModel;
import se.k12.nhom36.repository.ManagerBanDatDao;
import se.k12.nhom36.repository.ManagerCTTTBanDatMonAnDao;
import se.k12.nhom36.repository.ManagerMonAnDao;

@Service
public class ManagerBanDatService {
  @Autowired
  private ManagerBanDatDao managerBanDatDao;
  @Autowired
  private ManagerMonAnDao managerMonAnDao;
  @Autowired
  private ManagerCTTTBanDatMonAnDao managerCTTTBanDatMonAnDao;
  
  public boolean datBan(TTBanDatModel banDat) {
    Customer khachHang = new Customer();
    khachHang.setMaKH(banDat.getMaKH());
    BanAn banAn = new BanAn();
    banAn.setMaBA(banDat.getMaBA());
    
    TTBanDat ttBanDat = new TTBanDat(khachHang, banDat.getNgayDat(), banDat.getNgayPhucVu(), banAn);
    if (!managerBanDatDao.themBanDat(ttBanDat)) {
      return false;
    }
    List<CTTTBanDatModel> ds = banDat.getDsMonAn();
    CTTTBanDatMonAn detail;
    MonAn monAn;
    for (CTTTBanDatModel ct : ds) {
      monAn = managerMonAnDao.getMonAn(ct.getMaMA());
      detail = new CTTTBanDatMonAn(ttBanDat, monAn, ct.getSoLuong(), monAn.getGiaTien());
      managerCTTTBanDatMonAnDao.addCTTTBanDatMonAn(detail);
    }
    return true;
  }
}
