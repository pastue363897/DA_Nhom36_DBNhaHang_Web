/**
 * Created on: 15:05:25 11 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import entites.MonAn;
import se.k12.nhom36.service.ManagerMonAnService;

@Controller
public class MonAnController {
  
  @Autowired
  private ManagerMonAnService managerMonAnService;
  
  @RequestMapping(value = "monan")
  public String requestMonAn(Model model) {
    List<MonAn> danhSachMonAn = managerMonAnService.danhSachMonAn();
    
    model.addAttribute("dsMonAn", danhSachMonAn);
    
    return "monan";
  }
}
