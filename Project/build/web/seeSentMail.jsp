<%-- 
    Document   : seeSentMail
    Created on : Dec 12, 2015, 6:38:40 PM
    Author     : ESC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>See Mail</title>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>
    <body>
         <%
        String EmailId=request.getParameter("EmailId");
        String url="jdbc:mysql://localhost:3306/email";
        String user="root";
        String pass="1234";
        Connection con = null;
        Statement stm = null;
        ResultSet RS = null;
        ResultSet RS2 = null;
        con = DriverManager.getConnection(url,user,pass);
        stm = con.createStatement();
        RS=stm.executeQuery("SELECT * FROM email WHERE EmailId="+EmailId+";");
        HttpSession Session=request.getSession(true);
        while(RS.next()){
            Session.setAttribute("EmailId", RS.getString("EmailId"));
        
        %>
        <form action="Forward.jsp">
        <table align="center">
            <tr>
                <td style="color: blue">From</td>
                <td><%=RS.getString("Sender")%></td>
            </tr>
            <tr>
                <td style="color: blue">Title</td>
                <td><%=RS.getString("Title")%></td>
            </tr>
            <tr>
                <td style="color: blue">Date</td>
                <td><%=RS.getString("Date")%></td>
            </tr>
            <tr>
                <td style="color: blue">Content</td>
                <td><textarea name="Content" readonly><%=RS.getString("Content")%></textarea></td>
                <td><input type="hidden" name="EmailId" value="<%=EmailId%>"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Forward"/></td>
            </tr>
        
        <%
            RS2=con.createStatement().executeQuery("SELECT * FROM replay WHERE EmailId="+RS.getString("EmailId")+";");
            }
            while(RS2.next()){
                %>
                <tr>
                    <td style="color: red">Replay From</td>
                    <td><%=RS2.getString("UserName")%></td>
                </tr>
                <tr>
                    <td style="color: red">Date</td>
                    <td><%=RS2.getString("Date")%></td>
                </tr>
                <tr>
                    <td style="color: red">Content</td>
                    <td><textarea readonly><%=RS2.getString("Content")%></textarea></td>
                </tr>
        <%
            }
        %>
        </table>
        </form>
        <form style="text-align: center" action="AddReplay">
            replay <textarea name="replay"></textarea><br>
            <input type="submit" value="Send Replay"/>
        </form>
       
    </body>
</html>
