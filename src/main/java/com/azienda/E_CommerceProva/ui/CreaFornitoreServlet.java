package com.azienda.E_CommerceProva.ui;

import java.io.File;
import java.io.IOException;
import java.sql.Blob;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Excption.CategoriaGiaEsistenteException;
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
@WebServlet("/CreaFornitore")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,maxFileSize = 1024 * 1024 * 10,maxRequestSize = 1024 * 1024 * 10 * 5)
public class CreaFornitoreServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Service sv = (Service)getServletContext().getAttribute(Costanti.SERVICE);
			
			String nome = req.getParameter(Costanti.FORNITORE_NOME);
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
		
			sv.createFornitore(nome, immagine, nomeImmagine);
	
			
			req.getRequestDispatcher("/Fornitore").forward(req, resp);
								
			
		}catch (CategoriaGiaEsistenteException e) {

			e.printStackTrace();		
			req.setAttribute(Costanti.MESSAGE_KEY, e.getMessage());
			req.getRequestDispatcher("/Jsp/CreaFornitore.jsp").forward(req, resp);
			
		} catch (Exception e) {

			e.printStackTrace();
			String message ="We cumpa Jean MIO PADRE <3";
			req.setAttribute(Costanti.MESSAGE_KEY, message);
			req.getRequestDispatcher("/Jsp/Login.jsp").forward(req, resp);
		}
	}	
}
