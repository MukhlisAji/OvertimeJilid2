/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Job;
import java.util.List;

/**
 *
 * @author Nitro 5
 */
public interface JobControllerInterface {
    public List<Object> getAlls();
    public List<Object> search(String key);
    public Job getById(String id);
    public boolean insert(String jobId, String jobTitle);
    public boolean update(String jobId, String jobTitle);
    public boolean delete(String id);
}
