/**
 * Created on: 23:03:00 22 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorController {
  
  @RequestMapping(value = "error")
  public String error(Model model) {
    return "error";
  }
}
