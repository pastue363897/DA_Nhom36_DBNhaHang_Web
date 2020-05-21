/**
 * Created on: 10:53:11 10 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entites.HoaDonBanDat;
import se.k12.nhom36.model.AccountModel;
import se.k12.nhom36.model.CustomerModel;
import se.k12.nhom36.model.ItemCartBanDat;
import se.k12.nhom36.model.TTBanDatModel;
import se.k12.nhom36.model.TTBanDatViewModel;
import se.k12.nhom36.service.ManagerBanDatService;
import se.k12.nhom36.service.ManagerUserService;

@Controller
public class ManagerController {
  
  @Autowired
  private ManagerUserService managerUserService;
  @Autowired
  private ManagerBanDatService managerBanDatService;
  
  @RequestMapping(value = "user-manager")
  public String requestManger(HttpSession session) {
    Object o = session.getAttribute("account");
    if (o != null) {
      o = session.getAttribute("customer");
      if (o != null) {
        return "manager";
      }
    }
    return "forward:sign-in";
  }
  @RequestMapping(value = "update-account", produces = "application/json", method = RequestMethod.POST)
  public @ResponseBody String requestUpdateAccount(@RequestBody(required = false) AccountModel account, HttpSession session) {
    Map<String, Object> message = new HashMap<String, Object>();
    Map<String, Object> error = new HashMap<String, Object>();
    boolean result = false;
    boolean signin = false;
    Object o = session.getAttribute("account");
    if (o != null) {
      o = session.getAttribute("customer");
      if (o != null) {
        signin = true;
        
        //kiem ta du lieu dau vao
        
        AccountModel ac = (AccountModel) session.getAttribute("account");
        result = managerUserService.updateAccount(account, ac.getUsername());
        if (result) {
          session.removeAttribute("account");
          session.setAttribute("account", account);
        }
      }
    }
    message.put("result", result);
    message.put("signin", signin);
    message.put("error", error);
    Gson gson = new Gson();
    return gson.toJson(message);
  }
  @RequestMapping(value = "update-user", produces = "application/json", method = RequestMethod.POST)
  public @ResponseBody String requestUpdateUser(@RequestBody(required = false) CustomerModel customer, HttpSession session) {
    Map<String, Object> message = new HashMap<String, Object>();
    Map<String, Object> error = new HashMap<String, Object>();
    boolean result = false;
    boolean signin = false;
    Object o = session.getAttribute("account");
    if (o != null) {
      o = session.getAttribute("customer");
      if (o != null) {
        signin = true;
        
        //kiem ta du lieu dau vao
        
        CustomerModel c = (CustomerModel) session.getAttribute("customer");
        customer.setMaKH(c.getMaKH());
        result = managerUserService.updateCustomer(customer);
        if (result) {
          c.setHoTen(customer.getHoTen());
          c.setDiaChi(customer.getDiaChi());
          c.setCmnd(customer.getCmnd());
          c.setSdt(customer.getSdt());
          c.setEmail(customer.getEmail());
          session.removeAttribute("customer");
          session.setAttribute("customer", c);
        }
      }
    }
    message.put("result", result);
    message.put("signin", signin);
    message.put("error", error);
    Gson gson = new Gson();
    return gson.toJson(message);
  }
  @RequestMapping(value = "danhsach-bandat", method = RequestMethod.POST)
  public @ResponseBody String danhSachTTBanDat(HttpSession session) {
    Map<String, Object> message = new HashMap<String, Object>();
    boolean result = false;
    List<TTBanDatViewModel> dsBD = null;
    Object o = session.getAttribute("account");
    if (o != null) {
      o = session.getAttribute("customer");
      if (o != null) {
        result = true;
        CustomerModel customer = (CustomerModel) session.getAttribute("customer");
        dsBD = managerBanDatService.getDSBanDatKH(customer.getMaKH());
      }
    }
    message.put("result", result);
    message.put("dsBD", dsBD);
    Gson gson = new Gson();
    return gson.toJson(message);
  }
//  @RequestMapping(value = "chitiet-ttbandat/{maBD}", method = RequestMethod.POST)
//  public @ResponseBody String detailTTBanDat(@PathVariable("maBD") String maBD) {
//    HoaDonBanDat ttBD = managerBanDatService.getBanDat(maBD);
//    Gson gson = new Gson();
//    return gson.toJson(ttBD);
//  }
  @RequestMapping(value = "shopping-cart")
  public @ResponseBody String shoppingCart(HttpSession session) {
    Object obj = session.getAttribute("cart");
    List<ItemCartBanDat> cart = null;
    if (obj != null) {
      cart = (List<ItemCartBanDat>) obj;
    }
    Gson gson = new Gson();
    return gson.toJson(cart);
  }
}
