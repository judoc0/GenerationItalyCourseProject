package com.azienda.E_CommerceProva.ui;

import java.io.IOException;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Excption.CampiVuotiNonAmmessiException;
import com.azienda.E_CommerceProva.Excption.EmailGiaEsistenteException;
import com.azienda.E_CommerceProva.Excption.UsernameGiaEsistenteException;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/Register")
public class RegisterServet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Service sv = (Service)getServletContext().getAttribute(Costanti.SERVICE);
		
			String nome = req.getParameter(Costanti.NOME);
			String cognome = req.getParameter(Costanti.COGNOME);
			String username = req.getParameter(Costanti.USERNAME);
			String password = req.getParameter(Costanti.PASSWORD);
			String email = req.getParameter(Costanti.EMAIL);
			String telefono = req.getParameter(Costanti.TELEFONO);
			String citta = req.getParameter(Costanti.CITTA);
			String indirizzo = req.getParameter(Costanti.INDIRIZZO);

			sv.inserimento(nome, cognome, username, password, email, telefono, citta, indirizzo, Costanti.RUOLO_CLIENTE);
			String message = "Inserimento Effettuato";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/RegistrazioneEffettuata.jsp").forward(req, resp);

		}catch (CampiVuotiNonAmmessiException | EmailGiaEsistenteException | UsernameGiaEsistenteException e) {
			e.printStackTrace();
			String message = e.getMessage();
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			
			req.setAttribute(Costanti.NOME, req.getParameter(Costanti.NOME));
			req.setAttribute(Costanti.COGNOME, req.getParameter(Costanti.COGNOME));			
			req.setAttribute(Costanti.USERNAME, req.getParameter(Costanti.USERNAME));
			req.setAttribute(Costanti.PASSWORD, req.getParameter(Costanti.PASSWORD));
			req.setAttribute(Costanti.EMAIL, req.getParameter(Costanti.EMAIL));
			req.setAttribute(Costanti.TELEFONO, req.getParameter(Costanti.TELEFONO));
			req.setAttribute(Costanti.CITTA, req.getParameter(Costanti.CITTA));
			req.setAttribute(Costanti.INDIRIZZO, req.getParameter(Costanti.INDIRIZZO));
		
			req.getRequestDispatcher("/Jsp/RegisterUsername.jsp").forward(req, resp);
		}
		catch (Exception e) {
			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Register.jsp").forward(req, resp);
		}
	}
}
