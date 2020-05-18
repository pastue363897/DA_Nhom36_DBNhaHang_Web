/**
 * Created on: 15:20:46 11 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import entites.BanAn;
import se.k12.nhom36.service.ManagerBanAnService;
import se.k12.nhom36.util.DateUtil;

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
  @RequestMapping(value = "search-banan")
  public String searchBanAn(@RequestParam(name = "moTaBA", required = false) String moTa, @RequestParam(name = "gioBA", required = false) String gio,
      @RequestParam(name = "ngayPhucVuBA", required = false) String ngayPhucVu, @RequestParam(name = "soNguoiBA", defaultValue = "0") int soNguoi, Model model) {
    System.out.println("moTa: " + moTa);
    System.out.println("gio: " + gio);
    System.out.println("ngayPhucVu: " + ngayPhucVu);
    System.out.println("soNguoi: " + soNguoi);
    Timestamp ngayPV = null;
    if (ngayPhucVu != null && !ngayPhucVu.trim().isEmpty()) {
      ngayPhucVu = ngayPhucVu.replaceAll("/", "-");
      if (gio == null || gio.trim().isEmpty()) {
        ngayPhucVu += " 00:00:00";
      } else {
        ngayPhucVu += " " + gio;
      }
      ngayPV = DateUtil.getDate(ngayPhucVu);
    }
    
    List<BanAn> danhSachBanAn = managerBanAnService.timDanhSachBanAn(moTa, gio, ngayPV, soNguoi);
    
    model.addAttribute("dsBanAn", danhSachBanAn);
    
    return "banan";
  }
}
