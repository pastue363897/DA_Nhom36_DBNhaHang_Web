/**
 * Created on: 17:33:02 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import entites.MonAn;
import se.k12.nhom36.repository.ManagerMonAnDao;

@Service
public class ManagerMonAnService {
  @Autowired
  private Environment evm;
  @Autowired
  private ManagerMonAnDao managerMonAnDao;
  
  public List<MonAn> danhSachMonAnHome(){
    int count = Integer.parseInt("20"/* evm.getProperty("monan.visiable-home") */);
    return managerMonAnDao.getDanhSachMonAnHome(count);
  }
  public int soPageMonAn(){
    int page = managerMonAnDao.getSoMonAn() / 20;
    return managerMonAnDao.getSoMonAn() % 20 == 0 ? page : page + 1;
  }
  public List<MonAn> danhSachMonAn(int page){
    return managerMonAnDao.getDanhSachMonAn(page);
  }
  public MonAn thongTinChiTietMonAn(String maMA) {
    return managerMonAnDao.getMonAn(maMA);
  }
  public int timDanhSachMonAn(List<MonAn> output, String tenOrMoTa, long giaTien, int soNguoiAn, int page){
    List<MonAn> ds = managerMonAnDao.searchDanhSachMonAn(tenOrMoTa, giaTien, soNguoiAn);
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
