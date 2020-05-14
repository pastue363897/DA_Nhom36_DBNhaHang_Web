/**
 * Created on: 15:05:25 11 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

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
  
  @RequestMapping(value = "chitiet-monan/{maMA}", method = RequestMethod.POST)
  public @ResponseBody String chiTietMonAn(@PathVariable("maMA") String maMA) {
    MonAn monAn = managerMonAnService.thongTinChiTietMonAn(maMA);
    Gson gson = new Gson();
    return gson.toJson(monAn);
  }
}
