/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;

/**
 * 
 * @author AD
 */
public interface DAOInterface {
    public boolean doDML(Object object, boolean isDelete);//iud
    public List<Object> doDDL(Object entities, String keys);//sga
    public Object getById(Object entities, Object keyword);
    public Object getByNIK(Object entities, Object keyword);
    public Object login(Object entities, String Name);
    public boolean updateStatus(String Status, String oldStatus);
    public Object getMax(Object entities, Object field);
    public Object getMaxPresence(Object entities, Object nik);
    public Object cekPresence(String nik,String date);
    public List<Object> duplicatManagerId(Object entities);
    public List<Object> byNikAndDate(Object Nik, Object mounth);
}
