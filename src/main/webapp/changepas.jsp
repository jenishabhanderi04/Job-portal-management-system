<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/css/changePassword.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" integrity="sha512-HK5fgLBL+xu6dm/Ii3z4xhlSUyZgTT9tuc/hSrtw6uzJOvgRr2a9jyxxT1ely+B+xFAmJKVSTbpM/CuL7qxO8w==" crossorigin="anonymous" referrerpolicy="no-referrer">
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
  <!-- iCheck -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/iCheck/1.0.2/skins/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <style>
   .er{
color:red;
text-align:center;
margin-top:80px;
margin-bottom:0px;
}
</style>
</head>
<!-- importing jsp libraries --> 
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%-- <%@page import="com.connect.conn"%> --%>
<%@page import="java.security.*"%>
<%@page import="java.util.*"%>

<%
if(request.getParameter("submit") != null){
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");
		String mail = (String)session.getAttribute("email");
		String pwd = request.getParameter("password");
		String user = (String)session.getAttribute("user");
		String cpwd = request.getParameter("confirmPassword");
		String hashValue;
		
		
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(pwd.getBytes());
			byte[] hash = md.digest();
			String hashpass = new String(Base64.getEncoder().encode(hash));
			
			
			
		if(pwd.equals(cpwd)){
			PreparedStatement p = con.prepareStatement("update "+ user + " set password = '"+hashpass+"' where email= '"+mail+"';");
			p.executeUpdate();
			if(user.equals("creg"))
			{
				response.sendRedirect("login-company.jsp");	
			}
			else{
				response.sendRedirect("login-candidates.jsp");
			}
			
		}else{
			out.println("<script>alert('Enter password properly..');</script>");
		}
	}catch(Exception e){
		System.out.println(e);
	}
}
%>

<body class="hold-transition login-page">

<div class="login-box">
  <div class="login-logo">
    <a href="index.jsp"><b>Job</b> Portal</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Change Password</p>
<div class="mainDiv">
    <img src="./assets/img/gallery/bg.jpg" alt="">
  <div class="cardStyle">
    <form method="post" name="signupForm" id="signupForm">
        <div class="logo">
    
    </div>
    <div class="inputDiv">
      <label class="inputLabel" for="password">New Password</label>
      <input type="password" id="password" name="password" required>
    </div>
      
    <div class="inputDiv">
      <label class="inputLabel" for="confirmPassword">Confirm Password</label>
      <input type="password" id="confirmPassword" name="confirmPassword">
    </div>
    
    <div class="buttonWrapper">
      <button type="submit" id="submitButton" name="submit" class="submitButton pure-button pure-button-primary">
        <span>Continue</span>
        <span id="loader"></span>
      </button>
    </div>
      
  </form>
  </div>
</div>
  <br>

 
      <!-- <div>
        <p class="text-center">Invalid Email/Password! Try Again!</p>
      </div> -->
      

   
      <!-- <div>
        <p class="text-center">Your Account Is Active. You Can Login</p>
    
      <!-- <div>
        <p class="text-center"><?php //echo $_SESSION['loginActiveError']; ?></p>
      </div> -->
  

  </div>
  <!-- /.login-box-body -->
</div>
</body>
</html>