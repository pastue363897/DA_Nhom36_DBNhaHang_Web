/**
 * Created on: 14:59:02 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import entites.Account;
import entites.Customer;
import se.k12.nhom36.model.AccountModel;
import se.k12.nhom36.model.CustomerModel;
import se.k12.nhom36.repository.ManagerUserDao;

@Service
public class ManagerUserService {
  @Autowired
  private ManagerUserDao managerUserDao;
  
  public CustomerModel login(AccountModel account) {
    Account ac = new Account();
    ac.setUsername(account.getUsername());
    ac.setPasswordHash(account.getPassword());
    CustomerModel customer = null;
    if (managerUserDao.loginAccount(ac)) {
      Customer c = managerUserDao.getCustomer(ac);
      if (c != null) {
        customer = new CustomerModel(c.getMaKH(), c.getHoTen(), c.getDiaChi(), c.getCmnd(), c.getSdt(), c.getEmail());
      }
    }
    return customer;
  }
  
  public boolean register(AccountModel account, CustomerModel customer) {
    Account ac = new Account(account.getUsername(), account.getPassword());
    Customer c = new Customer(customer.getHoTen(), customer.getDiaChi(), customer.getCmnd(), customer.getSdt(), customer.getEmail(), ac);
    return managerUserDao.registerUser(ac, c);
  }
  public boolean updateAccount(AccountModel account, String userNameOld) {
    Account ac = new Account(account.getUsername(), account.getPassword());
    return managerUserDao.updateAccount(ac, userNameOld);
  }
  public boolean updateCustomer(CustomerModel customer) {
    Customer c = new Customer(customer.getHoTen(), customer.getDiaChi(), customer.getCmnd(), customer.getSdt(), customer.getEmail(), null);
    c.setMaKH(customer.getMaKH());
    return managerUserDao.updateCustomer(c);
  }
}
