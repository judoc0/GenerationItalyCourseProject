package com.azienda.E_CommerceProva.ui;

import java.io.IOException;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Excption.PwErrataException;
import com.azienda.E_CommerceProva.Excption.UtenteInesistenteException;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/Logout")
public class LogoutServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			

			req.getSession().removeAttribute(Costanti.UTENTE);
			

			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
			

		} 	catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}	
}
