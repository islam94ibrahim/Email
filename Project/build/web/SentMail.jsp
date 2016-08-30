<%--
    Document   : Sent Mail
    Created on : Dec 12, 2015, 6:01:25 PM
    Author     : ESC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Received Mails</title>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>
    <body>
        <%
        String url="jdbc:mysql://localhost:3306/email";
        String user="root";
        String pass="1234";
        Connection con = null;
        Statement stm = null;
        ResultSet RS = null;
        con = DriverManager.getConnection(url,user,pass);
        stm = con.createStatement();
        RS=stm.executeQuery("SELECT * FROM email WHERE Sender='"+request.getSession().getAttribute("UserName")+"';");

        %>
        <h3 style="text-align: center;color: blue"><b>Sent Emails</b></h3>
        <%
        while (RS.next()){
        %>
        <form action="seeSentMail.jsp">
        <table align="center">
            <tr>
                <td><b style="color: blue">To:</b><input type="text" name="From" value="<%=RS.getString("Reciver")%>" readonly/></td>
                <td><b style="color: blue">Title:</b><input type="text" name="Title" value="<%=RS.getString("Title")%>" readonly/></td>
                <td><input type="hidden" name="EmailId" value="<%=RS.getString("EmailId")%>"/></td>
                <td><input type="submit" value="View"/></td>
            </tr>
        </table>
        </form>
        <%}%>
    </body>
</html>
