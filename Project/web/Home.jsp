<%-- 
    Document   : Home
    Created on : Dec 9, 2015, 4:07:09 PM
    Author     : ESC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FCI Mail Home</title>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>
    <body>
        <h3 style="margin-left:500px;color: blue"><b>FCI Mail</b></h3>
        <div>
        <b style="float: right;margin-right: 450px"><%=request.getSession().getAttribute("UserName")%></b>
        <a href="View.jsp" style="float: left;margin-left: 500px">View Mails</a><br>
        </div>
        <div>
        <a style="float: right;margin-right: 450px" href="LogIn.html">Sign Out</a>
        <a href="SentMail.jsp" style="float: left;margin-left: 500px">Sent Mails</a><br>
        </div>
        <div>
        <a href="UpdateInfo.jsp" style="float: right;margin-right: 450px"><b>Update Personal Info</b></a>
        <a href="Delete.jsp" style="float: left;margin-left: 500px">Delete Mails</a><br>
        </div>
        <a href="Archive.jsp" style="margin-left: 500px">Archive Mails</a><br>
        <a href="SendMail.html" style="margin-left: 500px">Send new Email</a><br>
        <a href="SearchMail.html" style="margin-left: 500px">Search Email</a>
        
    </body>
</html>
