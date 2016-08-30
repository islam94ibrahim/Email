<%-- 
    Document   : UpdateInfo
    Created on : Dec 9, 2015, 9:48:44 PM
    Author     : ESC
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Your Information</title>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <script>
        function Check (){
            var Name=document.forms["form1"]["Name"].value;
            var Password=document.forms["form1"]["Password"].value;
            var Age=document.forms["form1"]["Age"].value;
            var Gender=document.forms["form1"]["Gender"].value;
            var Phone=document.forms["form1"]["Phone"].value;
            var Country=document.forms["form1"]["Country"].value;
            
            if (Name=="" || Password=="" || Age=="" || Gender=="" || Phone=="" || Country==""){
                alert("There is empty field");
                return false;
            }
            else if (Name.length >15){
                alert ("Maximum First Name length is 15");
                return false;
            }
            else if (Password.length != 7){
                    alert("Password must be of length 7");
                    return false;
                }
            else if (isNaN(Age) || isNaN(Phone)){
                alert("Age/Phone must be number");
                return false;
            }
            else if (Gender.length >6){
                alert ("Maximum Gender length is 6");
                return false;
            }
            else if (Country.length >20){
                alert ("Maximum Gender length is 20");
                return false;
            }
        }
    </script>
    <% 
        String url="jdbc:mysql://localhost:3306/email";
        String user="root";
        String pass="1234";
        Connection con = null;
        Statement stm = null;
        Statement stm2 = null;
        ResultSet RS = null;
        ResultSet RS2 = null;
        con = DriverManager.getConnection(url,user,pass);
        stm = con.createStatement();
        stm2 = con.createStatement();
        RS=stm.executeQuery("SELECT Password FROM user WHERE UserName='"+request.getSession().getAttribute("UserName")+"';");
        RS2=stm2.executeQuery("SELECT * FROM userinfo WHERE UserName='"+request.getSession().getAttribute("UserName")+"';");
        String Name="",Password="",Age="",Gender="",Phone="",Country="";
        while (RS.next()){
            Password=RS.getString("Password");
        }
        while (RS2.next()){
            Name=RS2.getString("Name");
            Age=RS2.getString("Age");
            Gender=RS2.getString("Gender");
            Phone=RS2.getString("Phone");
            Country=RS2.getString("Country");
        }
        
    %>
    </head>
    <body>
        <h2 style="margin-left:500px;color: blue">Personal Info</h2>
        <form name="form1" method="post" action="UpdateInformation" >
        <table align="center">
            <tr>
                <td>First Name</td>
                <td><input type="text" name="Name" value="<%=Name%>" /></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="text" name="Password" value="<%=Password%>"/></td>
            </tr>
            <tr>
                <td>Age</td>
                <td><input type="text" name="Age" value="<%=Age%>"/></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td><input type="text" name="Gender" value="<%=Gender%>"/></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><input type="text" name="Phone" value="<%=Phone%>"/></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><input type="text" name="Country" value="<%=Country%>"/></td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align: right"><input style="background-color: blue;color: white" type="submit" value="Edit"
                                                     onclick="return Check()"/></td>
            </tr>
        </table>
        </form>
    </body>
</html>
