<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.sql.*"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>apply job</title>

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
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");
String cjpid = request.getParameter("cjpid");
out.print("Hi "+session_name);
out.print("Hi "+sessionid);
%>

<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");
	  if(request.getParameter("cjpid")!= null)
		{
			//out.println("Inside if");
	//INSERT INTO `applyjob`(`ajid`, `name`, `email`, `contactno`, `qulification`, `skills`, `resume`, `cemail`, `status`, `user_id`) 
	//VALUES ('[value-1]','[value-2]','[value-3]','[value-4]','[value-5]','[value-6]','[value-7]','[value-8]','[value-9]','[value-10]')
			Statement st =con.createStatement();
			//String cjpid = request.getParameter("cjpid");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String contactno = request.getParameter("contactno");
			String qulification = request.getParameter("qulification");
			String skills = request.getParameter("skills");
			String resume = request.getParameter("resume");
			String status="pending";
		
			
			//out.println("Name:"+cjpid);
		    PreparedStatement ps = con.prepareStatement("insert into applyjob(name,email,contactno,qulification,skills,resume,cemail,status,user_id) values(?,?,?,?,?,?,?,?,?)");
		    ps.setString(1,name);
		    ps.setString(2,email);
		    ps.setString(3,contactno);
		    ps.setString(4,qulification);
		    ps.setString(5,skills);
		    ps.setString(6,resume);
		    ps.setString(7,cjpid);
		    ps.setString(8,status);
		    ps.setString(9,sessionid);
		    
		 
		  
		   
		    int x = ps.executeUpdate();
		    if(x > 0)
		    {
		    	out.print("<script>alert('job apply successfull');</script>");
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
            <a class="navbar-brand" href="index.php">RRD</a>
          </div>

          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">     
            <ul class="nav navbar-nav navbar-right">
           
             
               <li><a href="logout.php">Logout</a></li> 
              
           
              <li>
              

              </li>
              <!-- <li><a href="../login.php">Login</a></li> -->
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
          <h2 class="text-center">Apply Job</h2>
            <form method="post" action="">
              <div class="form-group">
                <label for="jobsekername">JobSeeker Name</label>
                <input type="text" class="form-control" id="jobseekername" name="name" placeholder="JobSeeker Name" required="">
              </div>
              <div class="form-group">
                <label for="email">email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="email" required="">
              </div>
              <div class="form-group">
                <label for="contactno">Contact Number</label>
                <input type="number" class="form-control" id="contactno" name="contactno" placeholder="Contact Number" minlength="10" maxlength="10" autocomplete="off" onkeypress="return validatePhone(event);" required="">
              </div>
              <div class="form-group">
                <label for="qulification">Qulification</label>
                <input type="text" class="form-control" id="qulification" name="qulification" placeholder="Qighest Qulification">
              </div>
              <div class="form-group">
                <label for="Skills">Skills</label>
                <input type="text" class="form-control" id="Skills" name="skills" placeholder="Skills">
              </div>
              <div class="form-group">
                <label for="resume">Resume</label>
                <input type="file" class="form-control" id="resume" name="resume" placeholder="Resume" required="">
              </div>
              <div class="form-group">
                <input type="submit" name="submit" value="submit">
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

  <!--   <script type="text/javascript">
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
    </script> -->
<!-- 
    <script>
      $("#country").on("change", function() {
        var id = $(this).find(':selected').attr("data-id");
        $("#state").find('option:not(:first)').remove();
        if(id != '') {
          $.post("", {id: id}).done(function(data) {
            $("#state").append(data);
          });
          $('#stateDiv').show();
        } else {
          $('#stateDiv').hide();
          $('#cityDiv').hide();
        }
      });
    </script>
 -->
    <!-- <script>
      $("#state").on("change", function() {
        var id = $(this).find(':selected').attr("data-id");
        $("#city").find('option:not(:first)').remove();
        if(id != '') {
          $.post("", {id: id}).done(function(data) {
            $("#city").append(data);
          });
          $('#cityDiv').show();
        } else {
          $('#cityDiv').hide();
        }
      });
    </script> -->
</body>
</html>