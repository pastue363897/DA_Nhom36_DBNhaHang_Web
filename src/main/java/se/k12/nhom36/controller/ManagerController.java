/**
 * Created on: 10:53:11 10 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import entites.HoaDonBanDat;
import enums.ETinhTrangHoaDon;
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
        
        if (account != null) {
          if (account.getUsername() != null && account.getUsername().matches("^[a-zA-Z][a-zA-Z0-9]{2,19}$")) {
            if (account.getPassword() != null && account.getPassword().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,20}$")) {
              AccountModel ac = (AccountModel) session.getAttribute("account");
              result = managerUserService.updateAccount(account, ac.getUsername());
              if (result) {
                session.removeAttribute("account");
                session.setAttribute("account", account);
              }
            } else {
              error.put("password", false);
            }
          } else {
            error.put("username", false);
            if (account.getPassword() == null || !account.getPassword().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,20}$")) {
              error.put("password", false);
            }
          }
        } else {
          error.put("account", false);
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
        
        if (customer != null) {
          boolean check = true;
          if (customer.getHoTen() == null || !customer.getHoTen().matches("^\\p{L}{1,7}( \\p{L}{1,7}){0,5}$")) {
            error.put("hoTen", false);
            check = false;
          }
          if (customer.getDiaChi() == null || !customer.getDiaChi().matches("^([1-9][0-9]{0,}[A-Z]?)(/([1-9][0-9]{0,}[A-Z]?)){0,5}(( [\\p{L}]{2,7}){1,15}( [1-9][0-9]{0,}[A-Z]?)?,){2,10}(( \\p{L}{2,7}){1,15})$")) {
            error.put("diaChi", false);
            check = false;
          }
          if (customer.getCmnd() == null || !customer.getCmnd().matches("^[0-9](\\d{8}|\\d{11})$")) {
            error.put("cmnd", false);
            check = false;
          }
          if (customer.getSdt() == null || !customer.getSdt().matches("^0[1-9][0-9]{8}$")) {
            error.put("sdt", false);
            check = false;
          }
          if (customer.getEmail() == null || !customer.getEmail().matches("^[a-zA-Z][a-zA-Z0-9_\\.]{5,32}@[a-z0-9]{2,30}(\\.[a-z0-9]{2,4}){1,2}$")) {
            error.put("email", false);
            check = false;
          }
          if (check == true) {
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
        } else {
          error.put("customer", false);
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
  public @ResponseBody String danhSachTTBanDat(@RequestParam(name = "page", defaultValue = "0") int page, @RequestParam(name = "ngayPhucVu", required = false) Date ngayPhucVu,
                                                  @RequestParam(name = "tt", required = false) ETinhTrangHoaDon tt, HttpSession session) {
    if (page <= 0) {
      page = 0;
    } else {
      page -= 1;
    }
    Map<String, Object> message = new HashMap<String, Object>();
    boolean result = false;
    List<TTBanDatViewModel> dsBD = null;
    Object o = session.getAttribute("account");
    if (o != null) {
      o = session.getAttribute("customer");
      if (o != null) {
        result = true;
        CustomerModel customer = (CustomerModel) session.getAttribute("customer");
        AtomicInteger pagecount = new AtomicInteger(0);
        dsBD = managerBanDatService.getDSBanDatKH(pagecount, customer.getMaKH(), ngayPhucVu, tt, page);
        message.put("pagecount", pagecount.get());
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
  public @ResponseBody String shoppingCart(@RequestParam(name = "page", defaultValue = "0") int page, HttpSession session) {
    if (page <= 0) {
      page = 0;
    } else {
      page -= 1;
    }
    Object obj = session.getAttribute("cart");
    Map<String, Object> result = new HashMap<String, Object>();
    List<ItemCartBanDat> cart = null;
    if (obj != null) {
      cart = (List<ItemCartBanDat>) obj;
      int pagecount = cart.size() / 20;
      if (cart.size() % 20 != 0) {
        pagecount++;
      }
      result.put("pagecount", pagecount);
      if (pagecount >=2) {
        List<ItemCartBanDat> pageCart = new ArrayList<ItemCartBanDat>();
        for (int i = page * 20; i < cart.size(); i++) {
          pageCart.add(cart.get(i));
          if (pageCart.size() == 20) {
            break;
          }
        }
        result.put("data", pageCart);
      } else {
        result.put("data", cart);
      }
    }
    Gson gson = new Gson();
    return gson.toJson(result);
  }
}
