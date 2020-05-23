package se.k12.nhom36.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entites.BanAn;
import entites.MonAn;
import se.k12.nhom36.service.ManagerBanAnService;
import se.k12.nhom36.service.ManagerMonAnService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ManagerMonAnService managerMonAnService;
	@Autowired
  private ManagerBanAnService managerBanAnService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = {"/", "home"})
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<MonAn> danhSachMonAn = managerMonAnService.danhSachMonAnHome();
		List<BanAn> danhSachBanAn = managerBanAnService.danhSachBanAnHome();
		
		model.addAttribute("dsMonAn", danhSachMonAn);
		model.addAttribute("dsBanAn", danhSachBanAn);
		
		return "home";
	}
	
	@RequestMapping(value = "about")
  public String about() {
	  return "about";
	}
	
	@RequestMapping(value = "contact")
  public String contact() {
	  return "contact";
	}
	
}
