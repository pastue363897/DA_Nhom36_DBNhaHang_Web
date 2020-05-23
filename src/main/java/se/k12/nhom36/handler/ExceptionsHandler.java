/**
 * Created on: 02:12:07 24 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.handler;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionsHandler {
  
  @RequestMapping(value = "/errors")
  public String notFound(HttpServletRequest httpRequest, Model model) {
    
    int httpErrorCode = getErrorCode(httpRequest);
    String messageError = null;
    switch (httpErrorCode) {
        case 404: {
            messageError = "Không tìm thấy trang, hãy thử lại";
            break;
        }
        case 500: {
            messageError = "Không xác định được yêu cầu hãy thử lại";
            break;
        }
        default: {
          messageError = "Không xác định được yêu cầu hãy thử lại";
          break;
        }
    }
    
    model.addAttribute("codeError", httpErrorCode);
    model.addAttribute("messageError", messageError);
    return "error";
  }
  
  private int getErrorCode(HttpServletRequest httpRequest) {
      return (Integer) httpRequest
        .getAttribute("javax.servlet.error.status_code");
  }
}
