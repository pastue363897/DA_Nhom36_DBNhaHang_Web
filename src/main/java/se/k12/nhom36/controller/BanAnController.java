/**
 * Created on: 15:20:46 11 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import entites.BanAn;
import se.k12.nhom36.service.ManagerBanAnService;

@Controller
public class BanAnController {
  @Autowired
  private ManagerBanAnService managerBanAnService;
  
  @RequestMapping(value = "banan")
  public String requestBanAn(Model model) {
    List<BanAn> danhSachBanAn = managerBanAnService.danhSachBanAn();
    
    model.addAttribute("dsBanAn", danhSachBanAn);
    
    return "banan";
  }
}
