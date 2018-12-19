/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Overtime;
import entities.Presence;
import java.io.Serializable;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
public class PresenceController implements PresenceControllerInterface {

    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private DAOInterface daoi = new GeneralDAO(factory);
    private static final SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss");

    public PresenceController(SessionFactory factory, DAOInterface daoi) {
        this.factory = factory;
    }

    public PresenceController() {
    }

    public PresenceController(SessionFactory sessionFactory) {
        this.factory = factory;
    }

    @Override
    public List<Object> getAlls() {
        return daoi.doDDL(new Presence(), "");
    }

    @Override
    public List<Object> search(String key) {
        return daoi.doDDL(new Presence(), key);
    }

    @Override
    public Object getById(String id) {
        return daoi.getById(new Presence(), id);
    }

    @Override
    public boolean delete(String id) {
        int preId = Integer.parseInt(id);
        Presence presence = new Presence(preId);
        if (daoi.doDML(presence, true)) {
            return true;
        }
        return false;
    }

    @Override
    public boolean insert(String presenceId, String checkIn, String checkOut, String presenceDate, String nik) {
        try {
            //int preId = Integer.parseInt(presenceId);
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
            Date dates = format.parse(presenceDate);
            Employee Nik = new Employee(nik);
            Presence presence = new Presence(null, checkIn, checkOut, dates, Nik);
            if (daoi.doDML(presence, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(String presenceId, String checkIn, String checkOut, String presenceDate, String nik) {
        try {
            int preId = Integer.parseInt(presenceId);
            DateFormat format = new SimpleDateFormat("MM/dd/yyyy", Locale.ENGLISH);
            Date dates = format.parse(presenceDate);
            Employee Nik = new Employee(nik);
            Presence presence = new Presence(preId, checkIn, checkOut, dates, Nik);
            if (daoi.doDML(presence, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Object getMax(String field) {
        Presence p = new Presence();
        return daoi.getMax(p, field);
    }
}
