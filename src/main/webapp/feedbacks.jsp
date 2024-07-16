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
/* out.print("Hi "+session_name);
out.print("Hi "+sessionid); */
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
                <!-- <li><a href="jopro.jsp"><i class="fa fa-user"></i> create Profile</a></li> -->
                  <li><a href="edit-profile.jsp"><i class="fa fa-user"></i> Edit Profile</a></li>
                  <li class="active"><a href="myapplication.jsp"><i class="fa fa-address-card-o"></i> My Applications</a></li>
                  <li><a href="jobs.jsp"><i class="fa fa-list-ul"></i> Jobs</a></li>
                   <li><a href="feedbacks.jsp"><i class="fa fa-list-ul"></i> Feedback</a></li>
                  <li><a href="settings.php"><i class="fa fa-gear"></i> Settings</a></li>
                   
                  <li><a href="logout.jsp"><i class="fa fa-arrow-circle-o-right"></i> Logout</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-9 bg-white padding-2">
            <h2><i>Feedback</i></h2>
            <p>In this section you can add your company details</p>
            <div class="row">
            <%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");


try{
	/* if(request.getParameter("submit")!= null)
	{ */
	


		Statement s = (Statement)con.createStatement();
		ResultSet rs = s.executeQuery("select * from jobreg where jid ="+sessionid+"");
		
		while(rs.next())
		{


		
%>
    
<div class="login-box">
  <div class="login-logo">
    <a href="index.jsp"><b>Job</b> Portal</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Candidates Login</p>

    <form method="post">
       <div class="form-group has-feedback">
        <input type="email" name="email" class="form-control" placeholder="Email" value="<%= rs.getString("email") %>" >
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="text" name="comment" class="form-control" placeholder="comment">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
     
      <div class="row">
       
        <!-- /.col -->
        <div class="col-xs-4">
          <input type="submit" class="btn btn-primary btn-block btn-flat" value="submit" name="submit">
        </div>
        <!-- /.col -->
      </div>
    </form>
                <% 
           
          
		}
		 if(request.getParameter("submit")!= null)
			{
			
		    			String email = request.getParameter("email");
		    			String comment = request.getParameter("comment");
		    			
		    	
				    PreparedStatement ps = con.prepareStatement("insert into sfeedback(email,comment,userid) values(?,?,?);");
				    ps.setString(1,email);
				    ps.setString(2,comment);
				   
				   
				    ps.setString(3,sessionid);
				 
				    int x = ps.executeUpdate();
				   //	 response.sendRedirect("edit-company.jsp");
				
			}
		
/* 	} */
}
catch(Exception e)
{
	//out.println(e);
}

%>
            



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
