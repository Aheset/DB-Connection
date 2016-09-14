<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>

  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="fav-show.css" rel="stylesheet" type="text/css">
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
</head>
<body>
<div class = "form">
<form action="index.jsp" method = "get">
<input class = "input" type = "text" name = "Category">&nbsp &nbsp &nbsp
<input class = "input" type = "submit" value = "Search">

</form>
</div>



<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="images/BadMoms.jpg" alt="Bad Moms" width="350" height="345">
      </div>

      <div class="item">
        <img src="images/Bridesmade.jpg" alt="Bridesmade" width="350" height="345">
      </div>
    
      <div class="item">
        <img src="images/Frozen.jpg" alt="Frozen" width="350" height="345">
      </div>

      <div class="item">
        <img src="images/InsideOut.jpg" alt="Inside Out" width="350" height="345">
      </div>
      
      <div class="item">
        <img src="images/TheMartian.jpg" alt="The Martian" width="350" height="345">
      </div> 
      
      <div class="item">
        <img src="images/Ghostbuster.jpg" alt="Ghostbuster" width="350" height="345">
      </div> 
      
      <div class="item">
        <img src="images/MothersDay.jpg" alt="Mothers Day" width="350" height="345">
      </div> 
      
      <div class="item">
        <img src="images/CaptainFantastic.jpg" alt="Captain Fantastic" width="350" height="345">
      </div> 
      
      <div class="item">
        <img src="images/JasonBourne.jpg" alt="Jason Bourne" width="350" height="345">
      </div> 
      
      <div class="item">
        <img src="images/CaptainAmerica.jpg" alt="Captain America" width="350" height="345">
      </div> 
      
      
      
      
    </div>
    
    
    
    
    

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>


</div>


<%

Class.forName("com.mysql.jdbc.Driver");
String Category = request.getParameter("Category");



Connection cnn = DriverManager.getConnection
("jdbc:mysql://localhost:3306/movies", "root", "job!123!");

String command = " ";
if (Category == null || Category.isEmpty())//or .equals (" ")
{
	command = "select Title, Category, Image from movies"; 
}
else {
	command = "select Title, Category, Image from movies where Category like '%" + Category + "%'";
			// = '" + Category + "'"; 
}
Statement selectCategory = cnn.createStatement();

ResultSet rs = selectCategory.executeQuery(command);//it is a two d array and we have to save it
//ResultSet is a system variable not something we created

out.print("<table border = 1>");

while(rs.next()==true){//you can do rs.next()
	
	out.print("<tr>");
	out.print("<td>"+ rs.getString(1) + "</td>");
	out.print("<td>"+ rs.getString(2) + "</td>");
	out.print("<td>"+ rs.getString(3) + "</td>");
	//out.print("<td>"<img src = \" images> + rs.getString(3) + "</td>");
	out.print("</tr>");
}//we know how many columns we have Title, Category, Image
out.print("</table>");


%>

</div><!--container-->

</div><!--col-->


<div class="container2">
<div class="row">

  <div class="col-xs-3 col-md-3">
    <a href="#" class="thumbnail">
      <img src="images/BadMoms.jpg" alt="Bad Moms">
      
    </a>
  </div>

  <div class="col-xs-3 col-md-3">
    <a href="#" class="thumbnail">
      <img src="images/Bridesmade.jpg" alt="Bridesmade">
      
    </a>
  </div>
  
<div class="col-xs-3 col-md-3">
    <a href="#" class="thumbnail">
      
      <img src="images/Frozen.jpg" alt="Frozen">
      
    </a>
  </div>

  <div class="col-xs-3 col-md-3">
    <a href="#" class="thumbnail">
      
      <img src="images/InsideOut.jpg" alt="InsideOut">
    </a>
  </div>
</div>



</div>

</body>

</html>

