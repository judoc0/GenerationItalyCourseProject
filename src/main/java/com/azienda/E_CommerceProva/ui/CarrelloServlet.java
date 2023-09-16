package com.azienda.E_CommerceProva.ui;

import java.io.IOException;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.model.Prodotto;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/AddCarrello")
public class CarrelloServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service)getServletContext().getAttribute(Costanti.SERVICE);
				
			Prodotto p = sv.trovaProdottoById(Integer.parseInt(req.getParameter(Costanti.PRODOTTO_ID))).get(0);			
			
			Utente u = (Utente)req.getSession().getAttribute(Costanti.UTENTE);
			
			Integer quantita = 1;
			if(req.getParameter(Costanti.QUANTITASELEZIONATA) != null) {
				quantita = Integer.parseInt(req.getParameter(Costanti.QUANTITASELEZIONATA));
			}
				
			sv.addCarrello_Prodotto(u, p, quantita);
			req.getSession().setAttribute(Costanti.CARRELLO, sv.findCarrelloProdottiUtente(u));
					
			resp.sendRedirect("http://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/VediCarrello");
								

		} 	catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}
}
