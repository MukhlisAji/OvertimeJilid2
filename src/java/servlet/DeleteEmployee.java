/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import entities.Employee;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jbcrypt.BCrypt;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author tikamhrdk
 */
@WebServlet(name = "DeleteEmployee", urlPatterns = {"/DeleteEmployee"})
public class DeleteEmployee extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nik = request.getParameter("nik");

        try (PrintWriter out = response.getWriter()) {

            SessionFactory SessionFactory = new HibernateUtil().getSessionFactory();
            EmployeeControllerInterface eci = new EmployeeController(SessionFactory);

            Employee e = eci.getByNIK(nik);
            String name = e.getName();
            String email = e.getEmail();
            String phoneNumber = e.getPhoneNumber();
            String Password = e.getPassword();
            String hireDate = String.valueOf(e.getHireDate());
            String[] Dates = hireDate.split("-");
            String newDates = "";
            for (int i = 0; i < Dates.length; i++) {
                newDates = Dates[1] + "/" + Dates[2] + "/" + Dates[0];
            }
//            String jobTitle = e.getJobTitle();
//            String salary = String.valueOf(e.getSalary());
//            String roleId = String.valueOf(e.getRoleId().getRoleId());
//            String managerId = String.valueOf(e.getManagerId().getNik());
//            String isDelete = "true";
//            System.out.println(nik + name + email + Password + phoneNumber + newDates + jobTitle + salary + isDelete + roleId + managerId);
//            eci.insert(nik, name, email, Password, phoneNumber, newDates, jobTitle, salary, isDelete, roleId, managerId);
//            eci.insert(String nik, String name, String email, String password, String phoneNumber, String hireDate, String jobTitle, String salary, String isDelete, String roleId, String managerId);

            response.sendRedirect("view/PageAdmin.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
