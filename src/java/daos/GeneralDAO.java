/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import java.util.List;
import org.hibernate.SessionFactory;

/**
 * 
 * @author AD
 */
public class GeneralDAO implements DAOInterface {

    private FunctionDAO fdao;

    public GeneralDAO(SessionFactory factory) {
        this.fdao = new FunctionDAO(factory);
    }

    /**
     * method for insert, update, or delete
     * @param object
     * @param isDelete
     * @return 
     */
    @Override
    public boolean doDML(Object object, boolean isDelete) {
        return this.fdao.insertOrUpdateOrDelete(object, isDelete);
    }



    @Override
    public List<Object> doDDL(Object entities, String key) {
       return this.fdao.getDatas(entities, key);
    }

    @Override
    public Object login(Object entities, String Name) {
       return this.fdao.login(entities, Name);
    }

    @Override
    public Object getById(Object entities, Object keyword) {
        return this.fdao.getById(entities, keyword);
    }

    @Override
    public Object getByNIK(Object entities, Object keyword) {
        return this.fdao.getByNIK(entities, keyword);
    }

    @Override
    public boolean updateStatus(String Status, String oldStatus) {
        return this.fdao.updateStatus(Status, oldStatus);
    }

    @Override
    public Object getMax(Object entities, Object field) {
         return this.fdao.getMax(entities, field);
    }
    
    @Override
   public List<Object> duplicatManagerId(Object entities) {
         return this.fdao.duplicatManagerId(entities);
    }
}