<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>Registrazione</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
      
      
      <style>
      @import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;

 .container{
	margin: 0;
	padding: 0;
	outline: none;
	font-family: 'Roboto', sans-serif;
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
         <header>Registrazione</header>
         <div class="progress-bar">
            <div class="step">
               <p>
                  Nome
               </p>
               <div class="bullet">
                  <span>1</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
            <div class="step">
               <p>
                  Contatti
               </p>
               <div class="bullet">
                  <span>2</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
            <div class="step">
               <p>
                  Indirizzo
               </p>
               <div class="bullet">
                  <span>3</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
            <div class="step">
               <p>
                  Invia
               </p>
               <div class="bullet">
                  <span>4</span>
               </div>
               <div class="check fas fa-check"></div>
            </div>
         </div>
         <div class="form-outer">
            <form id="myForm" action="<%=request.getContextPath() +"/Register" %>" method="post">
               <div class="page slide-page">
                  <div class="title">
                     Informazioni base:
                  </div>
                  <div class="field">
                     <div class="label">
                        Nome
                     </div>
                     <input type="text" id="name" name="<%=Costanti.NOME %>">
                  </div>
                  <div class="field">
                     <div class="label">
                        Cognome
                     </div>
                     <input type="text" id="surname" name="<%=Costanti.COGNOME %>">
                  </div>
                  <div class="field">
                     <button class="firstNext next">Prossimo</button>
                  </div>
               </div>
               <div class="page">
                  <div class="title">
                     Informazioni di contatto:
                  </div>
                  <div class="field">
                     <div class="label">
                        Email
                     </div>
                     <input type="text" id="email" name="<%=Costanti.EMAIL %>">
                  </div>
                  <div class="field">
                     <div class="label">
                        Telefono
                     </div>
                     <input type="tel" id="phone" name="<%=Costanti.TELEFONO %>">
                  </div>
                  <div class="field btns">
                     <button class="prev-1 prev">Indietro</button>
                     <button class="next-1 next">Avanti</button>
                  </div>
               </div>
               <div class="page">
                  <div class="title">
                     Preferenza di consegna:
                  </div>
                  <div class="field">
                     <div class="label">
                        Città
                     </div>
                      <input type="text" id="city" name="<%=Costanti.CITTA %>">
                  </div>
                  <div class="field">
                     <div class="label">
                        Indirizzo
                     </div>
                      <input type="text" id="address" name="<%=Costanti.INDIRIZZO %>">
                  </div>
                  <div class="field btns">
                     <button class="prev-2 prev">Indietro</button>
                     <button class="next-2 next">Avanti</button>
                  </div>
               </div>
               <div class="page">
                  <div class="title">
                     Dettagli Login:
                  </div>
                  <div class="field">
                     <div class="label">
                        Username
                     </div>
                     <input type="text" id="username" name="<%=Costanti.USERNAME %>">
                  </div>
                  <div class="field">
                     <div class="label" >
                        Password
                     </div>
                     <input type="password" id="password" name="<%=Costanti.PASSWORD %>">
                  </div>
                  <div class="field btns">
                     <button class="prev-3 prev">Indietro</button>
                     <button class="submit" onclick="formSubmit(event)">Invia</button>
                  </div>
               </div>
            </form>
         </div>
      </div>
      <jsp:include page="footer.jsp"></jsp:include>
      <script src="JS/javascript.js"></script>   
   </body>
</html>
    