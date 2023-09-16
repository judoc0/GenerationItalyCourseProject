<%@page import="com.azienda.E_CommerceProva.model.Utente"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.azienda.E_CommerceProva.model.Ordine"%>
<%@page import="com.azienda.E_CommerceProva.model.Ordine_Prodotto"%>
<%@page import="java.util.Map"%>
<%@page import="com.azienda.E_CommerceProva.model.Carrello_Prodotto"%>
<%@page import="com.azienda.E_CommerceProva.BusinessLogic.Service"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@page import="com.azienda.E_CommerceProva.model.Prodotto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css" integrity="sha384-DhY6onE6f3zzKbjUPRc2hOzGAdEf4/Dz+WJwBvEYL/lkkIsI3ihufq9hk9K4lVoK" crossorigin="anonymous">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  
<title>Carrello</title>
<style type="text/css">



<%@ include file = "CSS/stylecar.css"%>
<%@ include file = "CSS/style.css"%>
<%@ include file = "CSS/FooterStyle.css"%>
<%@ include file = "CSS/NavBar2.css"%>
  
.custom-page-brand {
    padding-left: 4.1rem; /* Nuovo valore di padding-left */
}

.cart {
	margin-bottom: 14rem;
	margin-top: 3rem;
}

body {

 height: 100%;	
}

.kaka{
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 82.6vh;
}

:root {
  --primary: #275EFE;
  --primary-light: #7699FF;
  --dark: #1C212E;
  --grey-dark: #3F4656;
  --grey: #6C7486;
  --grey-light: #CDD9ED;
  --white: #FFF;
  --green: #16BF78;
  --sand: #DCB773;
  --sand-light: #EDD9A9;
}
.order {
  appearance: none;
  border: 0;
  background: #FFB645;
  position: relative;
  height: 63px;
  width: 240px;
  padding: 0;
  outline: none;
  cursor: pointer;
  border-radius: 32px;
  -webkit-mask-image: -webkit-radial-gradient(white, black);
  -webkit-tap-highlight-color: transparent;
  overflow: hidden;
  transition: transform 0.3s ease;
  transition: background 0.3s ease;
}
.order:hover{
 background: var(--dark);
}
.order span {
  --o: 1;
  position: absolute;
  left: 0;
  right: 0;
  text-align: center;
  top: 19px;
  line-height: 24px;
  color: var(--white);
  font-size: 16px;
  font-weight: 500;
  opacity: var(--o);
  transition: opacity 0.3s ease;
}
.order span.default {
  transition-delay: 0.3s;
}
.order span.success {
  --offset: 16px;
  --o: 0;
}
.order span.success svg {
  width: 12px;
  height: 10px;
  display: inline-block;
  vertical-align: top;
  fill: none;
  margin: 7px 0 0 4px;
  stroke: var(--green);
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke-dasharray: 16px;
  stroke-dashoffset: var(--offset);
  transition: stroke-dashoffset 0.3s ease;
}
.order:active {
  transform: scale(0.96);
}
.order .lines {
  opacity: 0;
  position: absolute;
  height: 3px;
  background: var(--white);
  border-radius: 2px;
  width: 6px;
  top: 30px;
  left: 100%;
  box-shadow: 15px 0 0 var(--white), 30px 0 0 var(--white), 45px 0 0 var(--white), 60px 0 0 var(--white), 75px 0 0 var(--white), 90px 0 0 var(--white), 105px 0 0 var(--white), 120px 0 0 var(--white), 135px 0 0 var(--white), 150px 0 0 var(--white), 165px 0 0 var(--white), 180px 0 0 var(--white), 195px 0 0 var(--white), 210px 0 0 var(--white), 225px 0 0 var(--white), 240px 0 0 var(--white), 255px 0 0 var(--white), 270px 0 0 var(--white), 285px 0 0 var(--white), 300px 0 0 var(--white), 315px 0 0 var(--white), 330px 0 0 var(--white);
}
.order .back, .order .box {
  --start: var(--white);
  --stop: var(--grey-light);
  border-radius: 2px;
  background: linear-gradient(var(--start), var(--stop));
  position: absolute;
}
.order .truck {
  width: 60px;
  height: 41px;
  left: 100%;
  z-index: 1;
  top: 11px;
  position: absolute;
  transform: translateX(24px);
}
.order .truck:before, .order .truck:after {
  --r: -90deg;
  content: '';
  height: 2px;
  width: 20px;
  right: 58px;
  position: absolute;
  display: block;
  background: var(--white);
  border-radius: 1px;
  transform-origin: 100% 50%;
  transform: rotate(var(--r));
}
.order .truck:before {
  top: 4px;
}
.order .truck:after {
  --r: 90deg;
  bottom: 4px;
}
.order .truck .back {
  left: 0;
  top: 0;
  width: 60px;
  height: 41px;
  z-index: 1;
}
.order .truck .front {
  overflow: hidden;
  position: absolute;
  border-radius: 2px 9px 9px 2px;
  width: 26px;
  height: 41px;
  left: 60px;
}
.order .truck .front:before, .order .truck .front:after {
  content: '';
  position: absolute;
  display: block;
}
.order .truck .front:before {
  height: 13px;
  width: 2px;
  left: 0;
  top: 14px;
  background: linear-gradient(var(--grey), var(--grey-dark));
}
.order .truck .front:after {
  border-radius: 2px 9px 9px 2px;
  background: var(--primary);
  width: 24px;
  height: 41px;
  right: 0;
}
.order .truck .front .window {
  overflow: hidden;
  border-radius: 2px 8px 8px 2px;
  background: var(--primary-light);
  transform: perspective(4px) rotateY(3deg);
  width: 22px;
  height: 41px;
  position: absolute;
  left: 2px;
  top: 0;
  z-index: 1;
  transform-origin: 0 50%;
}
.order .truck .front .window:before, .order .truck .front .window:after {
  content: '';
  position: absolute;
  right: 0;
}
.order .truck .front .window:before {
  top: 0;
  bottom: 0;
  width: 14px;
  background: var(--dark);
}
.order .truck .front .window:after {
  width: 14px;
  top: 7px;
  height: 4px;
  position: absolute;
  background: rgba(255, 255, 255, 0.14);
  transform: skewY(14deg);
  box-shadow: 0 7px 0 rgba(255, 255, 255, 0.14);
}
.order .truck .light {
  width: 3px;
  height: 8px;
  left: 83px;
  transform-origin: 100% 50%;
  position: absolute;
  border-radius: 2px;
  transform: scaleX(0.8);
  background: #f0dc5f;
}
.order .truck .light:before {
  content: '';
  height: 4px;
  width: 7px;
  opacity: 0;
  transform: perspective(2px) rotateY(-15deg) scaleX(0.94);
  position: absolute;
  transform-origin: 0 50%;
  left: 3px;
  top: 50%;
  margin-top: -2px;
  background: linear-gradient(90deg, #f0dc5f, rgba(240, 220, 95, 0.7), rgba(240, 220, 95, 0));
}
.order .truck .light.top {
  top: 4px;
}
.order .truck .light.bottom {
  bottom: 4px;
}
.order .box {
  --start: var(--sand-light);
  --stop: var(--sand);
  width: 21px;
  height: 21px;
  right: 100%;
  top: 21px;
}
.order .box:before, .order .box:after {
  content: '';
  top: 10px;
  position: absolute;
  left: 0;
  right: 0;
}
.order .box:before {
  height: 3px;
  margin-top: -1px;
  background: rgba(0, 0, 0, 0.1);
}
.order .box:after {
  height: 1px;
  background: rgba(0, 0, 0, 0.15);
}
.order.animate .default {
  --o: 0;
  transition-delay: 0s;
}
.order.animate .success {
  --offset: 0;
  --o: 1;
  transition-delay: 7s;
}
.order.animate .success svg {
  transition-delay: 7.3s;
}
.order.animate .truck {
  animation: truck 10s ease forwards;
}
.order.animate .truck:before {
  animation: door1 2.4s ease forwards 0.3s;
}
.order.animate .truck:after {
  animation: door2 2.4s ease forwards 0.6s;
}
.order.animate .truck .light:before, .order.animate .truck .light:after {
  animation: light 10s ease forwards;
}
.order.animate .box {
  animation: box 10s ease forwards;
}
.order.animate .lines {
  animation: lines 10s ease forwards;
}
@keyframes truck {
  10%, 30% {
    transform: translateX(-164px);
  }
  40% {
    transform: translateX(-104px);
  }
  60% {
    transform: translateX(-224px);
  }
  75%, 100% {
    transform: translateX(24px);
  }
}
@keyframes lines {
  0%, 30% {
    opacity: 0;
    transform: scaleY(0.7) translateX(0);
  }
  35%, 65% {
    opacity: 1;
  }
  70% {
    opacity: 0;
  }
  100% {
    transform: scaleY(0.7) translateX(-400px);
  }
}
@keyframes light {
  0%, 30% {
    opacity: 0;
    transform: perspective(2px) rotateY(-15deg) scaleX(0.88);
  }
  40%, 100% {
    opacity: 1;
    transform: perspective(2px) rotateY(-15deg) scaleX(0.94);
  }
}
@keyframes door1 {
  30%, 50% {
    transform: rotate(32deg);
  }
}
@keyframes door2 {
  30%, 50% {
    transform: rotate(-32deg);
  }
}
@keyframes box {
  8%, 10% {
    transform: translateX(40px);
    opacity: 1;
  }
  25% {
    transform: translateX(112px);
    opacity: 1;
  }
  26% {
    transform: translateX(112px);
    opacity: 0;
  }
  27%, 100% {
    transform: translateX(0px);
    opacity: 0;
  }
}
html {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}
* {
  box-sizing: inherit;
}
*:before, *:after {
  box-sizing: inherit;
}

body .dribbble {
  position: fixed;
  display: block;
  right: 20px;
  bottom: 20px;
}
body .dribbble img {
  display: block;
  height: 28px;
}

p {
	color: white;
}


.navbar-brand{
	padding-left: 4.53vw;
	padding-right: 33.19vw;
}



</style>
</head>
<body>
<jsp:include page="navbar2.jsp"></jsp:include>
	<% 
		Utente u = (Utente) request.getSession().getAttribute(Costanti.UTENTE);
		Ordine ordine = (Ordine) request.getAttribute(Costanti.ORDINE);
		List<Ordine_Prodotto> ordine_Prodottos = (List<Ordine_Prodotto>) request.getAttribute(Costanti.ORDINE_PRODOTTI);
        Map<Integer, String> mappa = (Map<Integer, String>) request.getAttribute(Costanti.MAPPA_FOTO);
		double prezzoTotale = 0.0;
        String spazio = "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp";    
        %>
     <h5 style="margin-left: 8vw; margin-top: 3vh; color: white;"><%= "ID-ORDINE: &nbsp" + ordine.getId() + spazio+"DATA: &nbsp"+ ordine.getDate().format(DateTimeFormatter.ofPattern("dd-MM-yyyy")) + spazio+"ORARIO: &nbsp" + ordine.getDate().format(DateTimeFormatter.ofPattern("HH:mm:ss"))%></h5>   
	<div class="container cart" style="margin-top: 3vh">
		<table>
			<tr>
				<th>Prodotto</th>
				<th>Quantità</th>
				<th>Subtotale</th>
			</tr>
			<%
			for (Ordine_Prodotto cp : ordine_Prodottos) {
        %>
			<tr>
				<td>
					<div class="cart-info">
						<img alt="" src="<%=mappa.get(cp.getId()) %>" width="100" height="100">
						<div>
							<p><%=cp.getNome()%></p>
							<p>Prezzo: <%=cp.getPrezzo()%>&euro;</p>
							<p><span style="color: aqua;"><%=cp.getDisponibile()%></span></p>
							<%
            double prezzoProdotto = cp.getPrezzo() * cp.getQuantita();
            prezzoTotale += prezzoProdotto;
            %>
						</div>
					</div>
				</td>
				<td style="color: white;"><%=cp.getQuantita() %></td>
				<td style="color: white;"><%=String.format("%.2f", prezzoProdotto)%>&euro;</td>
			</tr>
			<% } %>
		</table>
		<div class="total-price">
			<div style="width: 100%">
            <a class="btn btn-primary" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediOrdini"%>">Torna ai tuoi ordini</a>
            </div>
			<table>
				<tr>
					<td style="color: white;">Totale&nbsp;&nbsp;&nbsp;&nbsp;<%=String.format("%.2f", prezzoTotale)%>&euro;</td>
				</tr>
			</table>
			
				
			
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

 

     <script>
    // Funzione per impostare il gradiente come sfondo del body
    function impostaGradienteSfondo() {
      // Definisci il gradiente come stringa CSS551120
      var gradiente = "linear-gradient(to bottom, #4D2DB7, #551120)";
      
      // Imposta il gradiente come sfondo del body
      document.body.style.background = gradiente;
    }

    // Aggiungi un ascoltatore per l'evento DOMContentLoaded
    if (<%=u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_ADMIN)%>) document.addEventListener("DOMContentLoaded", impostaGradienteSfondo);
    
  </script>
    
</body>
</html>
