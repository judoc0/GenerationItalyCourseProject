package com.azienda.E_CommerceProva.ui;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Excption.DisponibilitàNegativaException;
import com.azienda.E_CommerceProva.Excption.QuantitaNegativaException;
import com.azienda.E_CommerceProva.model.Carrello_Prodotto;
import com.azienda.E_CommerceProva.model.Categoria;
import com.azienda.E_CommerceProva.model.Fornitore;
import com.azienda.E_CommerceProva.model.Prodotto;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/ModificaRedirect")
public class ModificaProdottoRedirect extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service) getServletContext().getAttribute(Costanti.SERVICE);
			
			Prodotto p = sv.trovaProdottoById((Integer.parseInt(req.getParameter(Costanti.PRODOTTO_ID)))).get(0);
			
			req.setAttribute(Costanti.PRODOTTO, p);
			
			List<Categoria> cat =  sv.findAllCategorie();
			req.setAttribute(Costanti.LISTA_CATEGORIE, cat);
			
			List<Fornitore> forn =  sv.findAllFornitori();
			req.setAttribute(Costanti.LISTA_FORNITORI, forn);
			
			req.getRequestDispatcher("/Jsp/ModificaProdotto.jsp").forward(req, resp);
		} 	catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}	
}
