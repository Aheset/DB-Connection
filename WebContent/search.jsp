<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="search.jsp" method = "get">
<input type = "text" name = "city">&nbsp &nbsp &nbsp
<input type = "submit" value = "search">

</form>

<%

Class.forName("com.mysql.jdbc.Driver");
String city = request.getParameter("city");



Connection cnn = DriverManager.getConnection
("jdbc:mysql://localhost:3306/northwind", "root", "job!123!");

String command = " ";
if (city == null || city.isEmpty())//or .equals (" ")
{
	command = "select customerid, companyname, city from customers"; 
}
else {
	command = "select customerid, companyname, city from customers where city like '%" + city + "%'";
			// = '" + city + "'"; 
}
Statement selectCity = cnn.createStatement();

ResultSet rs = selectCity.executeQuery(command);//it is a two d array and we have to save it
//ResultSet is a system variable not something we created

out.print("<table border = 1>");

while(rs.next()==true){//you can do rs.next()
	
	out.print("<tr>");
	out.print("<td>"+ rs.getString(1) + "</td>");
	out.print("<td>"+ rs.getString(2) + "</td>");
	out.print("<td>"+ rs.getString(3) + "</td>");
	out.print("</tr>");
}//we know how many columns we have customerid, companyname, city
out.print("</table>");


%>


</body>
</html>