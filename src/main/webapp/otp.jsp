<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./assets/css/otp.css">
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
<%
try{
	int OTP = (Integer)session.getAttribute("OTP");
	if(OTP ==  Integer.parseInt(request.getParameter("otp"))){
		response.sendRedirect("changepas.jsp");
	}else{
		out.println("<script>alert('Enter password properly..');</script>");
	}
}catch(Exception e){
	System.out.println(e);
}
%>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <a href="index.jsp"><b>Job</b> Portal</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Enter OTP</p>
    <div class="background">
       
        <div class="bsec">
            <h4> FOR THE NUMBER</h4>
            <form method="post">
                <div class="ibg">
                    <input type="number" name="otp" >
                </div>
                <div class="btn">
                    <input type="submit" class="btnsolid" value="Login" name="submit">
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