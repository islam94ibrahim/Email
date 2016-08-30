<%-- 
    Document   : Forward
    Created on : Dec 13, 2015, 6:42:28 PM
    Author     : ESC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forward</title>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <script>
            function sendajax() {
                var name = document.forms["form1"]["To"].value;
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.open("Get", "CheckSender?name=" + name, true);
                xmlhttp.send();
                xmlhttp.onreadystatechange = function ()
                {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        document.getElementById("show_response").innerHTML = xmlhttp.responseText;
                    }
                }
            }
            function Check(){
            var Title=document.forms["form1"]["Title"].value;
            var Content=document.forms["form1"]["Content"].value;
            
            if (Title == "" || Content == ""){
                alert("There is an empty field");
                return false;
            }
        }
        </script>
    </head>
    <body>
        <%
            String Content=request.getParameter("Content");
            String EmailId=request.getParameter("EmailId");
            String url="jdbc:mysql://localhost:3306/email";
            String user="root";
            String pass="1234";
            Connection con = null;
            Statement stm = null;
            ResultSet RS = null;
            con = DriverManager.getConnection(url,user,pass);
            stm = con.createStatement();
            RS=stm.executeQuery("SELECT * FROM email WHERE EmailId='"+EmailId+"';");
            while(RS.next()){
        %>
        <form name="form1" method="post" action="NewEmail" >
            <table align="center">
            <tr>
                <td>To</td>
                <td><input type="text" name="To"/></td>
                <td><input type="button" value="Check Reciver" onclick="sendajax()"/></td>
                <td><div id="show_response"></div></td>
            </tr>
            <tr>
                <td>Title</td>
                <td><input type="text" name="Title" /></td>
            </tr>
            <tr>
                <td>Content</td>
                <td><textarea name="Content">From:<%=RS.getString("Sender")%>&#13;&#10Title:<%=RS.getString("Title")%>&#13;&#10Date:<%=RS.getString("Date")%>&#13;&#10Content:<%=Content%></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Send Mail" onclick="return Check()" /></td>
            </tr>
            </table>
        </form>
            <%}%>
    </body>
</html>
