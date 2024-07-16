<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>RRD</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <%

String sessionid = (String)session.getAttribute("user_id");
String cjpid = request.getParameter("cjpid");

out.print("Hi "+sessionid);

//String cjpid = request.getParameter("cjpid");



try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");
	  if(request.getParameter("cjpid")!= null)
		{
			//out.println("Inside if");
	//INSERT INTO `applyjob`(`ajid`, `name`, `email`, `contactno`, `qulification`, `skills`, `resume`, `cemail`, `status`, `user_id`) 
	//VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]')
			Statement st =con.createStatement();
			
			
			//out.println("Name:"+cjpid);
		    PreparedStatement ps = con.prepareStatement("insert into jobapplicant(jid,cid) values(?,?)");
		   
		    ps.setString(1,sessionid);
		    ps.setString(2,cjpid);
		    
		 
		  
		   
		    int x = ps.executeUpdate();
		    if(x > 0)
		    {
		    	response.sendRedirect("jobsindex.jsp");
		    }
		    else
		    {
		    	out.print("<script>alert('not applied');</script>");
		    }
		   /*  response.sendRedirect("login-candidates.jsp"); */
		}
	  else
	  {
		  
	  }
		
	
	}
catch(Exception e)
{
// out.println("error" +e);
}
%>
  
  </body>
</html>