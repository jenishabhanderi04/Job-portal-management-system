<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<body class="hold-transition login-page">
<!-- importing jsp libraries --> 
		<%@page import="java.sql.*"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.SQLException"%>
		<%-- <%@page import="com.connect.conn"%> --%>
		<%@page import="java.util.concurrent.ThreadLocalRandom"%>
		<%@ page import="javax.mail.*"%>
		<%@ page import="javax.mail.internet.*"%>
		<%@ page import="javax.activation.*"%>
		<%@ page import="java.util.*" %>
		<%@ page import="java.io.*" %>
		<%@ page import="java.lang.Object" %>
		
<%
if(request.getParameter("submit") != null){
	System.out.println("hello");
	try{
		int flag = 0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/job","root","");
		Statement statement = con.createStatement() ;
	    ResultSet resultset =statement.executeQuery("select * from jobreg;") ;
	    int number = ThreadLocalRandom.current().nextInt(1000, 9999 + 1);
	    String mail = request.getParameter("email");
	    while(resultset.next()){
	    		if(request.getParameter("email").equals(resultset.getString(4))){
	    			flag = 1;
	    		}
	         }
	    if(flag == 1){
	    	System.out.println("hello");
	    	session.setAttribute("OTP",number);
	    	session.setAttribute("email",mail);
	    	session.setAttribute("user","jobreg");
	    	System.out.println(number);
	    	try{
	    		//SMTP for sending mail
	    		System.setProperty("javax.net.debug", "ssl:handshake");
	    		//Creating a result for getting status that messsage is delivered or not!
	    		String to=mail;  
	    		String subject="Your OTP";  
	    		String message="Thank you for contacting us. Here is Your OTP:"+number;  
	
	
	    		String from="rajjobportals@gmail.com";  
        		String pass="quodaqzhfgvaqmth";  
	    		String host="smtp.gmail.com";  
	
	    		Properties props = System.getProperties();
	    		System.setProperty("jdk.tls.client.cipherSuites","TLS_AES_128_GCM_SHA256,TLS_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384");
	
	    		props.put("mail.smtp.starttls.enable", "true");
	
	    		props.put("mail.smtp.ssl.protocols", "TLSv1.3");
	    		props.put("mail.smtp.host", host);  
	    		props.put("mail.smtp.user", from);  
	    		props.put("mail.smtp.password", pass);  
	    		props.put("mail.smtp.port", "587");  
	    		props.put("mail.smtp.auth", "true");
	    		props.put("mail.smtp.ssl.trust", "*");
	
	
	    		Session se = Session.getDefaultInstance(props, null);  
	    		MimeMessage mimeMessage = new MimeMessage(se);  
	    		mimeMessage.setFrom(new InternetAddress(from));  
	    		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	    		mimeMessage.setSubject(subject);  
	    		mimeMessage.setText(message);  
	    		Transport transport = se.getTransport("smtp");  
	    		transport.connect(host, from, pass);  
	    		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());  
	    		request.removeAttribute("email");
	
	    		}
	    		catch(Exception e)
	    		{
	    		System.out.println(e);
	    		}
	    	response.sendRedirect("otp.jsp");
	    }else{
	    	ResultSet resultset1 =statement.executeQuery("select * from creg;") ;
	        while(resultset1.next()){
	        		if(request.getParameter("email").equals(resultset1.getString(4))){
	        			flag = 1;
	        		}
	             }
	        if(flag == 1){
	        	session.setAttribute("OTP",number);
	        	session.setAttribute("email",mail);
	        	session.setAttribute("user","creg");
	        	System.out.println(number);	
	        	try{
	        		//SMTP for sending mail
	        		System.setProperty("javax.net.debug", "ssl:handshake");
	        		//Creating a result for getting status that messsage is delivered or not!
	        		String to=mail;  
	        		String subject="Your OTP";  
	        		String message="Thank you for contacting us. Here is Your OTP:"+number;  
	
	
	        		String from="rajjobportals@gmail.com";  
	        		String pass="quodaqzhfgvaqmth";  
	        		String host="smtp.gmail.com";  
	
	        		Properties props = System.getProperties();
	        		System.setProperty("jdk.tls.client.cipherSuites","TLS_AES_128_GCM_SHA256,TLS_AES_256_GCM_SHA384,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_DHE_RSA_WITH_AES_128_GCM_SHA256,TLS_DHE_RSA_WITH_AES_256_GCM_SHA384,TLS_RSA_WITH_AES_128_GCM_SHA256,TLS_RSA_WITH_AES_256_GCM_SHA384");
	
	        		props.put("mail.smtp.starttls.enable", "true");
	
	        		props.put("mail.smtp.ssl.protocols", "TLSv1.3");
	        		props.put("mail.smtp.host", host);  
	        		props.put("mail.smtp.user", from);  
	        		props.put("mail.smtp.password", pass);  
	        		props.put("mail.smtp.port", "587");  
	        		props.put("mail.smtp.auth", "true");
	        		props.put("mail.smtp.ssl.trust", "*");
	
	
	        		Session se = Session.getDefaultInstance(props, null);  
	        		MimeMessage mimeMessage = new MimeMessage(se);  
	        		mimeMessage.setFrom(new InternetAddress(from));  
	        		mimeMessage.setRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	        		mimeMessage.setSubject(subject);  
	        		mimeMessage.setText(message);  
	        		Transport transport = se.getTransport("smtp");  
	        		transport.connect(host, from, pass);  
	        		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());  
	        		request.removeAttribute("email");
	
	        		}
	        		catch(Exception e)
	        		{
	        		System.out.println(e);
		
	        		}
	        	response.sendRedirect("otp.jsp");
	        }else{
	        	out.println("<script>alert('Email is not registered...');</script>");
	        }
	    }
	}catch(Exception e){
		out.println(e);
	}
}
%>
<div class="login-box">
  <div class="login-logo">
    <a href="index.jsp"><b>Job</b> Portal</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Forgot Password</p>
<div class="container">
            <div class="pic">
                        
            </div>
            <div class="data">
                <div class="head">
                
                </div>
                <div class="form">
                    <form method="POST">
                        <div class="info">
                            <div class="head">
                            <label for="">ENTER YOUR EMAIL</label>
                            </div>
                            <input type="text" name="email">
                        </div>
                        <div class="info">
                            <button type="submit" name="submit">SUBMIT</button>
                        </div>
                    </form>
                </div>
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