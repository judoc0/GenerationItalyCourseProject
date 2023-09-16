<%@page import="java.util.Map"%>
<%@page import="com.azienda.E_CommerceProva.model.Categoria"%>
<%@page import="com.azienda.E_CommerceProva.BusinessLogic.Service"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@page import="com.azienda.E_CommerceProva.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
    integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">  
 
<title>Lista Categorie</title>
<style type="text/css">
       <%@ include file = "CSS/NavBar2.css"%>
    
     <%@ include file = "CSS/style.css" %>
     
     <%@ include file = "CSS/FooterStyle.css"%>
     
  body {
    overflow-y: scroll; /* Mostra sempre la barra di scorrimento verticale */
    margin-right: calc(-1 * (100vw - 100%)); /* Aggiunge un margine negativo per compensare la barra di scorrimento */
    position: relative; /* Imposta la posizione relativa per creare un contesto di impilamento */
    overflow-x: hidden; 
    background: -webkit-linear-gradient(bottom, #551120, #4D2DB7);
    color: white;
}


        .welcome-message {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
 
        .logout-link {
            display: block;
            text-align: center;
            color: #007bff;
            text-decoration: none;
        } 

        .logout-link:hover {
            text-decoration: underline;
        }
             .form-group input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        
            .form-group {
            margin-bottom: 15px;
        }
        
        #contabella{
        width: 70%;
        display:flex;
        flex-wrap:wrap;
        justify-content:center;
        flex-direction: column;
        }
        
         #bottoni{
        display:flex;
        justify-content:center;
        justify-content:space-around;
        
        .subbtn{
        	
        	color: #ffffff;
        
        } 
        
        }
        
        a{
        text-decoration:none;
        }
        
        a:hover{
        
        text-decoration:none;
       
        }
        
        #eliminaprodotto{
        display:flex;
        justify-content:center;
        justify-content:space-around;
        border: 1px solid white;
        color: #ffffff; 
        background-color: transparent;
        transition: transform .2s, background-color 0.2s ease-in-out;             
        }
        
        #eliminaprodotto:hover{
         transform: scale(1.1); 
         background-color: red;	
        }
        
                #modificaprodotto{
        display:flex;
        justify-content:center;
        justify-content:space-around;
        border: 1px solid white;
        color: #ffffff; 
        background-color: transparent;
        transition: transform .2s, background-color 0.2s ease-in-out;             
        }
        
        #modificaprodotto:hover{
         transform: scale(1.1); 
         background-color: orange;	
        }
        

        
        #info{
        text-align: center; 
        }  

       .cont2{
	    weight: 50%;
	    margin: 50px;
		 text-align: left;
		}

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        
        #nomediv{
        display:flex;
        justify-content:center;
        padding-left: 15px;
        padding-right: 15px;
        }
        
      
        
        footer{
        position:fixed;
        position:absolute;
        margin-bottom:0;
        }
        


input[type="text"], input[type="file"] {
	width: 100%;
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #fff; 
	box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
}

/* Error message */

.popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	align-items: center;
	justify-content: center;
}

.popup-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

table {
	border-collapse: separate;
	border-spacing: 1px 20px;
}

          #categoria{
        display:flex;
        justify-content:center;
        justify-content:space-around;
        color: #ffffff; 
        background-color: transparent;
        border: 1px solid #f04027;
        transition: transform .2s, background-color 0.2s ease-in-out;
        
        }
        
        #categoria:hover{
        	transform: scale(1.1);
        	background-color: #f04027;
        }
        
           img {
 transition: transform .2s; /* Animation */
}

img:hover {
  -ms-transform: scale(1.2); /* IE 9 */
  -webkit-transform: scale(1.2); /* Safari 3-8 */
  transform: scale(1.2); 
}

</style>
</head>
<body>

<jsp:include page="navbar2.jsp"></jsp:include>



	<br>
   <div class="container">
    	
        <div class="welcome-message">Sei nella Lista Categorie </div>
      
         <p id="info"> Qui sotto puoi vedere la lista delle categorie </p>
         
          <div id="bottoni">
          
          <a
		href="<%="http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()
		+ "/Jsp/CreaCategoria.jsp"%>">
		<button type="submit" id="categoria" class="subbtn">Crea categoria </button></a>
         
      
      </div>
        
 
    </div>
    
    	<br><br>
    
	<%
	List<Categoria> categorie = (List<Categoria>) request.getAttribute(Costanti.LISTA_CATEGORIE);
	Map<Integer, String> mappa = (Map<Integer, String>) request.getAttribute(Costanti.MAPPA_FOTO);
	if (categorie.size() > 0) {
	%>
		
	  <div class="container" id="contabella" style="padding-bottom: 15rem;">
	<table border="1">
		<tr>
			<th style="font-size: 23px"><div id="nomediv">  Nome  </div></th>
			<th style="font-size: 23px"><div id="nomediv"> Logo </div></th>
		</tr>

		<%
		for (Categoria cat : categorie) {
		%>

		<tr>
			<td style="font-size: 20px"><div id="nomediv"> <%=cat.getNome()%> </div></td>
			<td><div id="nomediv"> <img alt="" src="<%=mappa.get(cat.getId())%>" width="100"
				height="100"> </div></td>
			<td>
				<form
					action="<%=request.getContextPath() + "/ModificaCategoriaRedirect"%>">
					<input type="hidden" name=<%=Costanti.CATEGORIA_ID%> value=<%=cat.getId()%>>
					<button type="submit" id="modificaprodotto" class="subbtn">Modifica categoria</button>
				</form>
			</td>
			<td>
				<form action="<%=request.getContextPath() + "/EliminaCategoria"%>">
					<input type="hidden" name=<%=Costanti.CATEGORIA_ID%>
						value=<%=cat.getId()%>>
					<button type="submit" id="eliminaprodotto" class="subbtn">Elimina categoria</button>
					
				</form>
				
			</td>	
		</tr>
		<%
		}
		%>

	</table>
	<a class="btn btn-primary" style="margin-top: 2vw; width: 15%" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo"%>">Torna al catalogo</a>
	
		
		
	  </div>
	<%
	} else {
	%>
	<div>Nessun categoria presente nel catalogo</div>
	<a href="http://localhost:8080/E_CommerceProva/Catalogo">Torna nel
		catalogo</a>
	<%
	}
	%>



	<%
	String error = (String) request.getAttribute(Costanti.MESSAGE_KEY);
	String errorMessage = error != null ? error : "";
	if (errorMessage != "") {
	%>
	<div id="popup" class="popup">
		<div class="popup-content"></div>
	</div>
	<%
	}
	%>

 <jsp:include page="../Jsp/footer.jsp"></jsp:include>

 <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
    integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
    crossorigin="anonymous"></script>
    

	<!-- Include your JavaScript at the end of the body -->
	<script>
	const messageError = "<%= errorMessage %>";

   	if (messageError != ""){
        // Display the pop-up with the error message
        const popup = document.getElementById('popup'); // Make sure you have the popup element with this ID
        popup.style.display = 'flex';
        
        // Set the error message in the pop-up content
        const popupContent = popup.querySelector('.popup-content'); // Adjust this selector as needed

		// Creazione degli elementi del popup
		const h2 = document.createElement('h2');
		h2.textContent = 'Errore';
	 	h2.style.color = "red";
		
		const p = document.createElement('p');
		p.textContent = messageError;
		p.style.color = "red";

		const closeButton = document.createElement('button');
		closeButton.id = 'closePopupButton';
		closeButton.textContent = 'Close';

		// Aggiunta degli elementi al contenitore del popup
		popupContent.appendChild(h2);
		popupContent.appendChild(p);
		popupContent.appendChild(closeButton);
        
        // Attach close event listener to the close button
        const closePopupButton = popup.querySelector('#closePopupButton'); // Adjust this selector as needed
        closePopupButton.addEventListener('click', () => {
            popup.style.display = 'none';
        });
    }
    </script>
</body>
</html>