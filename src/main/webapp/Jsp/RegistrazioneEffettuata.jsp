<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Registrazione</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
      <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
      <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");
   
   .container{
    margin: 0;
    padding: 0;
    outline: none;
    font-family: "Roboto", sans-serif;
   
  }
      
      <%@ include file = "CSS/NavBar3.css"%>
      
      <%@ include file = "CSS/styleSub.css"%>
      
      <%@ include file = "CSS/FooterStyle2.css"%>
      
        .alibaba {
      	display: flex;
      	flex-direction: column;
      	justify-content: center;
      	align-content: center;
      }
      
      .asdrubale {
      	padding-top: 0.2rem;
      	padding-bottom: 0.35rem;
      }
      
      
      </style>
   </head>
   <body>
   <jsp:include page="navbar3.jsp"></jsp:include>
   <div class="container">
         <div class="form-outer">
            <form id="myForm" action="<%=request.getContextPath() +"/Jsp/Login.jsp" %>" method="post">
               <div class="page slide-page">
               <div class="success-icon">&#10004;</div>
                  <div class="title" style="text-align: center; margin-bottom: 2vh; color: #007bff;">
                     Registrazione Effettuata<br>con Successo!                  
                  </div>                              
                  	<div class="label" style="font-size: 15px">
                  		Grazie per esserti registrato.<br>Ora puoi accedere con il tuo account.
                  	</div>              
                  <div class="field">               
                    <button class="submit">Torna alla login</button>
                  </div>
               </div>
            </form>
         </div>
        </div> 
        <jsp:include page="footer.jsp"></jsp:include>        
   </body>
</html>
    