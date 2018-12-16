/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.EmployeeController;
import controllers.EmployeeControllerInterface;
import controllers.autoPresence;
import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Employee;
import entities.Presence;
import entities.Role;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jbcrypt.BCrypt;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
@WebServlet(name = "data", urlPatterns = {"/data"})
public class data extends HttpServlet {

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
        String nik = request.getParameter("NIK");
        String password = request.getParameter("passwordEmp");
        RequestDispatcher dispatcher = null;
        HttpSession session = request.getSession();
        try (PrintWriter out = response.getWriter()) {
            SessionFactory factory = HibernateUtil.getSessionFactory();
            /* TODO output your page here. You may use following sample code. */
            EmployeeControllerInterface eci = new EmployeeController(factory);
            DAOInterface daoi = new GeneralDAO(factory);
//            Object cekP = daoi.getMaxPresence(new Presence(), "14411");
            Employee employee = eci.getByNIK(nik);
            String passwordEncryp = employee.getPassword();
            autoPresence auto = new autoPresence();
            if (BCrypt.checkpw(password, passwordEncryp)) {
                String Status = employee.getRoleId().getRoleName();
                Role role = employee.getRoleId();
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                String dates = String.valueOf(timestamp);
                String hasil = "";
                String b = dates.substring(0, 10);
                Object cekP = daoi.cekPresence(nik, b);
                autoPresence presence = new autoPresence();
                System.out.println(cekP);
                if (cekP != null) {
//                    System.out.println("bbb");

//            pci.insert("", "18:18", null, "12/12/2018", "14411");
                    presence.absen(nik, false);
                } else {
//             pci.update("8", "18:18", "12.14", "12/12/2018", "14411");
//            presence.absen("14411", false);
                    //   presence.absen("14413", false);
                    presence.absen(nik, true);

                }

                if (Status.matches("Manager")) {
                    session.setAttribute("dataEmployee", employee);
                    response.sendRedirect("view/PageManager.jsp");
                } else if (Status.matches("Admin")) {
                    session.setAttribute("dataEmployee", employee);
                    response.sendRedirect("view/PageAdmin.jsp");
                } else if (Status.matches("Employee")) {
                    session.setAttribute("dataEmployee", employee);
                    response.sendRedirect("view/PageEmployee.jsp");
                }

            } else {
                session.setAttribute("dataEmployee", employee);
                dispatcher.include(request, response);
                response.sendRedirect("view/register.jsp");
                out.print(BCrypt.checkpw(password, passwordEncryp));
            }
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
