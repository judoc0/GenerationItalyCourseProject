package com.azienda.E_CommerceProva.ui;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Excption.DisponibilitàNegativaException;
import com.azienda.E_CommerceProva.Excption.QuantitaNegativaException;
import com.azienda.E_CommerceProva.model.Carrello_Prodotto;
import com.azienda.E_CommerceProva.model.Prodotto;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.BlobConverter;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
@SuppressWarnings("serial")
@WebServlet("/CreaProdotto")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,maxFileSize = 1024 * 1024 * 10,maxRequestSize = 1024 * 1024 * 10 * 5)
public class CreaProdottoServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service)getServletContext().getAttribute(Costanti.SERVICE);
			
			String nome = req.getParameter(Costanti.NOME_PRODOTTO);
			Float prezzo = Float.parseFloat(req.getParameter(Costanti.PREZZO_PRODOTTO));
			String descrizione = req.getParameter(Costanti.DESCRIZIONE_PRODOTTO);
			Integer disponibilita = Integer.parseInt(req.getParameter(Costanti.DISPONIBILITA_PRODOTTO));
			String categoria = req.getParameter(Costanti.CATEGORIA_PRODOTTO);
			String fornitore = req.getParameter(Costanti.FORNITORE_PRODOTTO);
			
			String uploadPath = getServletContext().getRealPath("") + File.separator + Costanti.UPLOAD_DIRECTORY;
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			
			Blob immagine = null;
			String nomeImmagine = null;
			String filePath = null;
			
			for (Part part : req.getParts() ) {
				String fileName = part.getSubmittedFileName();
				if ( fileName!=null && !fileName.isEmpty() ) {
					filePath = uploadPath + File.separator + fileName;
					part.write(filePath);
					immagine = BlobConverter.generateBlob(filePath);
					nomeImmagine = fileName;
				}
			}
		
		
			sv.createProdotto(nome.toUpperCase(), descrizione, prezzo, disponibilita, immagine, nomeImmagine, categoria, fornitore);

			/*List<Prodotto> catalogo = sv.findAllProdotti();
			
			req.setAttribute(Costanti.CATALOGO, catalogo);*/
			
			resp.sendRedirect("http://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/Catalogo");
			//req.getRequestDispatcher("/Catalogo").forward(req, resp);
							
			
		} 	catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}	
}
