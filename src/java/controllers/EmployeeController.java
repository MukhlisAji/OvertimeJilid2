/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Role;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
public class EmployeeController implements EmployeeControllerInterface {

    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private DAOInterface daoi = new GeneralDAO(factory);

    public EmployeeController(SessionFactory factory, DAOInterface daoi) {
        this.daoi = daoi;
    }

    public EmployeeController() {
    }

    public EmployeeController(SessionFactory sessionFactory) {
        this.factory = factory;
    }

    @Override
    public List<Object> getAlls() {
        return daoi.doDDL(new Employee(), "");
    }

    @Override
    public List<Object> search(String key) {
        return daoi.doDDL(new Employee(), key);
    }

    @Override
    public Employee getByNIK(String id) {
        return (Employee) daoi.getByNIK(new Employee(), id);
    }

    @Override
    public boolean delete(String nik) {
        Employee employee = new Employee(nik);
        if (daoi.doDML(employee, true)) {
            return true;
        }
        return false;
    }

    @Override
    public boolean insert(String nik, String name, String email, String password, String phoneNumber, String hireDate, String jobTitle, String salary, String isDelete, String roleId, String managerId) {
         try {
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
            Date dates = format.parse(hireDate);
            int sal = Integer.parseInt(salary);
            boolean isdelete = Boolean.parseBoolean(isDelete);
            Role role = new Role(Integer.valueOf(roleId));
            Employee managerid = new Employee(managerId);
            Employee employee = new Employee(nik, name, email, password, phoneNumber, dates, jobTitle, sal, isdelete, role, managerid);
            if (daoi.doDML(employee, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(String nik, String name, String email, String password, String phoneNumber, String hireDate, String jobTitle, String salary, String isDelete, String roleId, String managerId) {
        try {
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
            Date dates = format.parse(hireDate);
            int sal = Integer.parseInt(salary);
            boolean isdelete = Boolean.parseBoolean(isDelete);
            Role role = new Role(Integer.valueOf(roleId));
            Employee managerid = new Employee(managerId);
            Employee employee = new Employee(nik, name, email, password, phoneNumber, dates, jobTitle, sal, isdelete, role, managerid);
            if (daoi.doDML(employee, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Object getMax(String field) {
        Employee e = new Employee();
        return daoi.getMax(e, field);
    }

    @Override
    public List<Object> duplicatManagerId() {
        Employee e = new Employee();
        return daoi.duplicatManagerId(e);
}
}
