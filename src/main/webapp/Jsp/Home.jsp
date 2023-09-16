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
    overflow-y: scroll; /* Mostra sempre la barra di scorrimento verticale */
    margin-right: calc(-1 * (100vw - 100%)); /* Aggiunge un margine negativo per compensare la barra di scorrimento */
    position: relative; /* Imposta la posizione relativa per creare un contesto di impilamento */
    overflow-x: hidden; 
}

      
        .welcome-message {
            text-align: center;
            font-size: 24px;
            margin-top: 20px;
            color: #ffffff
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
        	margin-top: 0;
        	color: #ffffff;
        	background-color: transparent;
        	border: 1px solid #ffffff;
        	transition: transform .2s
        } 
        
        .subbtn:hover {
	transform: scale(1.1);
	background-color: #ffffff;
	color: #f04027;
}
        
        }
        .btn.viewmore {
        	color: white;
        	transition: transform .2s, background-color 0.1s ease-in-out;
        	border: 1px solid white;
        }
        
                .btn.viewmore:hover {
	transform: scale(1.1);
	background-color: #ffffff;
	color: #f04027;
}
        
img {
 transition: transform .2s; /* Animation */
 box-shadow: 10px 5px 10px rgba(0, 0, 0, 0.8);
}

img:hover {
  -ms-transform: scale(1.1); /* IE 9 */
  -webkit-transform: scale(1.1); /* Safari 3-8 */
  transform: scale(1.1); 
}

h4{
	color: white;
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
%>
    <div class="container">
    	<div class="welcome-message">Ciao <%=u.getUsername() %> <br> Benvenuto nella tua Pagina di Home! </div>
      
        <br>
      <div class="container-mt1">
      <div id="bottoni">
      
       <a class="back-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Utente"%>"> <button class="subbtn">Il mio account</button></a>
      
      <a class="back-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo"%>"> <button class="subbtn">Vedi il Catalogo</button></a>
      
      
      <a class="back-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediCarrello"%>"> <button class="subbtn">Carrello</button></a>
      
      
      </div>
      </div>
    </div>
    
    
    
      
   <div class="container mt-5">

          <div class="row">
            <div class="col-lg-6 col-6">
            <h4>Giochi Fisici</h4>
            </div>

            <div class="col-lg-6 col-6 text-right">
              <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo?"+Costanti.CAT+"=Giochi Fisici"%>" class="btn viewmore">View More</a>
            </div>
          </div>

          <div class="row mt-3 text-center">
            <div class="col-lg-3 col-6 ">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=34" %>">
              <img style="border-radius:4px;"
                src="<%=request.getContextPath() %>/Media/ELDEN.jpg" height="80%" width="80%">
            </a>
              <p class="text-center mt-1">ELDER RING</p>         
            </div>

            <div class="col-lg-3 col-6">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=105" %>">
              <img style="border-radius:4px;"
                src="<%=request.getContextPath() %>/Media/BF2042C.jpg" height="80%" width="80%">
            </a>
              <p class="text-center mt-1">BATTLEFIELD 2042</p>
            </div>
            
            <div class="col-lg-3 col-6">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=106" %>">
              <img style="border-radius:4px;"
                src="https://www.gstatic.com/stadia/gamers/landing_page/assets/games/NBA2k20.png" height="80%" width="80%">
            </a>
              <p class="text-center mt-1">NBA 2K20</p>            
            </div>

            <div class="col-lg-3 col-6">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=20" %>">
              <img style="border-radius:4px;"
                src="<%=request.getContextPath() %>/Media/hogwarts-legacy.webp" height="80%" width="80%">
            </a>
              <p class="text-center mt-1">HOGWARTS LEGACY</p>        
            </div>
          </div>
  		</div>
     
   
      <div class="container mt-5">

        <div class="row">
          <div class="col-lg-6 col-6">
             <h4>Accessori</h4>
          </div>

          <div class="col-lg-6  col-6 text-right">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo?"+Costanti.CAT+"=Accessori"%>" class="btn viewmore">View More</a>
          </div>
        </div>

        <div class="row mt-3 text-center">
          <div class="col-lg-3 col-6 ">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=19" %>">
            <img style="border-radius:4px;"           
              src="<%=request.getContextPath() %>/Media/unnamedRosso.jpg" height="80%" width="80%">
              </a>
            <p class="text-center mt-1">XBOX DAYSTRIKE CAMO</p>
           
          </div>

          <div class="col-lg-3 col-6">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=30" %>">
            <img style="border-radius:4px;"
              src="<%=request.getContextPath() %>/Media/30_XboxControllerViola.jpeg" height="80%" width="80%">
              </a>
            <p class="text-center mt-1">XBOX VORTICE VIOLA</p>          
          </div>

          <div class="col-lg-3 col-6">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=58" %>">
            <img style="border-radius:4px;"
              src="<%=request.getContextPath() %>/Media/20_SchedaEspansioneXbox.jpeg" height="80%" width="80%">
          </a>
            <p class="text-center mt-1">SSD ESTERNO PER XBOX</p>
            
          </div>

          <div class="col-lg-3 col-6">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=18" %>">
            <img style="border-radius:4px;"
              src="<%=request.getContextPath() %>/Media/18_CuffieSony.jpeg" height="80%" width="80%">
          </a>
            <p class="text-center mt-1">SONY PS5 CUFFIE 3D</p>
           
          </div>

        </div>
		</div>
		
		<div class="container mt-5">

      <div class="row">
        <div class="col-lg-6 col-6">
          <h4>Console</h4>
        </div>

        <div class="col-lg-6 col-6 text-right">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo?"+Costanti.CAT+"=Console"%>" class="btn viewmore">View More</a>
        </div>
      </div>

      <div class="row mt-3 text-center">
        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=45" %>">
          <img style="border-radius:4px; background: #e03424;"
            src="<%=request.getContextPath() %>/Media/XS.webp" height="80%" width="80%">
        </a>
          <p class="text-center mt-1">XBOX SERIE S </p>      
        </div>

        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=47" %>">
          <img style="border-radius:4px; background: #e03424;" src="<%=request.getContextPath() %>/Media/playstation-5-with-dualsense-front-product-shot-01-ps5-en-30jul20.webp" height="80%" width="80%">
         </a>
          <p class="text-center mt-1">PLAYSTATION 5</p>
         
        </div>

        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=53" %>">
          <img style="border-radius:4px; "
           	src="<%=request.getContextPath() %>/Media/NSW.webp" height="80%" width="80%">
        </a>
          <p class="text-center mt-1">NINTENDO SWITCH</p>
         
        </div>

        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediProdotto?"+ Costanti.PRODOTTO_ID+"=49" %>">
          <img style="border-radius:4px; background: #e03424;"
            src="<%=request.getContextPath() %>/Media/XSX.jpg" height="80%" width="80%">
        </a>
          <p class="text-center mt-1">XBOX SERIE X</p>
         
        </div>

      </div>
	  </div>
  
   
  
  
   
    
    
   <jsp:include page="footer.jsp"></jsp:include>

 <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
    integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
    crossorigin="anonymous"></script>
    
    
</body>
</html>