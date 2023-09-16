<%@page import="com.azienda.E_CommerceProva.model.Utente"%>
<%@page import="com.azienda.E_CommerceProva.model.Fornitore"%>
<%@page import="com.azienda.E_CommerceProva.model.Categoria"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.azienda.E_CommerceProva.model.Prodotto"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
    integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  

<title>Product Detail</title>

<style type="text/css">


  <%@  include file = "CSS/NavBar2.css"%>

 <%@ include file="CSS/style.css" %>
     
<%@ include file = "CSS/FooterStyle.css"%>

<%@ include file="CSS/ProdottoDett.css" %>



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
            background-color: #f04027;
            color: #fff;
            cursor: pointer;
        }
        
            .form-group {
            margin-bottom: 15px;
        }

 #bottoni{
        display:flex;
         
        
        .subbtn{
        	 
        	color: #ffffff;
        	background-color: #f04027;
        }
   }
        
   .navbar-brand{
    padding: 0;
    padding-left: 1.28vw;
    padding-right: 33.6vw;
   	font-size: 21.2px;
   }
   
   .nav-link{
   	
   }
   
   img {
 transition: transform .2s; /* Animation */
}

img:hover {
  -ms-transform: scale(1.2); /* IE 9 */
  -webkit-transform: scale(1.2); /* Safari 3-8 */
  transform: scale(1.2); 
}

body {
	color: white;
}
   
</style>

</head>
<body>

<jsp:include page="navbar2.jsp"></jsp:include> 
<% 
	Utente u = (Utente) request.getSession().getAttribute(Costanti.UTENTE);
	Prodotto p = (Prodotto) request.getAttribute(Costanti.PRODOTTO);
	Categoria c = (Categoria) request.getAttribute(Costanti.CATEGORIA);
	String cat = c.getNome();
	Fornitore f = (Fornitore) request.getAttribute(Costanti.FORNITORE);
	String forn = f.getNome();
	int disponibilita = Integer.parseInt(""+request.getAttribute(Costanti.DISPONIBILITA_PRODOTTO));
	String stringa = disponibilita <= 0 ? "Non disponibile" : disponibilita+"";
	String foto = request.getAttribute(Costanti.FOTO_PRODOTTO)+"";
	
	String fotoC = request.getAttribute(Costanti.CATEGORIA_LOGO)+"";
	String fotoF = request.getAttribute(Costanti.FORNITORE_LOGO)+"";
%>


 
<section class="section product-detail" style="height: 82.6vh; display: flex; flex-direction: row; flex-wrap: nowrap;">
      <div class="details container" >
        <div class="left image-container">
          <div class="maina">
          	<div id="containera" style="box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.6); height: 500px; width: 400px; overflow: hidden;">
  				<img src="<%=foto %>" alt="Image Alt" style="  transform-origin: center center; object-fit: cover; height:auto; width: 100%; display: ">
			</div>
          </div>
        </div>
        <div style="display: flex; flex-direction: row; flex: 1; margin-left: 0">
        <div class="right">
         
          <h2><%=p.getNome()%></h2>
          <div class="price" style="color: #FFA500 ">€<%=String.format("%.2f", p.getPrezzo())%></div>
      

          <form action="<%=request.getContextPath() + "/AddCarrello"%>" style="margin-bottom: 10vh;">
          
          <label for="Quantita">Quantita:</label>
          <% if(disponibilita > 0) {  %> 
          <select class="form-select form-select-lg" style="text-align: center; width: 100px; font-size: 17px;" id="quantita" name=<%=Costanti.QUANTITASELEZIONATA%>>
					
					<%
							for (int i = 1; i <= disponibilita; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>
							<%
							}
							%>
									
				</select>
				<div id="bottoni">
      		<input type="hidden" name=<%=Costanti.PRODOTTO_ID%> value=<%=p.getId()%>> 
      		<button class="subbtn">Aggiungi al Carrello</button>
           </div>
		  <% } else {  %>
		  <label><%=stringa %></label>
			<% }   %>
           
           
          </form>
            
          <h3>Dettagli Prodotto</h3>
          
      
          
          <p>DESCRIZIONE: <br>
            <%=p.getDescrizione()%>
          </p>

		</div>
		          <div style="display: flex;  flex-direction: column; margin-left: 7vw;">
              <p>
         CATEGORIA:
            <%=cat%>
            </p>
            <div id="containeraa" style="box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.6); height:190px; width:190px; overflow: hidden; border-radius: 50%;">
  				<img src="<%=fotoC %>" alt="Image Alt" style="  transform-origin: center center; object-fit: cover; height: 100%; width: 100%; border-radius: 50%;"/>
			</div>
             <br><br>   
          <p>FORNITORE:         
            <%=forn%>
            </p>
            <div id="containeraa" style="box-shadow: 3px 3px 4px rgba(0, 0, 0, 0.6); height:190px; width:190px; overflow: hidden; border-radius: 50%;" >
  				<img src="<%=fotoF %>" alt="Image Alt" style="  transform-origin: center center; object-fit: cover; height: 100%; width: 100%; border-radius: 50%;"/>
			</div>
          
          </div>

        </div>
</div>
    
    </section>

<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
const container = document.getElementById("container");
const img = document.querySelector("img");
containera.addEventListener("mousemove", onZoom);
containera.addEventListener("mouseover", onZoom);
containera.addEventListener("mouseleave", offZoom);
function onZoom(e) {
    const x = e.clientX - e.target.offsetLeft;
    const y = e.clientY - e.target.offsetTop;
    img.style.transformOrigin = x + "px " + y + "px";
    img.style.transform = "scale(1.8)";
}
function offZoom(e) {
    img.style.transformOrigin = `center center`;
    img.style.transform = "scale(1)";
}</script>

 <script>
    // Funzione per impostare il gradiente come sfondo del body
    function impostaGradienteSfondo() {
      // Definisci il gradiente come stringa CSS551120
      var gradiente = "linear-gradient(to bottom, #4D2DB7, #551120)";
      
      // Imposta il gradiente come sfondo del body
      document.body.style.background = gradiente;
      document.body.style.color = "white";
    }

    // Aggiungi un ascoltatore per l'evento DOMContentLoaded
    if (<%=u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_ADMIN)%>) document.addEventListener("DOMContentLoaded", impostaGradienteSfondo);
    
  </script>
</body>
</html>