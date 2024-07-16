<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="login-box">
  <div class="login-logo">
    <a href="index.jsp"><b>Job</b> Portal</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Candidates Login</p>

    <form method="post">
       <div class="form-group has-feedback">
        <input type="email" name="email" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
       <div class="form-group has-feedback">
       <input type="checkbox" name="rememberMe" id="rememberMe" value ="true">Remember me
       </div>
      <div class="row">
        <div class="col-xs-8">
          <a href="#">I forgot my password</a>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <input type="submit" class="btn btn-primary btn-block btn-flat" value="submit" name="submit">
        </div>
        <!-- /.col -->
      </div>
    </form>

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