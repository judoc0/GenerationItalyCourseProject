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
   
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
    integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">  
 
    <title>Modifica prodotto</title>
   
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
        
           #modificaprodotto{
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
        


    </style>
</head>
<body>

<jsp:include page="navbar2.jsp"></jsp:include>


	<br>
   <div class="container">
    	
        <div class="welcome-message">Sei nella Modifica Prodotto</div>
      
         <p id="info"> Qui sotto puoi modificare il tuo prodotto </p>
         
         
        
 
    </div>




<%
		String error = (String)request.getAttribute(Costanti.MESSAGE_KEY);
		String messageError = error != null ? error : "";
		
		List<Categoria> lista_cat = (List<Categoria>) request.getAttribute(Costanti.LISTA_CATEGORIE);
		List<Fornitore> lista_forn = (List<Fornitore>) request.getAttribute(Costanti.LISTA_FORNITORI);
		Prodotto p = (Prodotto) request.getAttribute(Costanti.PRODOTTO);
		%>
		<div><%=messageError%></div>
		
		
		  <div class="container">
		
    <div class="cont2" style="margin-top: 0">
       <form action="<%=request.getContextPath() +"/ModificaProdotto" %>" method="post" enctype="multipart/form-data">
            <div class="form-group">
            <label for="id">ID:</label>
             <input type="number" id="id" name="<%=Costanti.PRODOTTO_ID %>" placeholder="<%=p.getId()%>" value="<%=p.getId()%>" readonly="readonly">
            
            
                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="<%=Costanti.NOME_PRODOTTO %>" value="<%=p.getNome()%>">
            </div>
            <div class="form-group">
             	<label for="myTextArea">Descrizione:</label>
    			<textarea id="myTextArea" name="<%=Costanti.DESCRIZIONE_PRODOTTO %>" rows="4" cols="50"><%=p.getDescrizione()%></textarea>
             </div>
            <div class="form-group">
                <label for="prezzo">Prezzo:</label>
                <input type=number id="prezzo" step="0.01" name="<%=Costanti.PREZZO_PRODOTTO %>" value="<%=p.getPrezzo()%>" required min="0">
            </div>
            <div class="form-group">
                <label for="disponibilità">Disponibilità:</label>
                <input type="number" id="disponiilità" name="<%=Costanti.DISPONIBILITA_PRODOTTO%>" value="<%=p.getQuantita()%>" required min="0">
            </div>
            <div class="form-group">
                <label for="categoria">Categoria:</label> <select id="categoria" name=<%=Costanti.CATEGORIA_PRODOTTO%>>
					<%
					for (Categoria cat : lista_cat) {
						if(cat.getNome().equals(p.getCategoria().getNome())) {
					%>
					<option value="<%=cat.getNome()%>" selected><%=cat.getNome()%></option>
					<%
						} else {
					%>	
					<option value="<%=cat.getNome()%>"><%=cat.getNome()%></option>
					<%
							}
						}
					%>					
				</select> 
            </div>
            <div class="form-group">
                <label for="fornitore">Fornitore:</label> <select id="fornitore" name=<%=Costanti.FORNITORE_PRODOTTO%>>
					<%
					for (Fornitore forn : lista_forn) {
						if(forn.getNome().equals(p.getFornitore().getNome())) {
					%>
					<option value="<%=forn.getNome()%>" selected><%=forn.getNome()%></option>
					<%
						} else {
					%>	
					<option value="<%=forn.getNome()%>"><%=forn.getNome()%></option>
					<%
							}
						}
					%>					
				</select> 
            </div>
               <div class="form-group">
                <label for="foto">FOTO:</label>
                <input type="file" id="foto" name="<%=Costanti.FOTO_PRODOTTO %>">
            </div>
            <div>
                <input id="modificaprodotto" class="subbtn" type="submit" value="Modifica prodotto">
            </div>
            
             
        </form>
    </div>
    
    </div>
    
     <jsp:include page="../Jsp/footer.jsp"></jsp:include>

 <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
    integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
    crossorigin="anonymous"></script>
    
    
</body>
</html>
    