/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import entities.Employee;
import jbcrypt.BCrypt;
import org.hibernate.SessionFactory;

/**
 *
 * @author Mukhlish
 */
public class Main {
    
    public static void main(String[] args) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        EmployeeControllerInterface eci = new EmployeeController(sessionFactory);
//        System.out.println(sessionFactory);
//        Object e = eci.getByNIK("14409");
//        Employee employee = (Employee) e;
//        System.out.println(employee.getEmail());
    
    String pass = BCrypt.hashpw("admin", BCrypt.gensalt());
        System.out.println(pass);
    
    }
}
