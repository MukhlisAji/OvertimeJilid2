/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tools;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.OvertimeController;
import controllers.OvertimeControllerInterface;
import controllers.PresenceController;
import controllers.PresenceControllerInterface;
import controllers.autoPresence;
import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Overtime;
import entities.Presence;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import jbcrypt.BCrypt;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Distinct;

/**
 *
 * @author Mukhlish
 */
public class Main {

    public static void main(String[] args) {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
        EmployeeControllerInterface eci = new EmployeeController(sessionFactory);
        System.out.println(sessionFactory);
//        Object e = eci.getByNIK("14409");
//        Employee employee = (Employee) e;
//        System.out.println(employee.getEmail());
        DAOInterface daoi = new GeneralDAO(sessionFactory);
//    String pass = BCrypt.hashpw("admin", BCrypt.gensalt());
//        System.out.println(pass);
//        autoPresence p = new autoPresence();
//        p.absen("14409", true);
        PresenceControllerInterface pci = new PresenceController(sessionFactory);
       
//        System.out.println(employee.getManagerId());
//        System.out.println(employee.getIsAdmin());
//        if(employee.getManagerId() == null && employee.getIsAdmin() == false){
//            System.out.println("true");
//        }else{
//            System.out.println("false");
//        }
//System.out.println(e.getManagerId());
////System.out.println(e.getManagerId().getManagerId());
//System.out.println(e.getManagerId().getNik().toString());
Employee e = eci.getByNIK("14413");

List<Employee> manager = e.getEmployeeList();
        System.out.println(manager);
if(manager.isEmpty()){
    System.out.println("true");
}else{
    System.out.println("false");
}
        
//for (Object o : eci.getAlls()) {
//                    Employee emp = (Employee) o;
//                    Employee manager = emp.getManagerId();
                     
//                   System.out.println(manager);
//                   System.out.println(e);
//                   if(manager.equals(e)){
//                       System.out.println("true");
//                   }else{
//                       System.out.println("false");
//                   } 
//                }
//        boolean admin = employee.getIsAdmin();
//        System.out.println(admin);
//        String nama = employee.getName();
//        System.out.println(nama);
//        String status = employee.getManagerId().toString();
////        Employee status = (Employee) employee.getManagerId();
//        System.out.println(status);
//        System.out.println(pci.insert("1", "13:43:43", "13:43:43", "12/12/2012", "14409"));
//        pci.insert("", "13:43", "13:43", "12/12/2012", "14409");
//          DAOInterface daoi = new GeneralDAO(sessionFactory);
//          System.out.println(daoi.getMax(new Presence(), "1"));
//        Object o = pci.("1");
//        List<Presence> al = (List<Presence>) o;
//        Presence p = null;
//        for (int i = 0; i < al.size(); i++) {
//            System.out.println(al.get(i));
//            p = al.get(i);            
//        }
//        System.out.println(p.getCheckIn());

//        String oldtime = String.valueOf(o.getCheckIn());
//        Presence al = (Presence) o;
//
//        System.out.println(o);
//        System.out.println(e);
//        
//        
//        
//               Object o = daoi.getByNIK(new Presence(), "14409");
//               
//               System.out.println(o);
//               
//        Object jum = daoi.getMaxPresence(new Presence(), "14411");
//        System.out.println(jum);
//
//        System.out.println(daoi.cekPresence("14409", "2018-12-15"));
//            Object presence1 = daoi.cekPresence("14409", "12-15-2018");
//            List<Presence> cek = (List<Presence>) presence1;
//            
//            for (int i = 0; i < cek.size(); i++) {
//                System.out.println(cek.get(i));
//        Object tt = eci.getAlls();
//        List<Employee> jajal = (List<Employee>) tt;
//        Employee ts = null;
////         List<Employee> satu = (List<Employee>) ts.getManagerId();
//        for (int i = 0; i < jajal.size(); i++) {
//            System.out.println(jajal.get(i));
//           ts = jajal.get(i);
//           String coba = ts.getManagerId().getNik();
//           
////           List 12 = new ArrayList(new HashSet());
//            System.out.println(coba);
//        }
//        autoPresence p = new autoPresence();
//        p.takeabsen("14413");
//    }
//            for (List<Object> object : daoi.cekPresence("14409", "12-15-2018")) {
//            
//        }
//        Object o = daoi.getById(new Role(), "1");
////        Role r = (Role) o;
//        System.out.println(o);
//        Employee e = eci.getByNIK("14409");
//        System.out.println(e.getEmail());
//    
//        for (Object all : pci.getAlls()) {
//            Presence presence = (Presence) all;
//            System.out.println(presence.getCheckIn());
//        }
////    p.absen("14409", false);
//        Object cekP = daoi.cekPresence("14413", "2018-12-15");
//        autoPresence presence = new autoPresence();
//        System.out.println(cekP);
//        if (cekP != null) {
//            System.out.println("bbb");
//
////            pci.insert("", "18:18", null, "12/12/2018", "14411");
//            presence.absen("14413", false);
//        } else {
////             pci.update("8", "18:18", "12.14", "12/12/2018", "14411");
////            presence.absen("14411", false);
//            //   presence.absen("14413", false);
//            presence.absen("14413", true);
//
//        }
        // System.out.println((daoi.getMaxPresence(new Presence(), NIK)));
//        autoPresence p = new autoPresence();
//        p.takeabsen("14413");
//        System.out.println(daoi.getMax(new Employee(), "nik"));
//        String max = String.valueOf(daoi.getMax(new Employee(), "nik"));
//        int nik = Integer.parseInt(max);
//        int newNik = nik + 1;
//        String nikInc = String.valueOf(newNik);
//        System.out.println(nikInc);
//        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
//        String dates = String.valueOf(timestamp);
//        String hasil = "";
//        String b = dates.substring(0, 10);
//        System.out.println(b);
//
//        String id = String.valueOf(daoi.getMaxPresence(new Presence(), "14409"));
//        Object o = pci.getById(id);
//        List<Presence> al = (List<Presence>) o;
//        Presence p = null;
//        for (int i = 0; i < al.size(); i++) {
//            System.out.println(al.get(i));
//            p = al.get(i);
//        }
//        String s = String.valueOf(p.getCheckIn());
//
//        String time = String.valueOf(timestamp);
//        String times = time.substring(11, 16);
//
//        String hasilTime = "";
//        String[] c = times.split(":");
//        for (int i = 0; i < c.length; i++) {
//            hasilTime = c[0];
//        }
//
//        System.out.println(hasilTime);
//        int f = Integer.parseInt(hasilTime);
//        int duration = f - 17;
//        System.out.println(duration);
//            OvertimeControllerInterface oci = new OvertimeController(sessionFactory);
//            oci.insert("", "2", "20000", "request", "dvdx", "coba", "16");
//            autoPresence p = new autoPresence();
//            String ini = p.Fee("3", "14409");
//            System.out.println(ini);
//            String e = "true";
//            boolean r = Boolean.parseBoolean(e);
//            System.out.println(r);
//        Object o = daoi.byNikAndDate("14413", "12");
//        List<Presence> list = (List<Presence>) o;
//        Presence p = null;
//        for (int i = 0; i < list.size(); i++) {
//
//            p = list.get(i);
////                    System.out.println(p.getCheckIn() + " = " + p.getCheckOut());
//            List<Overtime> list1 = p.getOvertimeList();
//            Overtime ov = null;
//            for (int j = 0; j < list1.size(); j++) {
//                ov = list1.get(j);
//                System.out.println(ov.getOvertimeId() + " = " + ov.getOtDuration());
//            }
////                    System.out.println(p.getOvertimeList().toString());
//
//        }
//        OvertimeControllerInterface oci = new OvertimeController(sessionFactory);
//
//        Object ob = oci.getById("18");
//        List<Overtime> list = (List<Overtime>) ob;
//        Overtime overtime = null;
//        for (int i = 0; i < list.size(); i++) {
//            overtime = list.get(i);
//        }
////        Overtime overtime = (Overtime) ob;
//        String Duration = String.valueOf(overtime.getOtDuration());
//        String fee = String.valueOf(overtime.getFee());
//        String file = "";
//        String presence = String.valueOf(overtime.getPresenceId().getPresenceId());
//        String description = String.valueOf(overtime.getDescription());
//        String Status = "Approved";
//        System.out.print("18" + Duration + fee + Status + file + description + presence);
//        oci.update("18", Duration, fee, Status, file, description, presence);
    }
}
