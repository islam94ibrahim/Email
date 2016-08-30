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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
/**
 *
 * @author ESC
 */
@WebServlet(urlPatterns = {"/CheckLogin"})
public class CheckLogin extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url="jdbc:mysql://localhost:3306/email";
            String user="root";
            String pass="1234";
            Connection con = null;
            Statement stm = null;
            ResultSet RS = null;
            String UserName= request.getParameter("UserName");
            String Password=request.getParameter("Password");
            int check=0;
            try
            {
               Class.forName("com.mysql.jdbc.Driver");
               con = DriverManager.getConnection(url,user,pass);
               stm = con.createStatement();
               RS=stm.executeQuery("SELECT * FROM user;");
               
            }
            
            catch (Exception e){
                out.println("<h1>Error " + e+ "</h1>");
            }
            
            while (RS.next()){
            if (UserName.equals(RS.getString("UserName"))){
                    if (Password.equals(RS.getString("Password"))){
                        check=1;
                        HttpSession Session= request.getSession(true);
                        Session.setAttribute("UserName", UserName);
                        response.sendRedirect("Home.jsp");
                        
                    }
                }
            }             
            if (check==0){
                response.sendRedirect("LogIn.html");
            }
            RS.close();
            stm.close();
            con.close();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CheckLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
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
