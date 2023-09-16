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
            @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");
  .container{
    margin: 0;
    padding: 0;
    outline: none;
    font-family: "Roboto", sans-serif;
    line-height: 1.5;
  }
  
  .battle{
  	display: flex;
  	width: 100%;
  }
  
  img {
  	width: 33;
  }
  
  .title {
  width: 90%;
  }
  
  .maionese {
  width: 10%;
  display: flex;
  justify-content: center;
  align-items: center;
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
            <form id="myForm" action="<%=request.getContextPath() +"/Register" %>" method="post">
               <div class="page slide-page">
               <div class="battle">
                  <div class="title" style="text-align: center; margin-bottom: 2vh">
                     Scegli un altro<br>epico nome di battaglia!&nbsp;
                     
                  </div>
                  <div class="maionese">
                      <img src="<%=request.getContextPath() %>/Media/axe.png">   
                      </div>
                  </div>  
                  	<div class="label" style="font-size: 15px; color: #ff0000" >
                  		<%=request.getAttribute(Costanti.MESSAGE_KEY)%> <br>
                  		Scegline un altro per favore
                  		
                  	</div>                  
                  <div class="field">       
                     <div class="label">
                        Username 
                     </div>
                     <input type="text" id="username" name="<%=Costanti.USERNAME %>">
                  </div>                
                  <div class="field">
                                   
                  	<input type="hidden" name=<%=Costanti.NOME%> value=<%=request.getAttribute(Costanti.NOME)%>>
                  	<input type="hidden" name=<%=Costanti.COGNOME%> value=<%=request.getAttribute(Costanti.COGNOME)%>>
                  	<input type="hidden" name=<%=Costanti.EMAIL%> value=<%=request.getAttribute(Costanti.EMAIL)%>>
                  	<input type="hidden" name=<%=Costanti.TELEFONO%> value=<%=request.getAttribute(Costanti.TELEFONO)%>>
                  	<input type="hidden" name=<%=Costanti.CITTA%> value=<%=request.getAttribute(Costanti.CITTA)%>>
                  	<input type="hidden" name=<%=Costanti.INDIRIZZO%> value=<%=request.getAttribute(Costanti.INDIRIZZO)%>>
                  	<input type="hidden" name=<%=Costanti.PASSWORD%> value=<%=request.getAttribute(Costanti.PASSWORD)%>>
                  
                    <button class="submit" onclick="formSubmit2(event)">Invia</button>
                  </div>
               </div>
            </form>
         </div>
        </div>
		<script>
		const usernameInput = document.getElementById('username');
		const submitBtn = document.querySelector(".submit");
		function formSubmit2(event) {
			event.preventDefault();
			
			if(usernameInput.value.trim() === '') showErrorStyle(usernameInput, errorMessage)

			else {
				submitBtn.disabled = true;
				setTimeout(function() {
					submitBtn.disabled = false;
				}, 500);
				usernameInput.style.borderColor = 'green';
				setTimeout(function() {
				document.getElementById("myForm").submit();
				}, 500);
			}
		}
		</script> 
		<jsp:include page="footer.jsp"></jsp:include>           
   </body>
</html>
    