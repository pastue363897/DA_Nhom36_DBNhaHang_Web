/**
 * Created on: 10:53:11 10 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.util.List;

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
  public String requestManger() {
    return "manager";
  }
  @RequestMapping(value = "update-account", produces = "application/json", method = RequestMethod.POST)
  public @ResponseBody String requestUpdateAccount(@RequestBody(required = false) AccountModel account, HttpSession session) {
    AccountModel ac = (AccountModel) session.getAttribute("account");
    boolean result = managerUserService.updateAccount(account, ac.getUsername());
    if (result) {
      session.removeAttribute("account");
      session.setAttribute("account", account);
    }
    Gson gson = new Gson();
    return gson.toJson(result);
  }
  @RequestMapping(value = "update-user", produces = "application/json", method = RequestMethod.POST)
  public @ResponseBody String requestUpdateUser(@RequestBody(required = false) CustomerModel customer, HttpSession session) {
    CustomerModel c = (CustomerModel) session.getAttribute("customer");
    customer.setMaKH(c.getMaKH());
    boolean result = managerUserService.updateCustomer(customer);
    if (result) {
      c.setHoTen(customer.getHoTen());
      c.setDiaChi(customer.getDiaChi());
      c.setCmnd(customer.getCmnd());
      c.setSdt(customer.getSdt());
      c.setEmail(customer.getEmail());
      session.removeAttribute("customer");
      session.setAttribute("customer", c);
    }
    Gson gson = new Gson();
    return gson.toJson(result);
  }
  @RequestMapping(value = "danhsach-bandat", method = RequestMethod.POST)
  public @ResponseBody String danhSachTTBanDat(HttpSession session) {
    CustomerModel customer = (CustomerModel) session.getAttribute("customer");
    List<TTBanDatViewModel> dsBD = managerBanDatService.getDSBanDatKH(customer.getMaKH());
    Gson gson = new Gson();
    return gson.toJson(dsBD);
  }
  @RequestMapping(value = "chitiet-ttbandat/{maBD}", method = RequestMethod.POST)
  public @ResponseBody String detailTTBanDat(@PathVariable("maBD") String maBD) {
    HoaDonBanDat ttBD = managerBanDatService.getBanDat(maBD);
    Gson gson = new Gson();
    return gson.toJson(ttBD);
  }
}
