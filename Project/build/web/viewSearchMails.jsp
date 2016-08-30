<%-- 
    Document   : viewSearchMails
    Created on : Dec 13, 2015, 6:16:12 PM
    Author     : ESC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>
    <body>
        <h3 style="text-align: center;color: blue"><b>Result</b></h3>
        <%
        String url="jdbc:mysql://localhost:3306/email";
        String user="root";
        String pass="1234";
        String From=request.getParameter("From");
        String To=request.getParameter("To");
        Connection con = null;
        Statement stm = null;
        ResultSet RS = null;
        con = DriverManager.getConnection(url,user,pass);
        stm = con.createStatement();
        RS=stm.executeQuery("SELECT * FROM email WHERE Date BETWEEN '"+From+"' AND '"+To+"';");
        if (RS.next() == false){
            %>
        <h3 style="text-align: center"><b>No Emails for that date range</b></h3>
            <%
        }
        else{
            while(RS.next()){
            %>
        <form action="seeMail.jsp">
        <table align="center">
            <tr>
                <td><b style="color: blue">From:</b><input type="text" name="From" value="<%=RS.getString("Sender")%>" readonly/></td>
                <td><b style="color: blue">Title:</b><input type="text" name="Title" value="<%=RS.getString("Title")%>" readonly/></td>
                <td><b style="color: blue">Date:</b><input type="text" value="<%=RS.getString("Date")%>"/></td>
                <td><input type="hidden" name="EmailId" value="<%=RS.getString("EmailId")%>"/></td>
                <td><input type="submit" value="View"/></td>
            </tr>
        </table>
        </form>
        <%
            }
        }
        %>
    </body>
</html>
