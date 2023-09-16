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
@WebServlet("/VediProdotto")
public class VediProdottoServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service)getServletContext().getAttribute(Costanti.SERVICE);
						
			String idProdotto = req.getParameter(Costanti.PRODOTTO_ID);			
			Prodotto prodotto = sv.trovaProdottoById(Integer.parseInt(idProdotto)).get(0);			
			req.setAttribute(Costanti.PRODOTTO, prodotto);
			
			
			Utente u = (Utente)req.getSession().getAttribute(Costanti.UTENTE);
			List<Carrello_Prodotto> carrello_Prodotti = sv.findCarrelloProdottiUtente(u);
			
			int disponibilita = prodotto.getQuantita();
			for (Carrello_Prodotto carrello_Prodotto : carrello_Prodotti) {
				if(prodotto.getId()==carrello_Prodotto.getProdotto().getId()) {
					disponibilita -= carrello_Prodotto.getQuantita();
					break;
				}
					
			}
			
			Categoria c = sv.findCategoriaByNome(prodotto.getCategoria().getNome());
			Fornitore f = sv.findFornitoreByNome(prodotto.getFornitore().getNome());
			
			req.setAttribute(Costanti.DISPONIBILITA_PRODOTTO, disponibilita);
			req.setAttribute(Costanti.CATEGORIA, c);
			req.setAttribute(Costanti.FORNITORE, f);
			
			aggiungiImmagine(prodotto, c, f, req);
			
			req.getRequestDispatcher("/Jsp/Prodotto.jsp").forward(req, resp);
			
	
			

		} 	
		
		catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}
	
	public void aggiungiImmagine(Prodotto p, Categoria c, Fornitore f, HttpServletRequest request) throws Exception {
		
		String uploadPath = getServletContext().getRealPath("") + File.separator + Costanti.UPLOAD_DIRECTORY;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		String baseHttpUrl = "Http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
		String imageUrl = "";
		String imageUrlC = "";
		String imageUrlF = "";
		Blob immagine = p.getFoto();
		Blob categoria = c.getLogo();
		Blob fornitore = f.getLogo();		
		if (immagine != null) {
			String filePath = uploadPath + File.separator + p.getId() + "_" + p.getNomeImmagine();			
			BlobConverter.saveFile(immagine, filePath);						
			imageUrl = baseHttpUrl + File.separator + Costanti.UPLOAD_DIRECTORY + File.separator + p.getId() + "_" + p.getNomeImmagine();						
		} else {
				imageUrl = baseHttpUrl + "/Media/NotFound.jpg";
			}
		if(categoria != null) {
			String filePathC = uploadPath + File.separator + c.getId() + "_" + c.getNomeImmagine();
			BlobConverter.saveFile(categoria, filePathC);
			imageUrlC = baseHttpUrl + File.separator + Costanti.UPLOAD_DIRECTORY + File.separator + c.getId() + "_" + c.getNomeImmagine();
		} else {
			imageUrlC = baseHttpUrl + "/Media/NotFound.jpg";
		}
		if(fornitore != null) {
			String filePathF = uploadPath + File.separator + f.getId() + "_" + f.getNomeImmagine();
			BlobConverter.saveFile(fornitore, filePathF);
			imageUrlF = baseHttpUrl + File.separator + Costanti.UPLOAD_DIRECTORY + File.separator + f.getId() + "_" + f.getNomeImmagine();
		} else {
			imageUrlF = baseHttpUrl + "/Media/NotFound.jpg";
		}
		
	
		request.setAttribute(Costanti.FOTO_PRODOTTO, imageUrl);
		request.setAttribute(Costanti.CATEGORIA_LOGO, imageUrlC);
		request.setAttribute(Costanti.FORNITORE_LOGO, imageUrlF);
	}
	
}
