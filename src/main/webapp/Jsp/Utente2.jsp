<%@page import="com.azienda.E_CommerceProva.model.Ordine_Prodotto"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@page import="com.azienda.E_CommerceProva.model.Utente"%>
<%@page import="com.azienda.E_CommerceProva.model.Ordine"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Il mio account</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
 <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
<style>
   

video, img {
  width: 100%;
  height: 100%;
  object-fit: fill;
}

.bg-black {
  background: #000;
}

.skill-block {
  width: 25%;
  box-sizing: border-box;
      display: flex;
    align-items: center;
    justify-content: center;
}

body {
  background-color: #eeeeee;
}



      <%@ include file = "CSS/NavBar2.css"%>
      
      <%@ include file = "CSS/styleUtente.css"%>
      
      <%@ include file = "CSS/FooterStyle2.css"%>
      
             @keyframes slideFromLeft {
      from {
        transform:  translateX(600%);  Inizia dalla sinistra 
      }
      to {
        transform: translateX(0);  Arriva alla sua posizione finale 
        
      }
    }
    
                @keyframes slideFromRight {
      from {
        transform:  translateX(-200%); /* Inizia dalla sinistra */
      }
      to {
        transform: translateX(0); /* Arriva alla sua posizione finale */
        
      }
    }
      
      .utente {
      margin: 0;
      padding: 0;
      
      }
      
      	.navbar-brand {
		padding: 0;
		padding-left: 10.7rem;
		margin: 0;
	}
	
	.navbar-collapse{
		padding-left: 1.6rem;
	}
	
			#zoomable-div {
	animation: slideFromRight 1s ease; /* Usa l'animazione con una durata di 1 secondo */
  	transition: transform 0.1s ease; /* Aggiungi una transizione per un effetto più fluido */
	box-shadow: rgb(0, 0, 0) -20px 0 30px -10px;
}
	
	#zoomable-div1 {
	animation: slideFromLeft 1s ease; /* Usa l'animazione con una durata di 1 secondo */
  	transition: transform 0.1s ease; /* Aggiungi una transizione per un effetto più fluido */
	box-shadow: rgb(0, 0, 0) -20px 0 30px -10px;
}

#zoomable-div1:hover {
   transform: scale(1.2) translateX(-60px); /* Cambia la scala quando passi sopra il mouse (puoi regolare il valore per controllare il grado di zoom) */
  cursor: pointer; /* Cambia il cursore del mouse quando passi sopra il div */
  box-shadow: rgb(0, 0, 0) 20px 0 30px -10px, /* Ombra a destra */
            rgb(0, 0, 0) -20px 0 30px -10px; /* Ombra a sinistra */
}

	#zoomable-div2 {
	animation: slideFromLeft 1.05s ease; /* Usa l'animazione con una durata di 1 secondo */
  	transition: transform 0.1s ease; /* Aggiungi una transizione per un effetto più fluido */
	box-shadow: rgb(0, 0, 0) -20px 0 30px -10px;
}

#zoomable-div2:hover {
   transform: scale(1.2) translateX(-60px); /* Cambia la scala quando passi sopra il mouse (puoi regolare il valore per controllare il grado di zoom) */
  cursor: pointer; /* Cambia il cursore del mouse quando passi sopra il div */
  box-shadow: rgb(0, 0, 0) 20px 0 30px -10px, /* Ombra a destra */
            rgb(0, 0, 0) -20px 0 30px -10px; /* Ombra a sinistra */
}

	#zoomable-div3 {
	animation: slideFromLeft 1.1s ease; /* Usa l'animazione con una durata di 1 secondo */
  	transition: transform 0.1s ease; /* Aggiungi una transizione per un effetto più fluido */
	box-shadow: rgb(0, 0, 0) -20px 0 30px -10px;
}

#zoomable-div3:hover {
   transform: scale(1.2) translateX(-60px); /* Cambia la scala quando passi sopra il mouse (puoi regolare il valore per controllare il grado di zoom) */
  cursor: pointer; /* Cambia il cursore del mouse quando passi sopra il div */
  box-shadow: rgb(0, 0, 0) 20px 0 30px -10px, /* Ombra a destra */
            rgb(0, 0, 0) -20px 0 30px -10px; /* Ombra a sinistra */
}

	#zoomable-div4 {
	animation: slideFromLeft 1.15s ease; /* Usa l'animazione con una durata di 1 secondo */
  	transition: transform 0.1s ease; /* Aggiungi una transizione per un effetto più fluido */
	box-shadow: rgb(0, 0, 0) -20px 0 30px -10px;
}

#zoomable-div4:hover {
   transform: scale(1.2) translateX(-60px); /* Cambia la scala quando passi sopra il mouse (puoi regolare il valore per controllare il grado di zoom) */
  cursor: pointer; /* Cambia il cursore del mouse quando passi sopra il div */
  box-shadow: rgb(0, 0, 0) 20px 0 30px -10px, /* Ombra a destra */
            rgb(0, 0, 0) -20px 0 30px -10px; /* Ombra a sinistra */
}

	#ione1 {
	 font-size: 2em; /* Dimensione iniziale */
      transition: transform 0.3s ease, font-size 0.3s ease; 
}
	 #ione1:hover {
      font-size: 3em; /* Dimensione più grande al passaggio del mouse */
      transform: rotate(360deg); /* Rotazione di 360 gradi al passaggio del mouse */
      cursor: pointer; /* Cambia il cursore del mouse */
      color: #f4a825;
    }
    
    	#ione {
	
      transition: transform 0.3s ease, font-size 0.3s ease; 
}
	 #ione:hover {
 
      transform: rotate(360deg); /* Rotazione di 360 gradi al passaggio del mouse */
      cursor: pointer; /* Cambia il cursore del mouse */
      color: #f4a825;
    }
    

    
       #slide {
      
	  box-shadow: rgb(0, 0, 0) 20px 20px 30px -10px;
    }
    
    #pappa{margin-left: -0.97vw; } 
   .navbar-brand{padding-right: 32.51vw;}
	
</style>
</head>
<body>



<%

	List <Ordine> ordini = (List<Ordine>) request.getAttribute(Costanti.LISTA_ORDINI);
	int nOrdini = ordini == null ? 0 : ordini.size();  
	
	List <Ordine_Prodotto> ordine_Prodottos = (List<Ordine_Prodotto>) request.getAttribute(Costanti.ORDINE_PRODOTTI);
	//int nOrdini_Prodottos = ordine_Prodottos == null ? 0 : ordine_Prodottos.size();
	
	int nProdottiComprati = 0;
	Float spesaTotale = 0.0f;
	if (ordine_Prodottos != null) {
		for (Ordine_Prodotto ordine_Prodotto : ordine_Prodottos) {
			nProdottiComprati += ordine_Prodotto.getQuantita();
			spesaTotale += (ordine_Prodotto.getPrezzo() * ordine_Prodotto.getQuantita());
		}
	}
	
	String formattedValue = "";
	if(spesaTotale == 0.0f) formattedValue = String.format("%.0f", spesaTotale);
	else formattedValue = spesaTotale + "";
	
	Utente u = (Utente) request.getSession().getAttribute(Costanti.UTENTE);

%>
 <jsp:include page="navbar2.jsp"></jsp:include>
<div class="container mt-5 mb-5" id="shadow" style="padding: 0;">
            <div class="row no-gutters">
                <div class="col-md-4 col-lg-4"><video id="zoomable-div" src="./Media/procione.mp4" loop autoplay muted></video></div>
                <div class="col-md-8 col-lg-8">
                    <div class="d-flex flex-column" style="height: 100%;">
                        <div class="d-flex flex-row justify-content-between align-items-center p-5 bg-dark text-white">
                            <h3 class="display-5"><%=u.getNome() + " " + u.getCognome() %></h3><i class="fa-brands fa-facebook fa-2xl" id="ione1"></i><i class="fa-brands fa-youtube fa-2xl" id="ione1"></i><a style="color: white;" href="https://mail.google.com/mail"><i class="fa-brands fa-google fa-2xl" id="ione1"></i></a><i class="fa-brands fa-x-twitter fa-2xl" id="ione1"></i><i class="fa-brands fa-instagram fa-2xl" id="ione1"></i></div>
                        <div class="p-3 bg-black text-white">
                            <h6>Forza Lecce</h6>
                        </div>
                        <div class="d-flex flex-row text-white" style="height: 100%;">
                            <div class="p-3 bg-primary text-center skill-block d-flex align-items-center" id="zoomable-div1">
                            	<div class="d-flex flex-column align-items-center justify-content-center">
                                	
                                	<a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediCarrello" %>" style="color: white"><h6><i class="fa-solid fa-cart-shopping fa-2xl"></i><br><br>Carrello</h6></a> 
                                </div>
                            </div>
                            <div class="p-3 bg-success text-center skill-block d-flex align-items-center" id="zoomable-div2">
                            	<div class="d-flex flex-column align-items-center justify-content-center">
                                	<h4><%= nOrdini %></h4>
                                	<a href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediOrdini" %>" style="color: white"><h6>Ordini conclusi</h6></a>                               	
                                </div>
                            </div>
                            <div class="p-3 bg-warning text-center skill-block d-flex align-items-center" id="zoomable-div3" >
                            	<div class="d-flex flex-column align-items-center justify-content-center">
                                	<h4><%=nProdottiComprati %></h4>
                                	<h6>Prodotti comprati</h6>
                                </div>
                            </div>
                            <div class="p-3 bg-danger text-center skill-block d-flex align-items-center" id="zoomable-div4">
                            	<div class="d-flex flex-column align-items-center justify-content-center">
                                	<h4><%= formattedValue %>€</h4>
                                	<h6>Totale speso</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
 <jsp:include page="footer.jsp"></jsp:include> 
 
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/js/bootstrap.bundle.min.js"
    integrity="sha384-BOsAfwzjNJHrJ8cZidOg56tcQWfp6y72vEJ8xQ9w6Quywb24iOsW913URv1IS4GD"
    crossorigin="anonymous"></script>
</body>
</html>