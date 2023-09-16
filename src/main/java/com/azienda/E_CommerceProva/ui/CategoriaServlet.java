package com.azienda.E_CommerceProva.ui;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.model.Categoria;
import com.azienda.E_CommerceProva.utils.BlobConverter;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/Categoria")
public class CategoriaServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			Service sv = (Service) getServletContext().getAttribute(Costanti.SERVICE);

			List<Categoria> categorie = sv.findAllCategorie();

			aggiungiImmaggini(categorie, req);

			req.setAttribute(Costanti.LISTA_CATEGORIE, categorie);

			req.getRequestDispatcher("/Jsp/Categorie.jsp").forward(req, resp);

		}

		catch (Exception e) {

			e.printStackTrace();
			String message = "We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}

	public void aggiungiImmaggini(List<Categoria> prodotti, HttpServletRequest request) throws Exception {

		Map<Integer, String> mappa = new HashMap<>();

		String uploadPath = getServletContext().getRealPath("") + File.separator + Costanti.UPLOAD_DIRECTORY;
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		String baseHttpUrl = "Http://" + request.getServerName() + ":" + request.getServerPort()
				+ request.getContextPath();

		for (Categoria prodotto : prodotti) {
			Blob immagine = prodotto.getLogo();
			if (immagine != null) {
				String filePath = uploadPath + File.separator + prodotto.getId() + "_" + prodotto.getNomeImmagine();
				BlobConverter.saveFile(immagine, filePath);
				String imageUrl = baseHttpUrl + File.separator + Costanti.UPLOAD_DIRECTORY + File.separator
						+ prodotto.getId() + "_" + prodotto.getNomeImmagine();
				mappa.put(prodotto.getId(), imageUrl);
			} else {

				String imageUrl = baseHttpUrl + "/Media/NotFound.jpg";
				mappa.put(prodotto.getId(), imageUrl);
			}
		}

		request.setAttribute(Costanti.MAPPA_FOTO, mappa);

	}
}
