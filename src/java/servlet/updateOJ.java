/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Email.sendEmail;
import controllers.OvertimeController;
import controllers.OvertimeControllerInterface;
import entities.Overtime;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Mukhlish
 */
@WebServlet(name = "updateOJ", urlPatterns = {"/updateOJ"})
public class updateOJ extends HttpServlet {

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
        String Id = request.getParameter("id");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            SessionFactory factory = HibernateUtil.getSessionFactory();
            OvertimeControllerInterface oci = new OvertimeController(factory);
            Object ob = oci.getById(Id);
            List<Overtime> list = (List<Overtime>) ob;
            Overtime overtime = null;
            for (int i = 0; i < list.size(); i++) {
                overtime = list.get(i);
            }
//        Overtime overtime = (Overtime) ob;
            String Duration = String.valueOf(overtime.getOtDuration());
            String fee = String.valueOf(overtime.getFee());
            String file = "";
            String presence = String.valueOf(overtime.getPresenceId().getPresenceId());
            String description = String.valueOf(overtime.getDescription());
            String Status = "Rejected";
            System.out.print(Id + Duration + fee + Status + file + description + presence);

            if (oci.update(Id, Duration, fee, Status, file, description, presence)) {
                sendEmail e = new sendEmail();
                e.sent(true);
                response.sendRedirect("view/approval.jsp");
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
