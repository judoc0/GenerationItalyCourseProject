package com.azienda.E_CommerceProva.ui;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.model.Ordine;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/VediOrdini")
public class VediOrdiniServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service) getServletContext().getAttribute(Costanti.SERVICE);
			
			Utente u = (Utente) req.getSession().getAttribute(Costanti.UTENTE);
			
			List<Ordine> ordines = new ArrayList<>();
			
			if(req.getParameter(Costanti.ORDINI_ADMIN) != null) ordines = sv.findAllOrdini();
			else ordines = sv.findOrdiniByIdUtente(u);
				
			req.setAttribute(Costanti.LISTA_ORDINI, ordines);
			
	
			req.getRequestDispatcher("/Jsp/UtenteOrdini.jsp").forward(req, resp);
		} 	catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}


}
