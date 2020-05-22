/**
 * Created on: 21:52:49 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.model;

import javax.validation.constraints.Pattern;

public class AccountModel {
  @Pattern(regexp = "^[a-zA-Z][a-zA-Z0-9]{2,19}")
  private String username;
  @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[#$^+=!*()@%&]).{8,20}$")
  private String password;
  public AccountModel() {
    super();
  }
  public AccountModel(String username, String password) {
    super();
    this.username = username;
    this.password = password;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String username) {
    this.username = username;
  }
  public String getPassword() {
    return password;
  }
  public void setPassword(String password) {
    this.password = password;
  }
  
}
