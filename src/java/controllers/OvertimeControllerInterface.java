/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Overtime;
import java.util.List;

/**
 *
 * @author Mukhlish
 */
public interface OvertimeControllerInterface {
    public List<Object> getAlls();
    public List<Object> search(String key);
    public Object getById(String id);
    public boolean insert(String overtimeId, String otDuration, String fee, String status, String tsFile, String description, String presenceId);
    public boolean update(String overtimeId, String otDuration, String fee, String status, String tsFile, String description, String presenceId);
    public boolean delete(String id);
    public Object getByNIK(String nik);
    public Object getMax(String field);
}
