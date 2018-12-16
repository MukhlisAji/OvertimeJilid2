/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Presence;
import entities.Role;
import java.util.List;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;


/**
 *
 * @author tikamhrdk
 */
public class RoleIdController implements RoleIdControllerInterface {
    
    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private DAOInterface daoi = new GeneralDAO(factory);

    public RoleIdController(SessionFactory factory, DAOInterface daoi) {
        this.daoi = daoi;
    }

    public RoleIdController() {
    }

    public RoleIdController(SessionFactory sessionFactory) {
        this.factory = factory;
    }

    @Override
    public List<Object> getAlls() {
        return daoi.doDDL(new Role(), "");
    }
}
