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
    int count = Integer.parseInt("10"/* evm.getProperty("monan.visiable-home") */);
    return managerMonAnDao.getDanhSachMonAnHome(count);
  }
  
  
}
