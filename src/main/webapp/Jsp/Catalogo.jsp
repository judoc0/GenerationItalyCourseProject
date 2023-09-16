<%@page import="com.azienda.E_CommerceProva.model.Fornitore"%>
<%@page import="com.azienda.E_CommerceProva.model.Categoria"%>
<%@page import="java.util.Map"%>
<%@page import="com.azienda.E_CommerceProva.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@page import="com.azienda.E_CommerceProva.model.Utente"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>Home</title>
    
    
    <style type="text/css">
    
     <%@  include file = "CSS/NavBar2.css"%>
    
     <%@ include file="CSS/style.css" %>
     
     <%@ include file = "CSS/FooterStyle.css"%>
    
    body {
    overflow-y: auto; /* Mostra sempre la barra di scorrimento verticale */
    margin-right: calc(-1 * (100vw - 100%)); /* Aggiunge un margine negativo per compensare la barra di scorrimento */
    position: relative; /* Imposta la posizione relativa per creare un contesto di impilamento */
    overflow-x: hidden;
     
}


      
        .welcome-message {
            text-align: center;
            font-size: 24px;
            margin-top: 20px;
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
            background-color: #f04027;
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
        padding-right: 3.5rem;
        
        .subbtn{
        	
        	color: #ffffff;
        	background-color: #f04027;
        } 
        
        }
        
        button {
		border-color: #FFB645;
}

img {
 transition: transform .2s; /* Animation */
}

img:hover {
  -ms-transform: scale(1.2); /* IE 9 */
  -webkit-transform: scale(1.2); /* Safari 3-8 */
  transform: scale(1.2); 
}

#searchInput{
	transition: transform .2s;
}

#searchInput:hover{
	
transform: scale(1.05);
}
   #ii{
         	transition: transform .2s;
         	
         }
         
         #ii:hover{
         transform: scale(1.2); 
         }

#noHover{
	pointer-events: none;
}

#catforn{
	border: 1px solid white;
	transition: transform .2s;
	color: white;
	
}

#catforn:hover{	
	background-color: white;
	color: #f04027;
	transform: scale(1.1);
}
    </style>
</head>
<body>

<jsp:include page="navbar2.jsp"></jsp:include> 


<% 
	List<Prodotto> catalogo = (List<Prodotto>) request.getAttribute(Costanti.CATALOGO);
	Map<Integer, String> mappa = (Map<Integer, String>) request.getAttribute(Costanti.MAPPA_FOTO);
	
	List<Categoria> listaCat = (List<Categoria>) request.getAttribute(Costanti.LISTA_CATEGORIE);
	List<Fornitore> listaForn = (List<Fornitore>) request.getAttribute(Costanti.LISTA_FORNITORI);
%>  
    
      
<div class="container mt-5" style="min-height: 76.2vh;">
<div style="display: flex; flex-direction: row; width: 100%">
    <div class="col-lg-6 col-6">
        <div class="row">
            <input type="text" id="searchInput" class="form-control" placeholder="Cerca prodotti...">
        </div>
    </div>
    
    <div class="col-lg-6 col-6" style="display: flex; justify-content: space-around;">
        <a id="catforn" style="border-radius: 10px" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
            Categorie
        </a>
        <ul class="dropdown-menu" style="width: 20%" aria-labelledby="navbarDropdown">        
            <div class="row">
            <%for(Categoria cat : listaCat){ %>
                 <li class="col-lg-6"><a class="dropdown-item" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo?"+Costanti.CAT+"="+cat.getNome()+""%>"><%=cat.getNome() %></a></li>
             <%} %>
            </div>
           
        </ul>
        <a id="catforn" style="border-radius: 10px; margin-left: -15vw" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
            Fornitori
        </a>
        <ul class="dropdown-menu" style="width: 20%" aria-labelledby="navbarDropdown">        
            <div class="row">
            <%for(Fornitore forn : listaForn){ %>
                 <li class="col-lg-6"><a class="dropdown-item" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo?"+Costanti.FORN+"="+forn.getNome()+""%>"><%=forn.getNome() %></a></li>
             <%} %>
            </div>
           
        </ul>           
    </div>

          
        <div class="col-lg-6 col-6 text-right">
     <!--      <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>" class="btn viewmore" style=" border:1px solid #f04027">View More</a>--> 
        </div>
      </div>

      <div class="row mt-3 text-center">
      <%
        int counter = 0;
		for (Prodotto prodotto : catalogo) {
	  %>
        <div class="col-lg-2 col-6 mt-5 mb-5" id="pepega<%= counter %>">
        <a href="VediProdotto?<%=Costanti.PRODOTTO_ID%>=<%=prodotto.getId()%>">
          <img style="border-radius:10px; box-shadow: 10px 5px 10px rgba(0, 0, 0, 0.8);" src="<%=mappa.get(prodotto.getId()) %>" width="100%">
        </a>  
          	<form action="<%=request.getContextPath()+ "/AddCarrello"%>">
          		<p id="productName<%= counter %>" class="text-center mt-1" style="color: white;"> <%=prodotto.getNome() %></p>
          		<p id="categoriaName<%= counter %>" style="display: none;"> <%=prodotto.getCategoria().getNome() %></p>
          		<p id="fornitoreName<%= counter %>" style="display: none;"> <%=prodotto.getFornitore().getNome() %></p>
				<input type="hidden" name=<%=Costanti.PRODOTTO_ID%> value=<%=prodotto.getId()%>>
				<% if(prodotto.getQuantita() > 0) {%> 
				<button id="ii" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i></button>
				<% }%>
			</form>
        </div>
       
        <%
        counter++;
		}
		%>    
        </div>
        <div id="noResultsImage" style="display: none;">
  <img src="<%=request.getContextPath() %>/Media/confused.gif" style="margin-left: 58vh;margin-top: 5vh;" alt="Nessun risultato" id="noHover">
</div>
<div id="noRiccardo" style="display: none;">
  <img src="<%=request.getContextPath() %>/Media/clown-nose.gif" style="margin-left: 53vh; margin-top: 10vh;" alt="CLOWN" id="noHover">
</div>
<div id="jean" style="display: none;">
  <img src="<%=request.getContextPath() %>/Media/cat.gif" style="margin-left: 60vh; margin-top: 10vh; width: 400px" alt="cat" id="noHover">
</div>
<div id="francesca" style="display: none;">
  <img src="<%=request.getContextPath() %>/Media/francesca.gif" style="margin-left: 60vh; margin-top: 10vh; width: 400px" alt="cat" id="noHover">
</div>
<div id="sonia" style="display: none;">
  <img src="<%=request.getContextPath() %>/Media/SONIA.gif" style="margin-left: 60vh; margin-top: 10vh; width: 400px" alt="cat" id="noHover">
</div>
<div id="alessandro" style="display: none;">
  <img src="<%=request.getContextPath() %>/Media/ALE.gif" style="margin-left: 60vh; margin-top: 10vh; width: 400px" alt="cat" id="noHover">
</div>
<div id="giovanni" style="display: none;">
  <img src="<%=request.getContextPath() %>/Media/DOPPIAG.jpg" style="margin-left: 60vh; margin-top: 5vh; width: 400px" alt="cat" id="noHover">
</div>
  </div>
   <jsp:include page="footer.jsp"></jsp:include>
<script>
const noResultsImage = document.getElementById("noResultsImage");
const jean = document.getElementById("jean");
const francesca = document.getElementById("francesca");
const sonia = document.getElementById("sonia");
const alessandro = document.getElementById("alessandro");
const giovanni = document.getElementById("giovanni");
const noRiccardo = document.getElementById("noRiccardo");
const searchInput = document.getElementById("searchInput");
const counter = <%= counter %>;

// Aggiungi un gestore per l'evento onkeyup all'input
searchInput.addEventListener("keyup", function() {
    const inputValue = searchInput.value.trim().toLowerCase();
    let risultatiTrovati = false;

    for (let i = 0; i <= counter; i++) {
        const pepegaDiv = document.getElementById("pepega" + i);
		
        const productNameElement = document.getElementById("productName" + i);
        if (productNameElement) {
            const productName = productNameElement.textContent.trim().toLowerCase();

            if (productName.includes(inputValue)) {
                pepegaDiv.style.display = "block";
                risultatiTrovati = true;
            } else {
                pepegaDiv.style.display = "none";
            }
        }
    }
    
    // Mostra l'immagine se non ci sono risultati
    if (!risultatiTrovati) {
        noResultsImage.style.display = "block";
    } else {
        noResultsImage.style.display = "none";
    }
    
    if(inputValue === "riccardo") {
    	noRiccardo.style.display = "block";
    	noResultsImage.style.display = "none";
    }
    else noRiccardo.style.display = "none";
    
    
    if(inputValue === "jean") {
    	jean.style.display = "block";
    	noResultsImage.style.display = "none";
    }
    else jean.style.display = "none";
    
    
    if(inputValue === "francesca") {
    	francesca.style.display = "block";
    	noResultsImage.style.display = "none";
    }
    else francesca.style.display = "none";
    
    
    if(inputValue === "sonia") {
    	sonia.style.display = "block";
    	noResultsImage.style.display = "none";
    }
    else sonia.style.display = "none";
    
    
    if(inputValue === "alessandro") {
    	alessandro.style.display = "block";
    	noResultsImage.style.display = "none";
    }
    else alessandro.style.display = "none";
    
    if(inputValue === "giovanni") {
    	giovanni.style.display = "block";
    	noResultsImage.style.display = "none";
    }
    else giovanni.style.display = "none";
    
});

const categoria = '<%= request.getAttribute(Costanti.CAT) %>'
const fornitore = '<%= request.getAttribute(Costanti.FORN) %>'

document.addEventListener("DOMContentLoaded", function() {	
	if(categoria!="null") {
	
    for (let i = 0; i <= counter; i++) {
        const pepegaDiv = document.getElementById("pepega" + i);
		
        const categoriaNameElement = document.getElementById("categoriaName" + i);
        if (categoriaNameElement) {
            const categoriaName = categoriaNameElement.textContent.trim().toLowerCase();

            if (categoriaName.includes(categoria.toLowerCase())) {
                pepegaDiv.style.display = "block";
            } else {
                pepegaDiv.style.display = "none";
            }
        }
    }
	}
    
    if(fornitore!="null") {
    	
        for (let i = 0; i <= counter; i++) {
            const pepegaDiv = document.getElementById("pepega" + i);
    		
            const categoriaNameElement = document.getElementById("fornitoreName" + i);
            if (categoriaNameElement) {
                const categoriaName = categoriaNameElement.textContent.trim().toLowerCase();
                
                if (categoriaName.includes(fornitore.toLowerCase())) {
                    pepegaDiv.style.display = "block";
                } else {
                    pepegaDiv.style.display = "none";
                }
            }
        }
	}
});

	
	

</script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
    integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
    crossorigin="anonymous"></script>
    
 
    
    
</body>
</html>