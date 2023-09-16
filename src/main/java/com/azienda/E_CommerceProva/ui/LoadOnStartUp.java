package com.azienda.E_CommerceProva.ui;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.azienda.E_CommerceProva.BusinessLogic.Service;
import com.azienda.E_CommerceProva.Dao.CarrelloDao;
import com.azienda.E_CommerceProva.Dao.Carrello_ProdottoDao;
import com.azienda.E_CommerceProva.Dao.CategoriaDao;
import com.azienda.E_CommerceProva.Dao.FornitoreDao;
import com.azienda.E_CommerceProva.Dao.OrdineDao;
import com.azienda.E_CommerceProva.Dao.Ordine_ProdottoDao;
import com.azienda.E_CommerceProva.Dao.ProdottoDao;
import com.azienda.E_CommerceProva.Dao.RuoloDao;
import com.azienda.E_CommerceProva.Dao.UtenteDao;
import com.azienda.E_CommerceProva.model.Carrello;
import com.azienda.E_CommerceProva.model.Ruolo;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
@SuppressWarnings("serial")
@WebServlet(value = "/Init", loadOnStartup = 1)
public class LoadOnStartUp extends HttpServlet {
	@Override
	public void init() throws ServletException {
			EntityManager manager = null;
			try {
				EntityManagerFactory factory = Persistence.createEntityManagerFactory("Paperino");
				manager = factory.createEntityManager();
				System.out.println("Connesione Riuscita!!");
				UtenteDao u = new UtenteDao(manager);
				RuoloDao r = new RuoloDao(manager);
				CarrelloDao c = new CarrelloDao(manager);
				Carrello_ProdottoDao cp = new Carrello_ProdottoDao(manager);
				CategoriaDao ca = new CategoriaDao(manager);
				FornitoreDao f = new FornitoreDao(manager);
				ProdottoDao p = new ProdottoDao(manager);
				OrdineDao o = new OrdineDao(manager);
				Ordine_ProdottoDao op = new Ordine_ProdottoDao(manager);
				
				
				Service sv = new Service(manager, u, r, c, cp, ca, f, o, op, p);
				
			/*	Ruolo ruolo1 = new Ruolo(Costanti.RUOLO_CLIENTE);
				Ruolo ruolo2 = new Ruolo(Costanti.RUOLO_ADMIN);
			
				sv.createRuolo(ruolo1);
				sv.createRuolo(ruolo2);
				//String username, String password, String email, String telefono, String indirizzo
				sv.inserimento("nome1", "cognome1", "1", "1", "jeansanzia@gmail.com", "1", "Lecce","1", Costanti.RUOLO_CLIENTE);
				sv.inserimento("nome2", "cognome2", "2", "2", "2", "2", "Lecce","2", Costanti.RUOLO_ADMIN);
				
				sv.createCategoria("Frutta", null, "frutta");
				sv.createCategoria("Ortaggi", null, "frutta");
				sv.createFornitore("Chiquita", null, "ortaggi");
				sv.createFornitore("Rubati", null, "ortaggi");
				
				sv.createProdotto("Banane", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Pomodori", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Mele", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Pesche", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Pere", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Melanzane", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Patate", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Susine", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Meloni", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Kiwi", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Cocco", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Ananas", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Lamponi", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Fragole", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Ciliegie", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Uva", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Olive", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Arancia", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");
				sv.createProdotto("Melagrana", "Molto Buone", 5f, 200, null, "banane", "Frutta", "Chiquita");
				sv.createProdotto("Mandarino", "Belli succosi", 55f, 155, null, "pomodori", "Ortaggi", "Rubati");*/
							
				getServletContext().setAttribute(Costanti.SERVICE, sv);
								
				
			} catch (Exception e) {
				e.printStackTrace();
				manager.close();
				System.exit(0);
			}
	}
}
