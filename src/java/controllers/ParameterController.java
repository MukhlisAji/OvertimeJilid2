/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Parameter;
import java.util.List;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author AD
 */
public class ParameterController implements ParameterControllerInterface {

    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private DAOInterface daoi = new GeneralDAO(factory);

    public ParameterController() {
    }

    public ParameterController(SessionFactory sessionFactory) {
        this.factory = factory;
    }

    @Override
    public List<Object> getAlls() {
        return daoi.doDDL(new Parameter(), "");
    }

    @Override
    public List<Object> search(String key) {
        return daoi.doDDL(new Parameter(), key);
    }

    @Override
    public Object getById(String id) {
        return daoi.getById(new Parameter(), id);
    }

    @Override
    public boolean delete(String id) {
        int paraId = Integer.parseInt(id);
        Parameter parameter = new Parameter(paraId);
        if (daoi.doDML(parameter, true)) {
            return true;
        }
        return false;
    }

    @Override
    public Object getMax(String field) {
        Parameter p = new Parameter();
        return daoi.getMax(p, field);
    }

    @Override
    public boolean insert(String parameterId, String parameterName, String value) {
        try{
        int paraId = Integer.parseInt(parameterId);
        int val = Integer.parseInt(value);

        Parameter parameter = new Parameter(paraId, parameterName, val);
         if (daoi.doDML(parameter, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(String parameterId, String parameterName, String value) {
        try{
        int paraId = Integer.parseInt(parameterId);
        int val = Integer.parseInt(value);

        Parameter parameter = new Parameter(paraId, parameterName, val);
         if (daoi.doDML(parameter, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
