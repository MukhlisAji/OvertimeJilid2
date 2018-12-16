/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Parameter;
import entities.Presence;
import java.sql.Timestamp;
import java.util.List;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
public class autoPresence {

    SessionFactory factory = HibernateUtil.getSessionFactory();

    public void absen(String NIK, boolean type) {
        PresenceControllerInterface pci = new PresenceController(factory);
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        String dates = String.valueOf(timestamp);
        String hasil = "";
        String b = dates.substring(0, 10);
        String[] c = b.split("-");
        for (int i = 0; i < c.length; i++) {
            hasil = c[1] + "/" + c[2] + "/" + c[0];
        }
        String time = String.valueOf(timestamp);
        String times = time.substring(11, 16);
        DAOInterface daoi = new GeneralDAO(factory);
        String id = String.valueOf(daoi.getMaxPresence(new Presence(), NIK));
        Object o = pci.getById(id);
        List<Presence> al = (List<Presence>) o;
        Presence p = null;
        for (int i = 0; i < al.size(); i++) {
            System.out.println(al.get(i));
            p = al.get(i);
        }

        if (type) {
            System.out.println(times + hasil + NIK);
            pci.insert("", times, null, hasil, NIK);
        } else {
            System.out.println(p.getCheckIn());
//            id = id+1;
            String oldtime = String.valueOf(p.getCheckIn());
            System.out.println(id + oldtime + times + hasil + NIK);
            pci.update(id, oldtime, times, hasil, NIK);

        }

    }

    public void takeabsen(String nik) {
        DAOInterface daoi = new GeneralDAO(factory);
        Object cekP = daoi.cekPresence("14413", "2018-12-15");
        if (cekP != null) {
            absen(nik, true);
        } else {
            absen(nik, false);
        }
    }

    public String Fee(String durasi, String nik) {
        ParameterControllerInterface pci = new ParameterController(factory);
        EmployeeControllerInterface eci = new EmployeeController(factory);
        Object o = pci.getById("1");

        List<Parameter> al = (List<Parameter>) o;
        Parameter p = null;
        for (int i = 0; i < al.size(); i++) {
            p = al.get(i);
        }

        String param = String.valueOf(p.getValue());

        double percent = Double.parseDouble(param);
        Object ob = pci.getById("3");
        List<Parameter> al1 = (List<Parameter>) ob;
        Parameter p1 = null;
        for (int i = 0; i < al1.size(); i++) {
            p1 = al1.get(i);
        }
        String days = String.valueOf(p1.getValue());

        int works = Integer.parseInt(days);
        int Durasi = Integer.parseInt(durasi);

        Object obj = eci.getByNIK(nik);
        Employee e = (Employee) obj;
        String salary = String.valueOf(e.getSalary());
        int Salary = Integer.valueOf(salary);

        int daySal = Salary / works;
        int Fee = (int) ((percent * daySal) / 100) * Durasi;

        return String.valueOf(Fee); 
    }
}
