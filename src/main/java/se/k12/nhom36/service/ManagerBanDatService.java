/**
 * Created on: 14:52:05 13 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entites.Account;
import entites.BanAn;
import entites.CTHoaDonBanDat;
import entites.Customer;
import entites.MonAn;
import enums.ETinhTrangHoaDon;
import entites.HoaDonBanDat;
import se.k12.nhom36.model.BanAnViewModel;
import se.k12.nhom36.model.CTTTBanDatModel;
import se.k12.nhom36.model.CTTTBanDatMonAnViewModel;
import se.k12.nhom36.model.MonAnViewModel;
import se.k12.nhom36.model.TTBanDatModel;
import se.k12.nhom36.model.TTBanDatViewModel;
import se.k12.nhom36.repository.ManagerBanAnDao;
import se.k12.nhom36.repository.ManagerBanDatDao;
import se.k12.nhom36.repository.ManagerCTTTBanDatMonAnDao;
import se.k12.nhom36.repository.ManagerMonAnDao;

@Service
public class ManagerBanDatService {
  @Autowired
  private ManagerBanDatDao managerBanDatDao;
  @Autowired
  private ManagerBanAnDao managerBanAnDao;
  @Autowired
  private ManagerMonAnDao managerMonAnDao;
  @Autowired
  private ManagerCTTTBanDatMonAnDao managerCTTTBanDatMonAnDao;
   
  
  public boolean datBan(TTBanDatModel banDat) {
    Customer khachHang = new Customer();
    Account tk = new Account();
    khachHang.setTaiKhoan(tk);
    khachHang.getTaiKhoan().setMaTK(banDat.getMaKH());
    BanAn banAn = managerBanAnDao.getBanAn(banDat.getMaBA());
    
    HoaDonBanDat ttBanDat = new HoaDonBanDat(khachHang, banDat.getNgayDat(), banDat.getNgayPhucVu(), banAn);
    String maBD = managerBanDatDao.themBanDat(ttBanDat);
    if (maBD == null) {
      return false;
    }
    //long tongTien = banAn.getPhuGia();
    List<CTTTBanDatModel> ds = banDat.getDsMonAn();
    CTHoaDonBanDat detail;
    MonAn monAn;
    for (CTTTBanDatModel ct : ds) {
      monAn = managerMonAnDao.getMonAn(ct.getMaMA());
      detail = new CTHoaDonBanDat(ttBanDat, monAn, ct.getSoLuong(), monAn.getGiaTien());
      managerCTTTBanDatMonAnDao.addCTTTBanDatMonAn(detail);
      //tongTien += monAn.getGiaTien();
    }
    
    return true;
  }
  public List<TTBanDatViewModel> getDSBanDatKH(AtomicInteger pageCountOutput, String maKH, Date ngayPhucVu, ETinhTrangHoaDon tinhTrangHoaDon, int page){
    List<TTBanDatViewModel> ds = null;
    List<HoaDonBanDat> dsBanDat = managerBanDatDao.getDSBanDatKhachHang(maKH, ngayPhucVu, tinhTrangHoaDon);
    if (dsBanDat != null) {
      int pagecount = dsBanDat.size() / 20;
      if (dsBanDat.size() % 2 == 0) {
        pagecount++;
      }
      pageCountOutput.set(pagecount);
      ds = new ArrayList<TTBanDatViewModel>();
      TTBanDatViewModel b;
      BanAnViewModel banAn;
      MonAnViewModel monAn;
      CTTTBanDatMonAnViewModel ct;
      List<CTTTBanDatMonAnViewModel> dsMonAn;
      long tongTien;
      for (int i = page * 20; i < dsBanDat.size(); i++) {
        HoaDonBanDat tt = dsBanDat.get(i);
        banAn = new BanAnViewModel(tt.getBanAn().getMaBA(), tt.getBanAn().getKySoBA(), tt.getBanAn().getSoLuongGhe(), tt.getBanAn().getMotaBA(), tt.getBanAn().getPhuGia(), tt.getBanAn().getHinhAnh());
        dsMonAn = new ArrayList<CTTTBanDatMonAnViewModel>();
        tongTien = banAn.getPhuGia();
        for (CTHoaDonBanDat c : tt.getDsMonAn()) {
          monAn = new MonAnViewModel(c.getMonAn().getTenMA(), c.getMonAn().getNguyenLieu(), c.getMonAn().getMoTaMA(), c.getMonAn().getSoLuongNguoi(), c.getMonAn().getHinhAnhMA(), c.getMonAn().getGiaTien());
          ct = new CTTTBanDatMonAnViewModel(monAn, c.getSoLuong(), c.getDonGia());
          dsMonAn.add(ct);
          tongTien += monAn.getGiaTien();
        }
        b = new TTBanDatViewModel(banAn, tt.getNgayDatBan(), tt.getNgayPhucVu(), dsMonAn, tt.isDaHuy(), tt.isDaThanhToan(), tongTien, tt.getTienDaDua(), tt.getNgayThanhToan());
        ds.add(b);
        if (ds.size() == 20) {
          break;
        }
      }
    }
    return ds;
  }
//  public HoaDonBanDat getBanDat(String maBD) {
//    HoaDonBanDat ttBD = managerBanDatDao.getBanDat(maBD);
//    if (ttBD != null) {
//      List<CTHoaDonBanDat> ds = managerCTTTBanDatMonAnDao.getDSCTTheoMaBD(ttBD.getMaBD());
//      ttBD.setDsMonAn(ds);
//    }
//    return ttBD;
//  }
  public boolean kiemTraBanDaDat(String maBA, Timestamp date) {
    return managerBanDatDao.checkBanDaDat(maBA, date);
  }
  public boolean kiemTraSoLuongMonAnBanDat(String maBA, Timestamp date, int soLuongMonAn) {
    return managerBanDatDao.checkSoLuongMonAnDat(maBA, date, soLuongMonAn);
  }
  public Map<Timestamp, Timestamp> goiYDatBan(String maBA, Date ngayPhucVu) {
    return managerBanDatDao.toolTipDatBan(maBA, ngayPhucVu);
  }
}
