<%@page import="com.azienda.E_CommerceProva.model.Prodotto"%>
<%@page import="com.azienda.E_CommerceProva.model.Fornitore"%>
<%@page import="com.azienda.E_CommerceProva.model.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifica fornitore</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
    integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">  
 
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
        
         #bottoni{
        display:flex;
        justify-content:center;
        justify-content:space-around;
        
        .subbtn{
        	
        	color: #ffffff;
        	background-color: #f04027;
        } 
        
        }
        
           #modificafornitore{
        display:flex;
        justify-content:center;
        justify-content:space-around;
        color: #ffffff;
        	background-color: #f04027;
      
        
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

          .form-group input[type="submit"]:hover {
            background-color: #0056b3;
        }
        
        #contabella{
        width: 70%;
        display:flex;
        flex-wrap:wrap;
        justify-content:center;
        flex-direction: column;
        }
        
    
    </style>
</head>
<body>

<jsp:include page="navbar2.jsp"></jsp:include>

	<br>
   <div class="container">
    	
        <div class="welcome-message">Sei nella Modifica Fornitore</div>
      
         <p id="info"> Qui sotto puoi modificare il tuo fornitore </p>
         
         
    </div>
       
    
    
<%
		String error = (String)request.getAttribute(Costanti.MESSAGE_KEY);
		String messageError = error != null ? error : "";
		
		List<Fornitore> lista_forn = (List<Fornitore>) request.getAttribute(Costanti.LISTA_FORNITORI);
		Fornitore p = (Fornitore) request.getAttribute(Costanti.FORNITORE);
		%>
		<div><%=messageError%></div>
		
    <div class="container" id="contabella" style="padding-bottom: 17rem;">
       <form action="<%=request.getContextPath() +"/ModificaFornitore" %>" method="post" enctype="multipart/form-data">
      	 	<div class="form-group">
                <label for="id">ID:</label>
                <input type="text" id="id" name="<%=Costanti.FORNITORE_ID%>" value="<%=p.getId()%>" readonly="readonly">
            </div>
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="<%=Costanti.FORNITORE_NOME %>" value="<%=p.getNome()%>">
            </div>
               <div class="form-group">
                <label for="foto">FOTO:</label>
                <input type="file" id="foto" name="<%=Costanti.FORNITORE_LOGO %>">
            </div>
            <div>
                <input id="modificafornitore" class="subbtn" type="submit" value="Modifica fornitore">
                
                <a class="btn btn-primary" style="margin-top: 2vh; margin-left: 56vw; width: 18%" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Fornitore"%>">Torna ai fornitori</a>
            </div>
        </form>
    </div>
    
     <jsp:include page="../Jsp/footer.jsp"></jsp:include>

 <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
    integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
    crossorigin="anonymous"></script>
    
</body>
</html>
    