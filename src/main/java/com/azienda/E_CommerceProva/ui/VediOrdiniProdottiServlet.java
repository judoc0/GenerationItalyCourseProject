package com.azienda.E_CommerceProva.ui;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.model.Ordine;
import com.azienda.E_CommerceProva.model.Ordine_Prodotto;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.BlobConverter;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/VediOrdiniProdotti")
public class VediOrdiniProdottiServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service) getServletContext().getAttribute(Costanti.SERVICE);
			
			Utente u = (Utente) req.getSession().getAttribute(Costanti.UTENTE);
			
			String idOrdine = req.getParameter(Costanti.LISTA_ORDINI);
			Ordine ordine = sv.findOrdineByIdOrdine(Integer.parseInt(idOrdine));
			req.setAttribute(Costanti.ORDINE, ordine);
			
			List<Ordine_Prodotto> ordine_Prodottos = sv.findOrdiniByIdOrdine(Integer.parseInt(idOrdine));
			aggiungiImmaggini(ordine_Prodottos, req);
			
			req.setAttribute(Costanti.ORDINE_PRODOTTI, ordine_Prodottos);
			
	
			req.getRequestDispatcher("/Jsp/UtenteOrdiniProdotti.jsp").forward(req, resp);
		} 	catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}

	public void aggiungiImmaggini(List<Ordine_Prodotto> prodotti, HttpServletRequest request) throws Exception {
		
		Map<Integer, String> mappa = new HashMap<>();
		
		String uploadPath = getServletContext().getRealPath("") + File.separator + Costanti.UPLOAD_DIRECTORY;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		String baseHttpUrl = "Http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		
		for (Ordine_Prodotto prodotto : prodotti) {
			Blob immagine = null;
			if (prodotto.getProdotto() != null) {
				immagine = prodotto.getProdotto().getFoto();
			}		
			if (immagine != null) {
				String filePath = uploadPath + File.separator + prodotto.getId() + "_" + prodotto.getProdotto().getNomeImmagine();
				BlobConverter.saveFile(immagine, filePath);
				String imageUrl = baseHttpUrl + File.separator + Costanti.UPLOAD_DIRECTORY + File.separator + prodotto.getId() + "_" + prodotto.getProdotto().getNomeImmagine(); 
				mappa.put(prodotto.getId(), imageUrl);
			} else {				
				String imageUrl = baseHttpUrl + "/Media/NotFound.jpg"; 
				mappa.put(prodotto.getId(), imageUrl);
			}
		}
		
		request.setAttribute(Costanti.MAPPA_FOTO, mappa);
		
		
	}
}
