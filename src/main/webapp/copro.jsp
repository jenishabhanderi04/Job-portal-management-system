<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>



<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>RRD</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <link rel="stylesheet" href="css/_all-skins.min.css">
  <!-- Custom -->
  <link rel="stylesheet" href="../css/custom.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-green sidebar-mini">
<%
String session_name = (String)session.getAttribute("user_email");
String sessionid = (String)session.getAttribute("user_id");
/* out.print("Hi "+session_name);
out.print("Hi "+sessionid); */
%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");
	
	
	if(request.getParameter("submit") != null)
	{
		
		if(request.getParameter("fname") != null || request.getParameter("lname") != null || request.getParameter("email") != null ||request.getParameter("password") != null || request.getParameter("date") != null ||request.getParameter("gender") != null)
		{
			Statement st =con.createStatement();
//			String rid = request.getParameter("rid");
			String coname = request.getParameter("coname");
			String website = request.getParameter("website");
			String email = request.getParameter("email");
			String aboutme = request.getParameter("aboutme");
			String contactno = request.getParameter("contactno");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
		    String companylogo = request.getParameter("companylogo");
			
			
		    PreparedStatement ps = con.prepareStatement("insert into coprofile(coname,website,email,aboutme,contactno,city,state,companylogo,user_id) values(?,?,?,?,?,?,?,?,?);");
		    ps.setString(1,coname);
		    ps.setString(2,website);
		    ps.setString(3,email);
		    ps.setString(4,aboutme);
		    ps.setString(5,contactno);
		    ps.setString(6,city);
		    ps.setString(7,state);
		    ps.setString(8,companylogo);
		    ps.setString(9,sessionid);
		 
		  
		   
		    int x = ps.executeUpdate();
		   /*  response.sendRedirect("login-candidates.jsp"); */
		  
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
<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index.php" class="logo logo-bg">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>J</b>P</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>RRD</b></span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
                <li>
            <!-- <a href="../jobs.php">Jobs</a> -->
          
               <a class="logo logo-bg"> <%= session.getAttribute("user_name") %>  </a> 
          </li>      
        </ul>
         
      </div>
    </nav>
  </header>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="margin-left: 0px;">

    <section id="candidates" class="content-header">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="box box-solid">
              <div class="box-header with-border">
                <h3 class="box-title">Welcome <b></b></h3>
              </div>
              <div class="box-body no-padding">
                <ul class="nav nav-pills nav-stacked">
                   <li class="active"><a href="index.jsp"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                   <!-- <li><a href="copro.jsp"><i class="fa fa-tv"></i> Registartion details</a></li> -->
                  <li><a href="edit-company.jsp"><i class="fa fa-tv"></i> My Company</a></li>
                  <li><a href="create-job-post.jsp"><i class="fa fa-file-o"></i> Create Job Post</a></li>
                  <li><a href="my-job-post.jsp"><i class="fa fa-file-o"></i> My Job Post</a></li>
                  <li><a href="job-applications.jsp"><i class="fa fa-file-o"></i> Job Application</a></li>
                  <li><a href="settings.jsp"><i class="fa fa-gear"></i> Settings</a></li>
                  <li><a href="logout.jsp"><i class="fa fa-arrow-circle-o-right"></i> Logout</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-9 bg-white padding-2">
            <h2><i>My Company</i></h2>
            <p>In this section you can add your company details</p>
            <div class="row">
              <form action="" method="post">
               
                <div class="col-md-6 latest-job ">
                  <div class="form-group">
                     <label>Company Name</label>
                    <input type="text" class="form-control input-lg" name="coname" value="" required="">
                  </div>
                  <div class="form-group">
                     <label>Website</label>
                    <input type="text" class="form-control input-lg" name="website" value="" required="">
                  </div>
                  <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control input-lg" id="email" placeholder="Email" name = "email" value="">
                  </div>
                  <div class="form-group">
                    <label>About Company</label>
                    <textarea class="form-control input-lg" rows="4" name="aboutme"></textarea>
                  </div>
                  
                </div>
                <div class="col-md-6 latest-job ">
                  <div class="form-group">
                    <label for="contactno">Contact Number</label>
                    <input type="text" class="form-control input-lg" id="contactno" name="contactno" placeholder="Contact Number" value="">
                  </div>
                  <div class="form-group">
                    <label for="city">City</label>
                    <input type="text" class="form-control input-lg" id="city" name="city" value="" placeholder="	">
                  </div>
                  <div class="form-group">
                    <label for="state">State</label>
                    <input type="text" class="form-control input-lg" id="state" name="state" placeholder="state" value="">
                  </div>
                  <div class="form-group">
                    <label>Company Logo</label>
                    <input type="file" name="companylogo" class="btn btn-default">
                    <?php  ?>
                    <!-- <img src="../uploads/logo/<?php ?>" class="img-responsive" style="max-height: 200px; max-width: 200px;"> -->
                    <?php  ?>
                  </div>
                  <div class="form-group">
                    <input type="submit" class="btn btn-flat btn-success" name="submit" value="submit">
                  </div>
                </div>
                    
              </form>

              



            </div>
          
            <div class="row">
              <div class="col-md-12 text-center">
                
              </div>
            </div>
            
            
          </div>
        </div>
      </div>
    </section>

    

  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer" style="margin-left: 0px;">
    <!-- <div class="text-center">
      <strong>Copyright &copy; 2016-2017 <a href="learningfromscratch.online">Job Portal</a>.</strong> All rights
    reserved.
    </div> -->
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
</body>
</html>
