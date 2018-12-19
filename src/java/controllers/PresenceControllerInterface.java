/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Presence;
import java.util.List;

/**
 *
 * @author Mukhlish
 */
public interface PresenceControllerInterface {
    public List<Object> getAlls();
    public List<Object> search(String key);
    public Object getById(String id);
    public boolean insert(String presenceId, String checkIn, String checkOut, String presenceDate, String nik);
    public boolean update(String presenceId, String checkIn, String checkOut, String presenceDate, String nik);
    public boolean delete(String id);
    public Object getMax(String field);
}
