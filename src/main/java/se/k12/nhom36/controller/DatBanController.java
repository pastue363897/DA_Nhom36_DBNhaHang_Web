/**
 * Created on: 23:21:29 11 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import entites.BanAn;
import entites.MonAn;
import se.k12.nhom36.model.CustomerModel;
import se.k12.nhom36.model.TTBanDatModel;
import se.k12.nhom36.service.ManagerBanAnService;
import se.k12.nhom36.service.ManagerBanDatService;
import se.k12.nhom36.service.ManagerMonAnService;

@Controller
public class DatBanController {
  
  @Autowired
  private ManagerMonAnService managerMonAnService;
  @Autowired
  private ManagerBanAnService managerBanAnService;
  @Autowired
  private ManagerBanDatService managerBanDatService;
  
  @RequestMapping(value = "dat-ban")
  public String requestDatBan(@RequestParam(required = false) String maBA, Model model) {
    System.out.println(maBA);
    List<MonAn> danhSachMonAn = managerMonAnService.danhSachMonAn();
    BanAn b = managerBanAnService.layThongTinBanAn(maBA);
    
    model.addAttribute("dsMonAn", danhSachMonAn);
    model.addAttribute("banAn", b);
    return "datban";
  }
  
  @RequestMapping(value = "order", produces = "application/json", method = RequestMethod.POST)
  public @ResponseBody String datBan(@RequestBody(required = false) TTBanDatModel ttBD, HttpSession session) {
    System.out.println(ttBD.toString());
    boolean result = false;
    if (ttBD != null) {
      CustomerModel khachHang = (CustomerModel) session.getAttribute("customer");
      ttBD.setMaKH(khachHang.getMaKH());
      result = managerBanDatService.datBan(ttBD);
    }
    Gson gson = new Gson();
    return gson.toJson(result);
  }
}
