/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Overtime;
import entities.Presence;
import entities.Timesheet;
import java.util.Base64;
import java.util.List;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
public class OvertimeController implements OvertimeControllerInterface {

    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private DAOInterface daoi = new GeneralDAO(factory);

    public OvertimeController(SessionFactory factory, DAOInterface daoi) {
        this.daoi = daoi;
    }

    public OvertimeController() {
    }

    public OvertimeController(SessionFactory sessionFactory) {
        this.factory = factory;
    }

    @Override
    public List<Object> getAlls() {
        return daoi.doDDL(new Overtime(), "");
    }

    @Override
    public List<Object> search(String key) {
        return daoi.doDDL(new Overtime(), key);
    }

    @Override
    public Object getById(String id) {
        return daoi.getById(new Overtime(), id);
    }

    @Override
    public boolean delete(String id) {
        Overtime overtime = new Overtime(Integer.valueOf(id));
        if (daoi.doDML(overtime, true)) {
            return true;
        }
        return false;
    }

    @Override
    public Object getByNIK(String nik) {
        return daoi.getByNIK(new Overtime(), nik);
    }

    @Override
    public boolean insert(String overtimeId, String otDuration, String fee, String status, String description, String presenceId, String timesheetId) {
        try {
            int otDur = Integer.parseInt(otDuration);
            int fe = Integer.parseInt(fee);
            Presence presence = new Presence(Integer.valueOf(presenceId));
            Timesheet timesheet = new Timesheet(timesheetId);

            Overtime overtime;
            if (timesheetId != "") {
                overtime = new Overtime(null, otDur, fe, status, description, presence, timesheet);
            } else {
                overtime = new Overtime(null, otDur, fe, status, description, presence, null);
            }
            if (daoi.doDML(overtime, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(String overtimeId, String otDuration, String fee, String status, String description, String presenceId, String timesheetId) {
        try {
            int overid = Integer.parseInt(overtimeId);
            int otDur = Integer.parseInt(otDuration);
            int fe = Integer.parseInt(fee);
            Presence presence = new Presence(Integer.valueOf(presenceId));
            Timesheet timesheet = new Timesheet(timesheetId);

            Overtime overtime = new Overtime(overid, otDur, fe, status, description, presence, timesheet);
            if (daoi.doDML(overtime, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Object getMax(String field) {
        Overtime o = new Overtime();
        return daoi.getMax(o, field);
    }
}
