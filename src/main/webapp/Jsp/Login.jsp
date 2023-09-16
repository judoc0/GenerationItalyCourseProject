<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title> Login Form Page</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
    integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style type="text/css">
  <%@ include file = "CSS/NavBar.css"%>

  <%@ include file="CSS/style.css" %>

<%@ include file = "CSS/FooterStyle.css"%>
  
  
  body{
   height: 100vh;
   overflow: hidden;
  }
  
  footer{
  height: 10vh;
  }

  #containform{ 
   
 	display: flex;
    justify-content: center;
    height: 100%;
    width: 100%; 
    align-items: flex-start;
   	
  
  }
    
  .box { 
    position: relative;
    width: 380px;
    height: 420px;
    background: #000000;
    border-radius: 8px;
    overflow: hidden;
  }
  .box::before {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 380px;
    height: 420px;
    background: linear-gradient(0deg, transparent, #FFB645, #FFB645);
    transform-origin: bottom right;
    animation: animate 6s linear infinite;
  }
  .box::after {
    content: "";
    position: absolute;
    top: -50%;
    left: -50%;
    width: 380px;
    height: 420px;
    background: linear-gradient(0deg, transparent, #FFB645, #FFB645);
    transform-origin: bottom right;
    animation: animate 6s linear infinite;
    animation-delay: -3s;
  }
  @keyframes animate {
    0% {
      transform: rotate(0deg);
    }
    100% {
      transform: rotate(360deg);
    }
  }
  .form {
    position: absolute;
    inset: 2px;
    border-radius: 8px;
    background-color: #551120;
    z-index: 10;
    padding: 50px 40px;
    display: flex;
    flex-direction: column;
  }
  .form h2 {
    color: #FFB645;
    font-weight: 500;
    align-items: center;
    letter-spacing: 0.1em;
  }
  
  .inputBox {
    position: relative;
    width: 300px;
    margin-top: 35px;
  }
  .inputBox input {
    position: relative;
    width: 100%;
    padding: 20px 10px 10px;
    background: transparent;
    border: none;
    outline: none;
    color: #ffffff;
    font-size: 1em;
    letter-spacing: 0.05em;
    z-index: 10;
  }
  .inputBox span {
    position: absolute;
    left: 0;
    padding: 20px 0px 10px;
    font-size: 1em;
    color: #FFB645;
    pointer-events: none;
    letter-spacing: 0.05em;
    transition: 0.5s;
  }
  .inputBox input:valid ~ span,
  .inputBox input:focus ~ span {
    color: #ffffff;
    transform: translateX(0px) translateY(-34px);
    font-size: 0.75em;
  }
  .inputBox i {
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 2px;
    background: #FFB645;
    border-radius: 4px;
    transition: 0.5s;
    pointer-events: none;
    z-index: 9;
  }
  .inputBox input:valid ~ i,
  .inputBox input:focus ~ i {
    height: 44px;
  }
  .links {
    display: flex;
    justify-content: flex-end;
  }
  .links a {
    margin: 10px 0;
    font-size: 0.75em;
    color: #FFB645;
    text-decoration: none;
  }
  .links a:hover,
  .links a:nth-child(2) {
    color: #ffffff;
  }
  input[type="submit"] {
    border: 1px solid #FFB645;
    outline: none;
    background: transparent;
    color:#FFB645;
    padding: 11px 25px;
    width: 100%;
    margin-top: 10px;
    border-radius: 4px;
    font-weight: 600;
    cursor: pointer;
    transition: all .3s ease;
  }
  input[type="submit"]:hover{
  background: #FFB645;
  color: #ffffff;
  }
  input[type="submit"]:active {
    opacity: 0.5;
  } 
  
  .headerbox2 {
  padding: 50px 0px;
  color: #ffffff;
  justify-content: center;
  display:flex;
  flex-direction: column;
  
}

.container-fluid-section2 {
   height: 67.6%;
 /*  background: -webkit-linear-gradient(bottom, #551120, #f04027);*/
}

.container-fluid{
	padding: 0;
	height: 15%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.custom-height {
   height: 10vh; 
}

h4 {
margin: 0;
}

.sociallink{
	height: 50%;
	padding-top: 0.1rem;
}
 
  </style>

</head>
<body>
	<%
		String error = (String)request.getAttribute(Costanti.MESSAGE_KEY);
		String messageError = error != null ? error : "";
	%>

<jsp:include page="navbarPubblica.jsp"></jsp:include>

<section class="container-fluid">
  
        
          <h1 class="heading2">Acquista i tuoi giochi online</h1>
          <p class="paragraph1">Fai il login o registrati subito</p>
     
   		 
   		 
</section>




 <section class="container-fluid-section2">
 

      <div id="containform">
<form action="<%=request.getContextPath()+ "/Login" %>" method="post">
<div class="box">
  <div class="form">
    <h2>Login</h2>
    <h6 style="margin: 0; color: red"><%=messageError %></h6>
    <div class="inputBox">
      <input type="text" required="required"  name="<%=Costanti.USERNAME %>"/>
      <span>Username</span>
      <i></i>
    </div>
    <div class="inputBox">
      <input type="password" required="required"  name="<%=Costanti.PASSWORD %>"/>
      <span>Password</span>
      <i></i>
    </div>
    <input type="submit" value="Login" />
    <div class="links">
   <a href="<%= request.getContextPath() + "/Jsp/Register.jsp"%>">Registrati</a>
  </div>   
  </div>
  
</div>
</form>
</div>

     
   
  </section>










<jsp:include page="footer.jsp"></jsp:include>

 <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
    integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
    crossorigin="anonymous"></script>
  
</body>
</html>
    