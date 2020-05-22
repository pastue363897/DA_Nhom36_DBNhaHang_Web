/**
 * Created on: 00:07:30 23 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class CustomGlobalExceptionHandler extends ResponseEntityExceptionHandler{

  @Override
  protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex,
      org.springframework.http.HttpHeaders headers, HttpStatus status, WebRequest request) {
    Map<String, Object> body = new LinkedHashMap<String, Object>();
    body.put("timestamp", new Date());
    body.put("status", status.value());
    List<FieldError> list = ex.getBindingResult().getFieldErrors();
    List<String> errors = new ArrayList<String>();
    for (FieldError e : list) {
      errors.add(e.getDefaultMessage());
      System.out.println(e.getDefaultMessage());
    }
    body.put("errors", errors);
    return new ResponseEntity<Object>(body, headers, status);
  }
  
  
}
