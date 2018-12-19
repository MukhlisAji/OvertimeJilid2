/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Timesheet;
import java.util.Base64;
import java.util.List;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Nitro 5
 */
public class TimesheetController implements TimesheetControllerInterface{
    
    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private DAOInterface daoi = new GeneralDAO(factory);
    
    @Override
    public List<Object> getAlls() {
        return daoi.doDDL(new Timesheet(), "");
    }

    @Override
    public List<Object> search(String key) {
         return daoi.doDDL(new Timesheet(), key);
    }

    @Override
    public Object getById(String id) {
        return daoi.getById(new Timesheet(), id);
    }

    @Override
    public boolean insert(String timesheetId, String periode, String file, String nik) {
         try {
            byte[] fileTs = Base64.getDecoder().decode(file);
            Employee Nik = new Employee(nik);

            Timesheet timesheet = new Timesheet(timesheetId, periode, fileTs, Nik);
            if (daoi.doDML(timesheet, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(String timesheetId, String periode, String file, String nik) {
        try {
            byte[] fileTs = Base64.getDecoder().decode(file);
            Employee Nik = new Employee(nik);

            Timesheet timesheet = new Timesheet(timesheetId, periode, fileTs, Nik);
            if (daoi.doDML(timesheet, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        Timesheet timesheet = new Timesheet(id);
        if (daoi.doDML(timesheet, true)) {
            return true;
        }
        return false;
    }

    @Override
    public Object getMax(String field) {
        Timesheet timesheet = new Timesheet();
        return daoi.getMax(timesheet, field);
    }
    
}
