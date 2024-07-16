<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.*"%>
<%@ page import="java.math.*"%>
<%@	page import="java.security.MessageDigest"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("fname") != null || request.getParameter("lname") != null || request.getParameter("email") != null ||request.getParameter("password") != null || request.getParameter("date") != null ||request.getParameter("gender") != null)
		{
			Statement st =con.createStatement();

			String coname = request.getParameter("coname");
			String headofficecity = request.getParameter("headofficecity");
			String contactno = request.getParameter("contactno");
			String website = request.getParameter("website");
			String companytype = request.getParameter("companytype");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			
			
			
			//hash password
			MessageDigest md = MessageDigest.getInstance("SHA-256");
  				md.update(password.getBytes());
  				byte[] hash = md.digest();
  				String hashpass = new String(Base64.getEncoder().encode(hash));
  				
  				
		    PreparedStatement ps = con.prepareStatement("insert into creg(coname,headofficecity,contactno,website,companytype,email,password) values(?,?,?,?,?,?,?);");
		    ps.setString(1,coname);
		    ps.setString(2,headofficecity);
		    ps.setString(3,contactno);
		    ps.setString(4,website);
		    ps.setString(5,companytype);
		    ps.setString(6,email);
		    ps.setString(7,hashpass);
		  
		    int x = ps.executeUpdate();
		    response.sendRedirect("login-company.jsp");
		  
		}
		else
		{
			/* out.print("enter the details"); */
			/* String er = "enter the details"; */
		}
		
	}
	else
	{
		//out.print("enter the details");
	}
	}
catch(Exception e)
{
// out.println("error" +e);
}
%>
    <!-- NAVIGATION BAR -->
    <header>
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <!-- Brand and toggle get grouped for better mobile display -->
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">RRD</a>
          </div>

          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">     
            <ul class="nav navbar-nav navbar-right">
            
              
              <li><a href="login.jsp">Login</a></li>
            <?php } ?>
            </ul>
          </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
      </nav>
    </header>

    <section>
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-md-offset-4 well">
          <h2 class="text-center">Company Register</h2>
            <form method="post" action="">
              <div class="form-group">
                <label for="companyname">Company Name</label>
                <input type="text" class="form-control" id="companyname" name="coname" placeholder="Company Name" required="">
              </div>
              <div class="form-group">
                <label for="headofficecity">Head Office City</label>
                <input type="text" class="form-control" id="headofficecity" name="headofficecity" placeholder="Head Office City" required="">
              </div>
              <div class="form-group">
                <label for="contactno">Contact Number</label>
                <input type="number" class="form-control" id="contactno" name="contactno" placeholder="Contact Number" minlength="10" maxlength="10" autocomplete="off" onkeypress="return validatePhone(event);" required="">
              </div>
              <div class="form-group">
                <label for="website">Website</label>
                <input type="text" class="form-control" id="website" name="website" placeholder="Website">
              </div>
              <div class="form-group">
                <label for="companytype">Company Type</label>
                <input type="text" class="form-control" id="companytype" name="companytype" placeholder="Company Type">
              </div>
              <div class="form-group">
                <label for="email">Company Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required="">
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input type="text" class="form-control" id="password" name="password" placeholder="password" required="">
              </div>
             
              <div class="text-center">
                <input type="submit" class="btn btn-success" name="submit" value="submit">
              </div>
            
            </form>
          </div>
        </div>
      </div>
    </section>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <script type="text/javascript">
      function validatePhone(event) {

        //event.keycode will return unicode for characters and numbers like a, b, c, 5 etc.
        //event.which will return key for mouse events and other events like ctrl alt etc. 
        var key = window.event ? event.keyCode : event.which;

        if(event.keyCode == 8 || event.keyCode == 46 || event.keyCode == 37 || event.keyCode == 39) {
          // 8 means Backspace
          //46 means Delete
          // 37 means left arrow
          // 39 means right arrow
          return true;
        } else if( key < 48 || key > 57 ) {
          // 48-57 is 0-9 numbers on your keyboard.
          return false;
        } else return true;
      }
    </script>

    <script>
      $("#country").on("change", function() {
        var id = $(this).find(':selected').attr("data-id");
        $("#state").find('option:not(:first)').remove();
        if(id != '') {
          $.post("state.php", {id: id}).done(function(data) {
            $("#state").append(data);
          });
          $('#stateDiv').show();
        } else {
          $('#stateDiv').hide();
          $('#cityDiv').hide();
        }
      });
    </script>

    <script>
      $("#state").on("change", function() {
        var id = $(this).find(':selected').attr("data-id");
        $("#city").find('option:not(:first)').remove();
        if(id != '') {
          $.post("city.php", {id: id}).done(function(data) {
            $("#city").append(data);
          });
          $('#cityDiv').show();
        } else {
          $('#cityDiv').hide();
        }
      });
    </script>
  </body>
</html>

