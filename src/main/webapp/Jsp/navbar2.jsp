

 <%@page import="com.azienda.E_CommerceProva.model.Carrello_Prodotto"%>
<%@page import="java.util.List"%>
<%@page import="com.azienda.E_CommerceProva.model.Utente"%>
<%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<nav class="navbar navbar-expand-md navbar-light">
    <div class="container" id="pappa">
        <%
          
          Utente u = (Utente) request.getSession().getAttribute(Costanti.UTENTE);
      
      if (u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_CLIENTE)) {
			
    %> 
   
      <a class="navbar-brand"
        href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Home.jsp"%>">
        Generation<span style="color:#f04027">Gaming</span>
      
    	<%
      }
		if (u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_ADMIN)) {
    	
    	%>    
       
        <a class="navbar-brand"
        href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/HomeAdmin.jsp"%>">
        Generation<span style="color:#f04027">Gaming</span>
       
       <% 
		}

		%>
        
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item">
          
      <%
          
      if(u != null) {
      if (u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_CLIENTE)) {
			
    %>  
    	  
    	  <a class="nav-link active" aria-current="page" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Home.jsp"%>">Home</a>
     
    	<%
      }
		if (u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_ADMIN)) {
    	
    	%>  
     <a class="nav-link active" aria-current="page" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/HomeAdmin.jsp"%>">Home</a>
     
		<% 
		}
      }
		%>
                  
        
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo"%>">
              Catalogo
            </a>
        <!--     <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <div class="row">
                <li class="col-lg-6"><a class="dropdown-item" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo?cat=frutta"%>">Console</a></li>
                <li class="col-lg-6"><a class="dropdown-item" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo?cat=ortaggi"%>">Accessori</a></li>
                <li class="col-lg-6"><a class="dropdown-item" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo"%>">Giochi fisici</a></li>
                <li class="col-lg-6"><a class="dropdown-item" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo"%>">Pass Digitali</a></li>
                <li class="col-lg-6"><a class="dropdown-item" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Catalogo"%>">Tutti i prodotti</a></li>
              </div>
            </ul> --> 
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Utente"%>">Il mio account</a>
          </li>
          
            <li class="nav-item">
            <a class="nav-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/VediCarrello"%>">Carrello</a>
          </li>
            
            
            <% 
		
        List<Carrello_Prodotto> carrello = (List<Carrello_Prodotto>) request.getSession().getAttribute(Costanti.CARRELLO);
        int nProdottiCarrello = 0;
        if(carrello != null) {
        	nProdottiCarrello = carrello.size(); 
        }
        %>
        
         	<li>
            <span style="color: black" class="d-flex"> <%= nProdottiCarrello %>   </span>
            </li>
          
          
          
          
          <li class="nav-item">
          
           <form action="<%=request.getContextPath()+ "/Logout" %>" method="post">
            <div class="nav-link">
                <input style="padding: 1px 6px 1px 6px;" type="submit" value="Logout">
            </div>
        </form>
          
           
          </li>
        </ul>
      </div>
    </div>
  </nav>