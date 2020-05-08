/**
 * Created on: 17:59:53 7 thg 5, 2020
 * 
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import se.k12.nhom36.model.AccountModel;
import se.k12.nhom36.model.CustomerModel;
import se.k12.nhom36.service.ManagerUserService;


@Controller
public class SignInController {
  
  @Autowired
  private ManagerUserService managerUserService;
  
  @RequestMapping(value = "sign-in", method = RequestMethod.GET)
  public String requestSignIn(Model model) {
    AccountModel account = new AccountModel();
    model.addAttribute("account", account);
    return "sign-in";
  }
  
  @RequestMapping(value = "sign-in", method = RequestMethod.POST)
  public String signIn(@ModelAttribute("account") AccountModel account, BindingResult accountBind, HttpSession session) {
      System.out.println(account);
      CustomerModel customer = managerUserService.login(account);
      if (customer != null) {
        session.setAttribute("account", account);
        session.setAttribute("customer", customer);
        return "redirect:/";
      }
      return "sign-in";
  }
}
