/**
 * Created on: 23:21:29 11 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.FutureOrPresent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import entites.BanAn;
import entites.MonAn;
import se.k12.nhom36.model.CustomerModel;
import se.k12.nhom36.model.ItemCartBanDat;
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
    if (maBA == null || !maBA.matches("^(BA)\\d{6}$")) {
      model.addAttribute("codeError", 500);
      model.addAttribute("messageError", "Không xác nhận được yêu cầu đặt bàn ăn, hãy thử lại");
      return "forward:error";
    }
    int pagecount = managerMonAnService.soPageMonAn();
    List<MonAn> danhSachMonAn = managerMonAnService.danhSachMonAn(0);
    BanAn b = managerBanAnService.layThongTinBanAn(maBA);
    
    model.addAttribute("dsMonAn", danhSachMonAn);
    model.addAttribute("banAn", b);
    model.addAttribute("pagecount", pagecount);
    return "datban";
  }
  
  @RequestMapping(value = "order", produces = "application/json", method = RequestMethod.POST)
  public @ResponseBody String datBan(@Valid @RequestBody(required = false) TTBanDatModel ttBD, HttpSession session) {
    System.out.println(ttBD.toString());
    Map<String, Object> message = new HashMap<String, Object>();
    Map<String, Object> error = new HashMap<String, Object>();
    Map<String, Object> info = new HashMap<String, Object>();
    boolean result = false;
    boolean signin = false;
    if (ttBD != null) {
      
      if (!managerBanDatService.kiemTraBanDaDat(ttBD.getMaBA(), ttBD.getNgayPhucVu())) {
        /*if (!managerBanDatService.kiemTraSoLuongMonAnBanDat(ttBD.getMaBA(), ttBD.getNgayPhucVu(),
            ttBD.getDsMonAn().size())) {*/
          Object o = session.getAttribute("account");
          if (o != null) {
            o = session.getAttribute("customer");
            if (o != null) {
              signin = true;
              Object customer = session.getAttribute("customer");
              CustomerModel khachHang = (CustomerModel) customer;
              ttBD.setMaKH(khachHang.getMaKH());
              result = managerBanDatService.datBan(ttBD);
            }
          }
        /*} else {
          info.put("soLuongMonAnQuaLon", true);
        }*/
      } else {
        info.put("dadat", true);
      }
    }
    message.put("result", result);
    message.put("signin", signin);
    message.put("error", error);
    message.put("info", info);
    Gson gson = new Gson();
    return gson.toJson(message);
  }
  
  @RequestMapping(value = "add-shopping-cart", produces = "application/json", method = RequestMethod.POST)
  public @ResponseBody String themBanDatGioHang(@Valid @RequestBody(required = false) ItemCartBanDat itemCart, HttpSession session) {
    System.out.println(itemCart.getNgayPhucVu());
    boolean result = false;
    if (itemCart != null) {
      Object obj = session.getAttribute("cart");
      if (obj != null) {
        List<ItemCartBanDat> cart = (List<ItemCartBanDat>) obj;
        cart.add(itemCart);
      } else {
        List<ItemCartBanDat> cart = new ArrayList<ItemCartBanDat>();
        cart.add(itemCart);
        session.setAttribute("cart", cart);
      }
      result = true;
    }
    Gson gson = new Gson();
    return gson.toJson(result);
  }
  @RequestMapping(value = "remove-shopping-cart")
  public @ResponseBody String xoaBanDatGioHang(@RequestParam(name = "index", defaultValue = "-1") int index, HttpSession session) {
    System.out.println(index);
    boolean result = false;
    if (index >= 0) {
      Object obj = session.getAttribute("cart");
      if (obj != null) {
        List<ItemCartBanDat> cart = (List<ItemCartBanDat>) obj;
        if (index < cart.size()) {
          cart.remove(index);
          result = true;
        }
      }
    }
    Gson gson = new Gson();
    return gson.toJson(result);
  }
  /*
  @RequestMapping(value = "tooltip-datban", method = RequestMethod.POST)
  public @ResponseBody String toolTipDatBan(@RequestParam(name = "maBA") String maBA, @RequestParam(name = "ngayPhucVu") Date ngayPhucVu) {
    Gson gson = new Gson();
    if (maBA == null || !maBA.matches("^(BA)\\d{6}$")) {
      return gson.toJson(false);
    }
    Map<Timestamp, Timestamp> map = managerBanDatService.goiYDatBan(maBA, ngayPhucVu);
    return gson.toJson(map);
  }
  */
}
