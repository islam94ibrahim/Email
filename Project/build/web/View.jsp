<%--
    Document   : View
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
        ResultSet RS2 = null;
        con = DriverManager.getConnection(url,user,pass);
        stm = con.createStatement();
        RS=stm.executeQuery("SELECT * FROM email WHERE Reciver='"+request.getSession().getAttribute("UserName")+"' and Type=0;");
        RS2=con.createStatement().executeQuery("SELECT * FROM email WHERE Reciver='"+request.getSession().getAttribute("UserName")+"' and Type=1;");
        %>
        <h3 style="text-align: center;color: blue"><b>Your Emails</b></h3>
        <%
        while (RS.next()){
        
        %>
        <form action="seeMail.jsp">
        <table align="center">
            <tr>
                <td><b style="color: blue">From:</b><input type="text" name="From" value="<%=RS.getString("Sender")%>" readonly/></td>
                <td><b style="color: blue">Title:</b><input type="text" name="Title" value="<%=RS.getString("Title")%>" readonly/></td>
                <td><input type="hidden" name="EmailId" value="<%=RS.getString("EmailId")%>"/></td>
                <td><input type="submit" value="View"/></td>
            </tr>
        </table>
        </form>
        <%}%>
        
        <h3 style="text-align: center;color: blue"><b>Archived Emails</b></h3>
        <%
        while (RS2.next()){
        %>
        <form action="seeMail.jsp">
        <table align="center">
            <tr>
                <td><b style="color: blue">From:</b><input type="text" name="From" value="<%=RS2.getString("Sender")%>" readonly/></td>
                <td><b style="color: blue">Title:</b><input type="text" name="Title" value="<%=RS2.getString("Title")%>" readonly/></td>
                <td><input type="hidden" name="EmailId" value="<%=RS2.getString("EmailId")%>"/></td>
                <td><input type="submit" value="View"/></td>
            </tr>
        </table>
        </form>
        <%}%>
    </body>
</html>
