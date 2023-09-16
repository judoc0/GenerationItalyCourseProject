package com.azienda.E_CommerceProva.ui;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Excption.PwErrataException;
import com.azienda.E_CommerceProva.Excption.UtenteInesistenteException;
import com.azienda.E_CommerceProva.model.Carrello;
import com.azienda.E_CommerceProva.model.Carrello_Prodotto;
import com.azienda.E_CommerceProva.model.Categoria;
import com.azienda.E_CommerceProva.model.Fornitore;
import com.azienda.E_CommerceProva.model.Prodotto;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.BlobConverter;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/Catalogo")
public class CatalogoServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service)getServletContext().getAttribute(Costanti.SERVICE);
			
			String categoria = req.getParameter(Costanti.CAT);
			if(categoria != null) req.setAttribute(Costanti.CAT, categoria);
			
			String fornitore = req.getParameter(Costanti.FORN);
			if(fornitore != null) req.setAttribute(Costanti.FORN, fornitore);
			
			List<Categoria> listaCategorias = sv.findAllCategorie();
			req.setAttribute(Costanti.LISTA_CATEGORIE, listaCategorias);
			
			List<Fornitore> listaFornitores = sv.findAllFornitori();
			req.setAttribute(Costanti.LISTA_FORNITORI, listaFornitores);
			
			
			List<Prodotto> catalogo = sv.findAllProdotti();
			aggiungiImmaggini(catalogo, req);
			req.setAttribute(Costanti.CATALOGO, catalogo);
			
			Utente u = (Utente)req.getSession().getAttribute(Costanti.UTENTE);
			
			List<Carrello_Prodotto> carrello_Prodotti = sv.findCarrelloProdottiUtente(u);
			
			
			
			Map<Integer, Integer> mappa = new HashMap<>();			
			
			
				for (Prodotto prodotto : catalogo) {
					for (Carrello_Prodotto carrello_Prodotto : carrello_Prodotti) {
						if (prodotto.getId() == carrello_Prodotto.getProdotto().getId()) {
							mappa.put(prodotto.getId(), prodotto.getQuantita() - carrello_Prodotto.getQuantita());
							break;
						}
						if (!mappa.containsKey(prodotto.getId())) {
							mappa.put(prodotto.getId(), prodotto.getQuantita());
						}
				}
				
			}
			
			req.setAttribute(Costanti.MAPPA_QUANTITA, mappa);
			
			if(u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_CLIENTE)) req.getRequestDispatcher("/Jsp/Catalogo.jsp").forward(req, resp);
			
			if(u.getRuolo().getNomeRuolo().equals(Costanti.RUOLO_ADMIN)) { 
				req.setAttribute(Costanti.ORDINE_PRODOTTI, sv.findAllOrdine_Prodotti());
				req.getRequestDispatcher("/Jsp/CatalogoAdmin.jsp").forward(req, resp);			
			}
		} 	
		
		catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}
	
	
	public void aggiungiImmaggini(List<Prodotto> prodotti, HttpServletRequest request) throws Exception {
		
		Map<Integer, String> mappa = new HashMap<>();
		
		String uploadPath = getServletContext().getRealPath("") + File.separator + Costanti.UPLOAD_DIRECTORY;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		String baseHttpUrl = "Http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		
		for (Prodotto prodotto : prodotti) {
			Blob immagine = prodotto.getFoto();
			if (immagine != null) {
				String filePath = uploadPath + File.separator + prodotto.getId() + "_" + prodotto.getNomeImmagine();
				BlobConverter.saveFile(immagine, filePath);
				String imageUrl = baseHttpUrl + File.separator + Costanti.UPLOAD_DIRECTORY + File.separator + prodotto.getId() + "_" + prodotto.getNomeImmagine(); 
				mappa.put(prodotto.getId(), imageUrl);
			} else {
				
				String imageUrl = baseHttpUrl + "/Media/NotFound.jpg"; 
				mappa.put(prodotto.getId(), imageUrl);
			}
		}
		
		request.setAttribute(Costanti.MAPPA_FOTO, mappa);
		
		
	}
}
