/**
 * Created on: 15:05:25 11 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import entites.MonAn;
import se.k12.nhom36.service.ManagerMonAnService;

@Controller
public class MonAnController {
  
  @Autowired
  private ManagerMonAnService managerMonAnService;
  
  @RequestMapping(value = "monan")
  public String requestMonAn(@RequestParam(name = "page", defaultValue = "0") int page, Model model) {
    if (page <= 0) {
      page = 0;
    } else {
      page -= 1;
    }
    List<MonAn> danhSachMonAn = managerMonAnService.danhSachMonAn(page);
    int pagecount = managerMonAnService.soPageMonAn();
    
    model.addAttribute("dsMonAn", danhSachMonAn);
    model.addAttribute("pagecount", pagecount);
    
    return "monan";
  }
  
  @RequestMapping(value = "chitiet-monan/{maMA}", method = RequestMethod.POST)
  public @ResponseBody String chiTietMonAn(@PathVariable("maMA") String maMA) {
    MonAn monAn = managerMonAnService.thongTinChiTietMonAn(maMA);
    Gson gson = new Gson();
    return gson.toJson(monAn);
  }
  
  @RequestMapping(value = "search-monan")
  public @ResponseBody String searchMonAn(@RequestParam(name = "page", defaultValue = "0") int page, @RequestParam(name = "tenOrMoTaMA", required = false) String tenOrMoTa,
               @RequestParam(name = "giaTienMA", defaultValue = "0") long giaTien, @RequestParam(name = "soNguoiAnMA", defaultValue = "0") int soNguoiAn) {
    if (page <= 0) {
      page = 0;
    } else {
      page -= 1;
    }
    List<MonAn> dsMonAn = new ArrayList<MonAn>();
    int pagecount = managerMonAnService.timDanhSachMonAn(dsMonAn, tenOrMoTa, giaTien, soNguoiAn, page);
    Gson gson = new Gson();
    Map<String, Object> result = new HashMap<String, Object>();
    result.put("pagecount", pagecount);
    result.put("data", dsMonAn);
    return gson.toJson(result);
  }
}
