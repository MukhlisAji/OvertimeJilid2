/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Job;
import java.util.List;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Nitro 5
 */
public class JobController implements JobControllerInterface{
    
    private SessionFactory factory = HibernateUtil.getSessionFactory();
    private DAOInterface daoi = new GeneralDAO(factory);
    
    public JobController(SessionFactory factory, DAOInterface daoi) {
        this.daoi = daoi;
    }

    public JobController() {
    }
    
    @Override
    public List<Object> getAlls() {
        return daoi.doDDL(new Job(), "");
    }

    @Override
    public List<Object> search(String key) {
        return daoi.doDDL(new Job(), key);
    }

    @Override
    public Job getById(String id) {
        return (Job) daoi.getById(new Job(), id);
    }

    @Override
    public boolean insert(String jobId, String jobTitle) {
        try {
            Job job = new Job(jobId, jobTitle);
            if (daoi.doDML(job, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(String jobId, String jobTitle) {
        try {
            Job job = new Job(jobId, jobTitle);
            if (daoi.doDML(job, false)) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(String id) {
        Job job = new Job(id);
        if (daoi.doDML(job, true)) {
            return true;
        }
        return false;
    }
    
}
