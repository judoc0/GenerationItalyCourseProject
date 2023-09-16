

 <%@page import="com.azienda.E_CommerceProva.utils.Costanti"%>
<%@page import="com.azienda.E_CommerceProva.model.Utente"%>
<nav class="navbar navbar-expand-md navbar-light">
    <div class="container">
      <a class="navbar-brand"
        href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+"/Jsp/Login.jsp"%>">
        Generation<span style="color:#f04027">Gaming</span>
        
          <!-- MODIFICARE NON RENDERLO CLICCABILE -->
        
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
          <li class="nav-item">
              <%
          
          Utente u = (Utente) request.getSession().getAttribute(Costanti.UTENTE);
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
      } else {
		%>
            <a class="nav-link active" aria-current="page" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">Home</a>
          </li>
           <%}
          String link = "";
          if(u == null) link = "/Jsp/Login.jsp";
          else link = "/Catalogo";
    	  %>
          <li class="nav-item dropdown">
            <a class="nav-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + link%>">
              Catalogo
            </a>
      <!--       <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <div class="row">
                <li class="col-lg-6"><a class="dropdown-item" href="#">Console</a></li>
                <li class="col-lg-6"><a class="dropdown-item" href="#">Accessori</a></li>
                <li class="col-lg-6"><a class="dropdown-item" href="#">Giochi fisici</a></li>
                <li class="col-lg-6"><a class="dropdown-item" href="#">Pass Digitali</a></li>             
              </div>
            </ul> --> 
          </li> 
          
          <li class="nav-item">
          	<a class="nav-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Register.jsp"%>">Registrati</a>            
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/Jsp/Login.jsp"%>">Accedi</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>