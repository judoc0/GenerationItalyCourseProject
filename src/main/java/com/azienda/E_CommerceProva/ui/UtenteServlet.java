package com.azienda.E_CommerceProva.ui;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.model.Ordine;
import com.azienda.E_CommerceProva.model.Ordine_Prodotto;
import com.azienda.E_CommerceProva.model.Prodotto;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Utente")
public class UtenteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			Service sv = (Service) getServletContext().getAttribute(Costanti.SERVICE);

			Utente u = (Utente) req.getSession().getAttribute(Costanti.UTENTE);

			List<Ordine> ordini = sv.findOrdiniByIdUtente(u);

			List<Ordine_Prodotto> ordine_Prodotti = sv.findProdottiByOrdine(ordini);
			

			req.setAttribute(Costanti.ORDINE_PRODOTTI, ordine_Prodotti);

			req.setAttribute(Costanti.LISTA_ORDINI, ordini);

			if (u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_ADMIN)) {
				
				List<Utente> utentes = sv.findAllUtenti();
				req.setAttribute(Costanti.LISTA_UTENTI, utentes);
				
				List<Ordine> ordines = sv.findAllOrdini();
				req.setAttribute(Costanti.LISTA_ORDINI_ADMIN, ordines);
				
				List<Ordine_Prodotto> ordine_Prodottos = sv.findAllOrdine_Prodotti();
				req.setAttribute(Costanti.LISTA_ORDINE_PRODOTTI_ADMIN, ordine_Prodottos);
				
				req.getRequestDispatcher("Jsp/UtenteAdmin.jsp").forward(req, resp);
			} else {
				req.getRequestDispatcher("Jsp/Utente2.jsp").forward(req, resp);
			} 

		} catch (Exception e) {
			e.printStackTrace();
			String message = "We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}

	}

}
