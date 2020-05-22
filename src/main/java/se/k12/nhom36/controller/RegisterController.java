/**
 * Created on: 18:48:11 7 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import javax.validation.Valid;

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
public class RegisterController {
  
  @Autowired
  private ManagerUserService managerUserService;
  
  @RequestMapping(value = "register", method = RequestMethod.GET)
  public String requestRegister(Model model) {
    AccountModel account;
    CustomerModel customer;
    account = new AccountModel();
    customer = new CustomerModel();
    model.addAttribute("account", account);
    model.addAttribute("customer", customer);
    return "register";
  }
  @RequestMapping(value = "register", method = RequestMethod.POST)
  public String requestRegister(@ModelAttribute("account") @Valid AccountModel account, BindingResult accountBind, @ModelAttribute("customer") @Valid CustomerModel customer, BindingResult customerBind) {
    System.out.println(account);
    System.out.println(customer);
    if (accountBind.hasErrors() || customerBind.hasErrors()) {
      System.out.println("error");
      return "register";
    }
    if (managerUserService.register(account, customer)) {
      return "redirect:sign-in";
    }
    return "register";
  }
}
