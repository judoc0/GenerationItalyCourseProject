<%@page import="com.azienda.E_CommerceProva.model.Utente"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <title>Thank You for Your Purchase</title>
    <style>
    
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background: -webkit-linear-gradient(bottom, #551120, #f04027);
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: #551120;
            border-radius: 8px;
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 1);
        }

        h2 {
            text-align: center;
            color: #f4a825;
        }

        p {
        	font-size: 20px;
            text-align: center;
        }
        
  		.link-styled {
    		color: white;
    		text-decoration: none;
    		font-weight: bold;
  		}
  		
  		.link-styled:hover {
    		color: #f4a825; /* Cambia il colore quando il mouse passa sopra */
    		text-decoration: underline; /* Sottolinea il testo quando il mouse passa sopra */
  }


        .review-form {
            margin-top: 30px;
            text-align: center;
        }

        .review-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .review-form textarea {
            width: 100%;
            height: 100px;
            resize: vertical;
        }

        .review-form button {
            background-color: #551120;
            color: #fff;
            padding: 10px 20px;
            border: 1px solid #f4a825;
            border-radius: 5px;
            cursor: pointer;
        }

        .review-form button:hover {
            background-color: #f4a825;
        }
        * {
  border: 0;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

:root {
  --bg: #e3e4e8;
  --fg: #17181c;
  --primary: #255ff4;
  --yellow: #f4a825;
  --yellow-t: rgba(244, 168, 37, 0);
  --bezier: cubic-bezier(0.42,0,0.58,1);
  --trans-dur: 0.3s;
  font-size: calc(20px + (30 - 24) * (100vw - 320px) / (1280 - 320));
}

body {
  background-color: var(--bg);
  color: var(--fg);
  font: 1em/1.5 "DM Sans", sans-serif;
  display: flex;
  height: 100vh;
  transition: background-color var(--trans-dur), color var(--trans-dur);
}

.rating {
  margin: auto;
}
.rating__display {
  font-size: 1em;
  font-weight: 500;
  min-height: 1.25em;
  position: absolute;
  top: 100%;
  width: 100%;
  text-align: center;
}
.rating__stars {
  display: flex;
  justify-content: center;
  padding-bottom: 0.375em;
  position: relative;
}
.rating__star {
  display: block;
  overflow: visible;
  pointer-events: none;
  width: 2em;
  height: 2em;
}
.rating__star-ring, .rating__star-fill, .rating__star-line, .rating__star-stroke {
  animation-duration: 1s;
  animation-timing-function: ease-in-out;
  animation-fill-mode: forwards;
}
.rating__star-ring, .rating__star-fill, .rating__star-line {
  stroke: var(--yellow);
}
.rating__star-fill {
  fill: var(--yellow);
  transform: scale(0);
  transition: fill var(--trans-dur) var(--bezier), transform var(--trans-dur) var(--bezier);
}
.rating__star-stroke {
  stroke: #c7cad1;
  transition: stroke var(--trans-dur);
}
.rating__label {
  cursor: pointer;
  padding: 0.125em;
}
.rating__label--delay1 .rating__star-ring, .rating__label--delay1 .rating__star-fill, .rating__label--delay1 .rating__star-line, .rating__label--delay1 .rating__star-stroke {
  animation-delay: 0.05s;
}
.rating__label--delay2 .rating__star-ring, .rating__label--delay2 .rating__star-fill, .rating__label--delay2 .rating__star-line, .rating__label--delay2 .rating__star-stroke {
  animation-delay: 0.1s;
}
.rating__label--delay3 .rating__star-ring, .rating__label--delay3 .rating__star-fill, .rating__label--delay3 .rating__star-line, .rating__label--delay3 .rating__star-stroke {
  animation-delay: 0.15s;
}
.rating__label--delay4 .rating__star-ring, .rating__label--delay4 .rating__star-fill, .rating__label--delay4 .rating__star-line, .rating__label--delay4 .rating__star-stroke {
  animation-delay: 0.2s;
}
.rating__input {
  -webkit-appearance: none;
  appearance: none;
}
.rating__input:hover ~ [data-rating]:not([hidden]) {
  display: none;
}
.rating__input-1:hover ~ [data-rating="1"][hidden], .rating__input-2:hover ~ [data-rating="2"][hidden], .rating__input-3:hover ~ [data-rating="3"][hidden], .rating__input-4:hover ~ [data-rating="4"][hidden], .rating__input-5:hover ~ [data-rating="5"][hidden], .rating__input:checked:hover ~ [data-rating]:not([hidden]) {
  display: block;
}
.rating__input-1:hover ~ .rating__label:first-of-type .rating__star-stroke, .rating__input-2:hover ~ .rating__label:nth-of-type(-n + 2) .rating__star-stroke, .rating__input-3:hover ~ .rating__label:nth-of-type(-n + 3) .rating__star-stroke, .rating__input-4:hover ~ .rating__label:nth-of-type(-n + 4) .rating__star-stroke, .rating__input-5:hover ~ .rating__label:nth-of-type(-n + 5) .rating__star-stroke {
  stroke: var(--yellow);
  transform: scale(1);
}
.rating__input-1:checked ~ .rating__label:first-of-type .rating__star-ring, .rating__input-2:checked ~ .rating__label:nth-of-type(-n + 2) .rating__star-ring, .rating__input-3:checked ~ .rating__label:nth-of-type(-n + 3) .rating__star-ring, .rating__input-4:checked ~ .rating__label:nth-of-type(-n + 4) .rating__star-ring, .rating__input-5:checked ~ .rating__label:nth-of-type(-n + 5) .rating__star-ring {
  animation-name: starRing;
}
.rating__input-1:checked ~ .rating__label:first-of-type .rating__star-stroke, .rating__input-2:checked ~ .rating__label:nth-of-type(-n + 2) .rating__star-stroke, .rating__input-3:checked ~ .rating__label:nth-of-type(-n + 3) .rating__star-stroke, .rating__input-4:checked ~ .rating__label:nth-of-type(-n + 4) .rating__star-stroke, .rating__input-5:checked ~ .rating__label:nth-of-type(-n + 5) .rating__star-stroke {
  animation-name: starStroke;
}
.rating__input-1:checked ~ .rating__label:first-of-type .rating__star-line, .rating__input-2:checked ~ .rating__label:nth-of-type(-n + 2) .rating__star-line, .rating__input-3:checked ~ .rating__label:nth-of-type(-n + 3) .rating__star-line, .rating__input-4:checked ~ .rating__label:nth-of-type(-n + 4) .rating__star-line, .rating__input-5:checked ~ .rating__label:nth-of-type(-n + 5) .rating__star-line {
  animation-name: starLine;
}
.rating__input-1:checked ~ .rating__label:first-of-type .rating__star-fill, .rating__input-2:checked ~ .rating__label:nth-of-type(-n + 2) .rating__star-fill, .rating__input-3:checked ~ .rating__label:nth-of-type(-n + 3) .rating__star-fill, .rating__input-4:checked ~ .rating__label:nth-of-type(-n + 4) .rating__star-fill, .rating__input-5:checked ~ .rating__label:nth-of-type(-n + 5) .rating__star-fill {
  animation-name: starFill;
}
.rating__input-1:not(:checked):hover ~ .rating__label:first-of-type .rating__star-fill, .rating__input-2:not(:checked):hover ~ .rating__label:nth-of-type(2) .rating__star-fill, .rating__input-3:not(:checked):hover ~ .rating__label:nth-of-type(3) .rating__star-fill, .rating__input-4:not(:checked):hover ~ .rating__label:nth-of-type(4) .rating__star-fill, .rating__input-5:not(:checked):hover ~ .rating__label:nth-of-type(5) .rating__star-fill {
  fill: var(--yellow-t);
}
.rating__sr {
  clip: rect(1px, 1px, 1px, 1px);
  overflow: hidden;
  position: absolute;
  width: 1px;
  height: 1px;
}

@media (prefers-color-scheme: dark) {
  :root {
    --bg: #17181c;
    --fg: #e3e4e8;
  }

  .rating {
    margin: auto;
  }
  .rating__star-stroke {
    stroke: #454954;
  }
}
@keyframes starRing {
  from, 20% {
    animation-timing-function: ease-in;
    opacity: 1;
    r: 8px;
    stroke-width: 16px;
    transform: scale(0);
  }
  35% {
    animation-timing-function: ease-out;
    opacity: 0.5;
    r: 8px;
    stroke-width: 16px;
    transform: scale(1);
  }
  50%, to {
    opacity: 0;
    r: 16px;
    stroke-width: 0;
    transform: scale(1);
  }
}
@keyframes starFill {
  from, 40% {
    animation-timing-function: ease-out;
    transform: scale(0);
  }
  60% {
    animation-timing-function: ease-in-out;
    transform: scale(1.2);
  }
  80% {
    transform: scale(0.9);
  }
  to {
    transform: scale(1);
  }
}
@keyframes starStroke {
  from {
    transform: scale(1);
  }
  20%, to {
    transform: scale(0);
  }
}
@keyframes starLine {
  from, 40% {
    animation-timing-function: ease-out;
    stroke-dasharray: 1 23;
    stroke-dashoffset: 1;
  }
  60%, to {
    stroke-dasharray: 12 12;
    stroke-dashoffset: -12;
  }
}
    </style>
</head>
<body>
			<% 
			Utente u = (Utente) request.getSession().getAttribute(Costanti.UTENTE);
			String link = "";
        	if(((Utente)request.getSession().getAttribute(Costanti.UTENTE)).getRuolo().getNomeRuolo().equals(Costanti.RUOLO_CLIENTE)) link = "/Jsp/Home.jsp";
        	else link = "/Jsp/HomeAdmin.jsp";%>
    <div class="container">
    	
        <h2>Grazie Per Il Tuo Ordine!</h2>
        <br>
        <img src="https://i.imgur.com/bUAuTXs.png" alt="La mia immagine" style="margin-left: 40px; margin-bottom: 10px"/>
        <p>Speriamo che tu possa apprezzare il tuo nuovo acquisto.<br>Il tuo ordine è stato elaborato con successo.<br>Controlla la tua casella postale per tutti i dettagli.</p>
        <div class="review-form">
        	
            <form action="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + link%>" method="post">        
                <button type="submit">Torna alla Home <i class="fa-solid fa-house"></i></button>
            </form>
        </div>
        <br>
        <h1 style="font-family: 'Roboto', sans-serif; font-size: 36px; color: black; margin-left: 3.7rem">Generation<span style="color:#f04027;">Gaming</span></h1>
       </div>
       
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
    