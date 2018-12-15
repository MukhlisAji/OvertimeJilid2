/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Employee;
import java.util.List;

/**
 *
 * @author Mukhlish
 */
public interface EmployeeControllerInterface {
    public List<Object> getAlls();
    public List<Object> search(String key);
    public Employee getByNIK(String nik);
    public boolean insert(String nik, String name, String email, String password, String phoneNumber, String hireDate, String jobTitle, String salary, String isDelete, String roleId, String managerId);
    public boolean update(String nik, String name, String email, String password, String phoneNumber, String hireDate, String jobTitle, String salary, String isDelete, String roleId, String managerId);
    public boolean delete(String id);
    public Object getMax(String field);
    public List<Object> duplicatManagerId();
}
