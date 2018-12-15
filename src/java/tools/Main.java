/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.RoleIdController;
import controllers.RoleIdControllerInterface;
import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Role;
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
        RoleIdControllerInterface rci = new RoleIdController(sessionFactory);
        DAOInterface daoi = new GeneralDAO(sessionFactory);
//        System.out.println(sessionFactory);
//        Object e = eci.getByNIK("14409");
        for (Object rl : rci.getAlls()) {
            Role role =(Role) rl;
            System.out.println(role.getRoleName());
        }
        
        for (Object emp : eci.duplicatManagerId()) {
            Employee employee = (Employee) emp;
            System.out.println(employee.getManagerId().getName());
        }
        String max = String.valueOf(daoi.getMax(new Employee(), "nik"));
        int nik = Integer.parseInt(max);
        int newNik = nik+1;
        String nikInc = String.valueOf(newNik);
        System.out.println(nikInc);
    String pass = BCrypt.hashpw("admin", BCrypt.gensalt());
        System.out.println(pass);
    
    }
}
