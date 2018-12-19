/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.List;

/**
 *
 * @author Nitro 5
 */
public interface TimesheetControllerInterface {
    public List<Object> getAlls();
    public List<Object> search(String key);
    public Object getById(String id);
    public boolean insert(String timesheetId, String periode, String file, String nik);
    public boolean update(String timesheetId, String periode, String file, String nik);
    public boolean delete(String id);
    public Object getMax(String field);
}
