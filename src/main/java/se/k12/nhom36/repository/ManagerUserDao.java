/**
 * Created on: 15:01:13 8 thg 5, 2020
 * @author Dinh Van Dung YKNB
 */

package se.k12.nhom36.repository;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import database.AccountDAO;
import database.CustomerDAO;
import entites.Account;
import entites.Customer;

@Repository
public class ManagerUserDao {
  
  @Inject
  private AccountDAO accountDao;
  @Inject
  private CustomerDAO customerDao;
  
  
  public boolean loginAccount(Account account) {
    if (accountDao.signIn(account) == 1) {
      return true;
    }
    return false;
  }
  
  public boolean registerUser(Customer customer) {
    /*if (!accountDao.addAccount(account)) {
      return false;
    }*/
    return customerDao.addCustomer(customer);
  }
  
  public Customer getCustomer(Account account) {
    return customerDao.getCustomer(account);
  }
  public boolean updateAccount(Account account, String userNameOld) {
    return accountDao.updateAccount(account, userNameOld);
  }
  public boolean updateCustomer(Customer customer) {
    return customerDao.updateCustomer(customer);
  }
}
