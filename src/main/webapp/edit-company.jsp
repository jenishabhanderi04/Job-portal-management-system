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
                 <!--   <li><a href="copro.jsp"><i class="fa fa-tv"></i> Create profile</a></li> -->
                  <li><a href="edit-company.jsp"><i class="fa fa-tv"></i> My Company</a></li>
                  <li><a href="create-job-post.jsp"><i class="fa fa-file-o"></i> Create Job Post</a></li>
                  <li><a href="my-job-post.jsp"><i class="fa fa-file-o"></i> My Job Post</a></li>
                  <li><a href="job-applications.jsp"><i class="fa fa-file-o"></i> Job Application</a></li>
                  <!-- <li><a href="settings.jsp"><i class="fa fa-gear"></i> Settings</a></li> -->
                  <li><a href="logout.jsp"><i class="fa fa-arrow-circle-o-right"></i> Logout</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-9 bg-white padding-2">
            <h2><i>Edit Company</i></h2>
            <p>In this section you can add your company details</p>
            <div class="row">
            <%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");


try{
	/* if(request.getParameter("submit")!= null)
	{ */
	


		Statement s = (Statement)con.createStatement();
		ResultSet rs = s.executeQuery("select * from creg where cid ="+sessionid+"");
		
		while(rs.next())
		{


		
%>
    
            
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-md-offset-4 well">
          <h2 class="text-center">Company Register</h2>
            <form method="post" action="">
              <div class="form-group">
                <label for="companyname">Company Name</label>
                <input type="text" class="form-control" id="companyname" name="coname" placeholder="Company Name" required="" value="<%= rs.getString("coname") %>">
              </div>
              <div class="form-group">
                <label for="headofficecity">Head Office City</label>
                <input type="text" class="form-control" id="headofficecity" name="headofficecity" placeholder="Head Office City" required="" value="<%= rs.getString("headofficecity") %>">
              </div>
              <div class="form-group">
                <label for="contactno">Contact Number</label>
                <input type="number" class="form-control" id="contactno" name="contactno" placeholder="Contact Number" minlength="10" maxlength="10" autocomplete="off" onkeypress="return validatePhone(event);" required="" value="<%= rs.getString("contactno") %>">
              </div>
              <div class="form-group">
                <label for="website">Website</label>
                <input type="text" class="form-control" id="website" name="website" placeholder="Website" value="<%= rs.getString("website") %>">
              </div>
              <div class="form-group">
                <label for="companytype">Company Type</label>
                <input type="text" class="form-control" id="companytype" name="companytype" placeholder="Company Type" value="<%= rs.getString("companytype") %>">
              </div>
              <div class="form-group">
                <label for="email">Company Email Address</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required="" value="<%= rs.getString("email") %>">
              </div>
            
             
              <div class="text-center">
                <input type="submit" class="btn btn-success" name="submit" value="submit">
              </div>
            
            </form>
          </div>
        </div>
      </div>
 

                <% 
            if(request.getParameter("submit")!= null)
	{
	
            	String coname = request.getParameter("coname");
    			String headofficecity = request.getParameter("headofficecity");
    			String contactno = request.getParameter("contactno");
    			String website = request.getParameter("website");
    		    String companytype = request.getParameter("companytype");
    			String email = request.getParameter("email");
    		  
    	
		    PreparedStatement ps = con.prepareStatement("update creg set coname=?,headofficecity=?,contactno=?, website=?,companytype=?,email=? where cid = ?;");
		    ps.setString(1,coname);
		    ps.setString(2,headofficecity);
		    ps.setString(3,contactno);
		    ps.setString(4,website);
		   
		    ps.setString(5,companytype);
		    ps.setString(6,email);
		 
		    ps.setString(7,sessionid);
		 
		    int x = ps.executeUpdate();
		    response.sendRedirect("edit-company.jsp");
		
	}
          
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
