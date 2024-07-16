<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Job Portal</title>
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
  <link rel="stylesheet" href="css/custom.css">
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
<!--                 <li><a href="jopro.jsp"><i class="fa fa-user"></i> create Profile</a></li> -->
                  <li><a href="edit-profile.jsp"><i class="fa fa-user"></i> Edit Profile</a></li>
                  <li class="active"><a href="viewjobapp.jsp"><i class="fa fa-address-card-o"></i> My Applications</a></li>
                  <li><a href="jobs.jsp"><i class="fa fa-list-ul"></i> Jobs</a></li>
                <!--   <li><a href="settings.php"><i class="fa fa-gear"></i> Settings</a></li> -->
                   
                  <li><a href="logout.jsp"><i class="fa fa-arrow-circle-o-right"></i> Logout</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-9 bg-white padding-2">
            <h2><i>Edit Profile</i></h2>
            
            
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
            <!--   <section class="content-header"> -->
        <section class="content-header">
      <div class="container">
        <div class="row latest-job margin-top-50 margin-bottom-20 bg-white">
          <h1 class="text-center margin-bottom-20">JobSeeker Registration</h1>
          <form method="post" id="registerCandidates"  >
            <div class="col-md-6 latest-job ">
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="fname" name="fname" placeholder="First Name *" required value="<%=rs.getString("fname") %>">
              </div>
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="lname" name="lname" placeholder="Last Name *" required value="<%=rs.getString("lname") %>">
              </div>
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="email" name="email" placeholder="Email *" required value="<%= rs.getString("email") %>">
              </div>
              <div class="form-group">
                <input type="text" class="form-control input-lg" rows="4" id="aboutme" name="aboutme" placeholder="Brief intro about yourself *" required value="<%= rs.getString("aboutme") %>">
              </div>
              <div class="form-group">
                <label>Date Of Birth</label>
                <input class="form-control input-lg" type="date" id="dob" min="1960-01-01" max="1999-01-31" name="dob" placeholder="Date Of Birth" required value="<%= rs.getString("dob") %>">
              </div>
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="age" name="age" placeholder="Age" readonly required value="<%= rs.getString("age") %>">
              </div>
              <div class="form-group">
                <label>Passing Year</label>
                <input class="form-control input-lg" type="date" id="passyear" name="passyear" placeholder="Passing Year" required value="<%= rs.getString("passyear") %>">
              </div>       
             <!--  <div class="form-group">
                <input class="form-control input-lg" type="text" id="qualification" name="higheestqulification  " placeholder="Highest Qualification">
              </div> -->
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="stream" name="stream" placeholder="Stream" required value="<%= rs.getString("stream") %>">
              </div>                    
              <div class="form-group checkbox">
                <label><input type="checkbox"> I accept terms & conditions</label>
              </div>
              <div class="form-group">
                <input type="submit" name="submit" value="submit" class="btn btn-flat btn-success">
              </div>
                 

            </div>            
            <div class="col-md-6 latest-job ">

            
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="contactno" name="contactno" minlength="10" maxlength="10" onkeypress="return validatePhone(event);" placeholder="Phone Number" required value="<%= rs.getString("contactno") %>">
              </div>
              <div class="form-group">
                <input type="text" class="form-control input-lg" rows="4" id="address" name="address" placeholder="Address" required value="<%=rs.getString("address") %>">
              </div>
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="city" name="city" placeholder="City" required value="<%=rs.getString("city") %>">
              </div>
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="state" name="state" placeholder="State" required value="<%= rs.getString("state") %>">
              </div>
              <div class="form-group">
                <input type="text" class="form-control input-lg" rows="4" id="skills" name="skills" placeholder="Enter Skills" required value="<%=rs.getString("skills") %>">
              </div>              
              <div class="form-group">
                <input class="form-control input-lg" type="text" id="designation" name="designation" placeholder="Designation" required value="<%=rs.getString("designation") %>">
              </div>

              <!-- <div class="form-group">
                <label style="color: red;">File Format PDF Only!</label>
                <input type="file" name="resume" class="btn btn-flat btn-danger" required>
              </div> -->
            </div>
          </form>
          
        </div>
      </div>
    </section>



             <% 
            if(request.getParameter("submit")!= null)
	{
	
		Statement st =con.createStatement();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String aboutme = request.getParameter("aboutme");
		String dob = request.getParameter("dob");
		String age = request.getParameter("age");
		String passyear = request.getParameter("passyear");
		String stream = request.getParameter("stream");
		String contactno = request.getParameter("contactno");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String skills = request.getParameter("skills");
		String designation = request.getParameter("designation");

    	
		    PreparedStatement ps = con.prepareStatement("update jobreg set fname=?,lname=?,email=?, aboutme=?,dob=?,age=?,passyear=?,stream=?,contactno=?, address=?,city=?,state=?, skills=?,designation=?  where jid = ?;");
		    ps.setString(1,fname);
		    ps.setString(2,lname);
		    ps.setString(3,email);
		    ps.setString(4,aboutme);
		    ps.setString(5,dob);
		    ps.setString(6,age);
		    ps.setString(7,passyear);
		    ps.setString(8,stream);
		    ps.setString(9,contactno);
		    ps.setString(10,address);
		    ps.setString(11,city);
		    ps.setString(12,state);
		    ps.setString(13,skills);
		    ps.setString(14,designation);
		    ps.setString(15,sessionid);
		 
		    int x = ps.executeUpdate();
		    response.sendRedirect("edit-profile.jsp");
		
	}
          
		}
		
		
/* 	} */
}
catch(Exception e)
{
	//out.println(e);
}

%>
            
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

 <!--  <footer class="main-footer" style="margin-left: 0px;">
    <div class="text-center">
      <strong>Copyright &copy; 2022-2023 <a href="learningfromscratch.online">RRD</a>.</strong> All rights
    reserved.
    </div>
  </footer> -->

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>

</div>




<!-- jQuery 3 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="js/adminlte.min.js"></script>
</body>
</html>