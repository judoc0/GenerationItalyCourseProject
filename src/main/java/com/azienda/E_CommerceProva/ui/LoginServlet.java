package com.azienda.E_CommerceProva.ui;

import java.io.IOException;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Dao.RuoloDao;
import com.azienda.E_CommerceProva.Excption.PwErrataException;
import com.azienda.E_CommerceProva.Excption.UtenteInesistenteException;
import com.azienda.E_CommerceProva.model.Ruolo;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/Login")
public class LoginServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service)getServletContext().getAttribute(Costanti.SERVICE);
			String username = req.getParameter(Costanti.USERNAME);
			String password = req.getParameter(Costanti.PASSWORD);
			
			Utente u = sv.login(username, password);
			req.getSession().setAttribute(Costanti.UTENTE, u);
			req.getSession().setAttribute(Costanti.CARRELLO, sv.findCarrelloProdottiUtente(u));
			
			if (u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_CLIENTE)) {
				req.getRequestDispatcher("/Jsp/Home.jsp").forward(req, resp);
			}
			if (u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_ADMIN)) {
				req.getRequestDispatcher("/Jsp/HomeAdmin.jsp").forward(req, resp);
			}
			

		} catch (UtenteInesistenteException | PwErrataException e) {
			e.printStackTrace();
			String message = e.getMessage();
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
		
		
		catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}	
}
