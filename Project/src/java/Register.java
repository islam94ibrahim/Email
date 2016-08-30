/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ESC
 */
@WebServlet(urlPatterns = {"/Register"})
public class Register extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String Name=request.getParameter("Name");
            String UserName=request.getParameter("UserName");
            String Password=request.getParameter("Password");
            String Age=request.getParameter("Age");
            String Gender=request.getParameter("Gender");
            String Phone=request.getParameter("Phone");
            String Country=request.getParameter("Country");
            String url="jdbc:mysql://localhost:3306/email";
            String user="root";
            String pass="1234";
            Connection con = null;
            Statement stm = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(url,user,pass);
                stm = con.createStatement();
                stm.executeUpdate("INSERT INTO user (UserName,Password) VALUES ('"+UserName+"','"+Password+"');");
                stm.executeUpdate("INSERT INTO userinfo (UserName,Name,Age,Gender,Phone,Country) "
                        + "VALUES ('"+UserName+"','"+Name+"',"+Age+",'"+Gender+"',"+Phone+",'"+Country+"');");
                HttpSession Session= request.getSession(true);
                Session.setAttribute("UserName", UserName);
                response.sendRedirect("Home.jsp");
            }
            catch (Exception e){
                out.print(e);
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
