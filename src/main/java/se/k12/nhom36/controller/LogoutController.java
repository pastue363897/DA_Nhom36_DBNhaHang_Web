/**
 * Created on: 16:54:05 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoutController {
  
  @RequestMapping(value = "logout")
  public String requestLogout(HttpSession session) {
    session.invalidate();
    return "forward:home";
  }
}
