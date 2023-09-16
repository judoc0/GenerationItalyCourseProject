<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css"
    integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <title>Generation Gaming</title>
  <style type="text/css">

    

  
    <%@  include file = "../Jsp/CSS/NavBar2.css"%>
    
     <%@ include file="../Jsp/CSS/style.css" %>
     
     <%@ include file = "CSS/FooterStyle.css"%>
       .col-lg-6 {
    position: relative; /* Assicura che il div padre abbia una posizione relativa */
    overflow: hidden; /* Nasconde l'overflow dell'immagine */
  }

  .col-lg-6 img {
    width: 100%; /* L'immagine occupa tutto lo spazio disponibile nel div */
    height: auto; /* L'altezza dell'immagine si adatta automaticamente alla larghezza */
    object-fit: cover; /* L'immagine si adatta mantenendo l'aspetto */
  }
     img {
 transition: transform .2s; /* Animation */
 box-shadow: 10px 5px 10px rgba(0, 0, 0, 0.8);
}

img:hover {
  -ms-transform: scale(1.2); /* IE 9 */
  -webkit-transform: scale(1.2); /* Safari 3-8 */
  transform: scale(1.2); 
}
     
     footer{
     	width: 100%
     }
       a {
    color:#222; 
}

.navbar-brand{
	padding-left: 4.1rem;
	
}

#navbarSupportedContent{
	padding-left: 8rem;
}

body {
	color: white;
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

.subbtn{
        	margin-top: 1.8vh;
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
a{
	color: white;
	
}

a:hover {
	color: #f04027;
}


  </style>
</head>

<body>
 
  <jsp:include page="navbar.jsp"></jsp:include>

  <section class="container-fluid section1">
    <div class="row">
      <div class="col-lg-6 order-lg-2" style="padding: 0; box-shadow: 10px 5px 10px rgba(0, 0, 0, 0.8);">
        <img style="transform:none; box-shadow: none;" src="<%=request.getContextPath() %>/Media/wras.jpg" width="100%">
        
      </div>
      
        <div class="col-lg-6 text-center headerbox order-lg-1" style="box-shadow: 10px 5px 10px rgba(0, 0, 0, 0.8);">
          <h1 class="heading1">Acquista i tuoi giochi online</h1>
          <p class="paragraph1">Qui troverai le migliori offerte sul mercato per qualsiasi gioco e accessorio.</p>
          <button class="subbtn" style="padding: 0">
          <a  href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Register.jsp"%>"> Registrati ora</a>
         </button>
        </div>
     
    </div>
  </section>

            <div class="container mt-5">

          <div class="row">
            <div class="col-lg-6 col-6">
            <h4>Giochi Fisici</h4>
            </div>

            <div class="col-lg-6 col-6 text-right">
              <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>" class="btn viewmore">View More</a>
            </div>
          </div>

          <div class="row mt-3 text-center">
            <div class="col-lg-3 col-6 ">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
              <img style="border-radius:4px;"
                src="<%=request.getContextPath() %>/Media/ELDEN.jpg" height="80%" width="80%">
            </a>
              <p class="text-center mt-1">ELDER RING</p>         
            </div>

            <div class="col-lg-3 col-6">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
              <img style="border-radius:4px;"
                src="<%=request.getContextPath() %>/Media/BF2042C.jpg" height="80%" width="80%">
            </a>
              <p class="text-center mt-1">BATTLEFIELD 2042</p>
            </div>
            
            <div class="col-lg-3 col-6">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
              <img style="border-radius:4px;"
                src="https://www.gstatic.com/stadia/gamers/landing_page/assets/games/NBA2k20.png" height="80%" width="80%">
            </a>
              <p class="text-center mt-1">NBA 2K20</p>            
            </div>

            <div class="col-lg-3 col-6">
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
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
            <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>" class="btn viewmore">View More</a>
          </div>
        </div>

        <div class="row mt-3 text-center">
          <div class="col-lg-3 col-6 ">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
            <img style="border-radius:4px;"           
              src="<%=request.getContextPath() %>/Media/unnamedRosso.jpg" height="80%" width="80%">
              </a>
            <p class="text-center mt-1">XBOX DAYSTRIKE CAMO</p>
           
          </div>

          <div class="col-lg-3 col-6">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
            <img style="border-radius:4px;"
              src="<%=request.getContextPath() %>/Media/30_XboxControllerViola.jpeg" height="80%" width="80%">
              </a>
            <p class="text-center mt-1">XBOX VORTICE VIOLA</p>          
          </div>

          <div class="col-lg-3 col-6">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
            <img style="border-radius:4px;"
              src="<%=request.getContextPath() %>/Media/20_SchedaEspansioneXbox.jpeg" height="80%" width="80%">
          </a>
            <p class="text-center mt-1">SSD ESTERNO PER XBOX</p>
            
          </div>

          <div class="col-lg-3 col-6">
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
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
          <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>" class="btn viewmore">View More</a>
        </div>
      </div>

      <div class="row mt-3 text-center">
        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
          <img style="border-radius:4px; background: #e03424;"
            src="<%=request.getContextPath() %>/Media/XS.webp" height="80%" width="80%">
        </a>
          <p class="text-center mt-1">XBOX SERIE S </p>      
        </div>

        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
          <img style="border-radius:4px; background: #e03424;" src="<%=request.getContextPath() %>/Media/playstation-5-with-dualsense-front-product-shot-01-ps5-en-30jul20.webp" height="80%" width="80%">
         </a>
          <p class="text-center mt-1">PLAYSTATION 5</p>
         
        </div>

        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
          <img style="border-radius:4px; "
           	src="<%=request.getContextPath() %>/Media/NSW.webp" height="80%" width="80%">
        </a>
          <p class="text-center mt-1">NINTENDO SWITCH</p>
         
        </div>

        <div class="col-lg-3 col-6">
        <a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">
          <img style="border-radius:4px; background: #e03424;"
            src="<%=request.getContextPath() %>/Media/XSX.jpg" height="80%" width="80%">
        </a>
          <p class="text-center mt-1">XBOX SERIE X</p>
         
        </div>

      </div>
	  </div>
  <jsp:include page="footer.jsp"></jsp:include>
    <script>
     function showLoginAlert() {
        window.location.href = "<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>";
    } 
</script>
   </body>

</html>
