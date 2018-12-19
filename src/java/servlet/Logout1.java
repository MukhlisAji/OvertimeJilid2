/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import controllers.OvertimeController;
import controllers.OvertimeControllerInterface;
import controllers.autoPresence;
import daos.DAOInterface;
import daos.GeneralDAO;
import entities.Presence;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
@WebServlet(name = "Logout1", urlPatterns = {"/Logout1"})
public class Logout1 extends HttpServlet {

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
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();
        pw.println("<HTML><BODY>");

        // get current session, and don't create one if it doesn't exist
        HttpSession theSession = request.getSession(false);
        SessionFactory factory = HibernateUtil.getSessionFactory();
        DAOInterface daoi = new GeneralDAO(factory);
        String nik = request.getParameter("nik");
        
        if (theSession != null) {
            pw.println("<BR>Session Id: " + theSession.getId());
            synchronized (theSession) {
                // invalidating a session destroys it
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                String dates = String.valueOf(timestamp);
                String hasil = "";
                String b = dates.substring(0, 10);
                String time = dates.substring(11, 16);
                Object cekP = daoi.cekPresence(nik, b);
                autoPresence presence = new autoPresence();
                System.out.println(cekP);

             

                if (cekP != null) {

                    presence.absen(nik, false);
                } else {

                    presence.absen(nik, true);

                }
                theSession.invalidate();
                pw.println("<BR>Session destroyed");
            }
        }

        response.sendRedirect("view/Login.jsp");
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
