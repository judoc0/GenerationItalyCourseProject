package com.azienda.E_CommerceProva.BusinessLogic;

import java.sql.Blob;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.exception.ConstraintViolationException;

import com.azienda.E_CommerceProva.Dao.CarrelloDao;
import com.azienda.E_CommerceProva.Dao.Carrello_ProdottoDao;
import com.azienda.E_CommerceProva.Dao.CategoriaDao;
import com.azienda.E_CommerceProva.Dao.FornitoreDao;
import com.azienda.E_CommerceProva.Dao.OrdineDao;
import com.azienda.E_CommerceProva.Dao.Ordine_ProdottoDao;
import com.azienda.E_CommerceProva.Dao.ProdottoDao;
import com.azienda.E_CommerceProva.Dao.RuoloDao;
import com.azienda.E_CommerceProva.Dao.UtenteDao;
import com.azienda.E_CommerceProva.Excption.CampiVuotiNonAmmessiException;
import com.azienda.E_CommerceProva.Excption.CategoriaGiaEsistenteException;
import com.azienda.E_CommerceProva.Excption.CategoriaNonVuotaException;
import com.azienda.E_CommerceProva.Excption.EmailGiaEsistenteException;
import com.azienda.E_CommerceProva.Excption.FornitoreGiaEsistenteException;
import com.azienda.E_CommerceProva.Excption.FornitoreNonVuotoException;
import com.azienda.E_CommerceProva.Excption.PrezzoNegativoException;
import com.azienda.E_CommerceProva.Excption.PwErrataException;
import com.azienda.E_CommerceProva.Excption.QuantitaNegativaException;
import com.azienda.E_CommerceProva.Excption.UsernameGiaEsistenteException;
import com.azienda.E_CommerceProva.Excption.UtenteInesistenteException;
import com.azienda.E_CommerceProva.model.Carrello;
import com.azienda.E_CommerceProva.model.Carrello_Prodotto;
import com.azienda.E_CommerceProva.model.Categoria;
import com.azienda.E_CommerceProva.model.Fornitore;
import com.azienda.E_CommerceProva.model.Ordine;
import com.azienda.E_CommerceProva.model.Ordine_Prodotto;
import com.azienda.E_CommerceProva.model.Prodotto;
import com.azienda.E_CommerceProva.model.Ruolo;
import com.azienda.E_CommerceProva.model.Utente;
import com.azienda.E_CommerceProva.utils.Costanti;
import com.azienda.E_CommerceProva.utils.InviaEmail;

public class Service {
	private EntityManager manager;
	private UtenteDao utenteDao;
	private RuoloDao ruoloDao;
	private CarrelloDao carrelloDao;
	private Carrello_ProdottoDao carrello_ProdottoDao;
	private CategoriaDao categoriaDao;
	private FornitoreDao fornitoreDao;
	private OrdineDao ordineDao;
	private Ordine_ProdottoDao ordine_ProdottoDao;
	private ProdottoDao prodottoDao;

	public Service(EntityManager manager, UtenteDao utenteDao, RuoloDao ruoloDao, CarrelloDao carrelloDao,
			Carrello_ProdottoDao carrello_ProdottoDao, CategoriaDao categoriaDao, FornitoreDao fornitoreDao,
			OrdineDao ordineDao, Ordine_ProdottoDao ordine_ProdottoDao, ProdottoDao prodottoDao) {
		super();
		this.manager = manager;
		this.utenteDao = utenteDao;
		this.ruoloDao = ruoloDao;
		this.carrelloDao = carrelloDao;
		this.carrello_ProdottoDao = carrello_ProdottoDao;
		this.categoriaDao = categoriaDao;
		this.fornitoreDao = fornitoreDao;
		this.ordineDao = ordineDao;
		this.ordine_ProdottoDao = ordine_ProdottoDao;
		this.prodottoDao = prodottoDao;
	}

	public void inserimento(String nome, String cognome, String username, String password, String email, String telefono, String citta, String indirizzo, String r)
			throws Exception {
		try {
			manager.getTransaction().begin();
			if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()
					|| email == null || email.trim().isEmpty() || telefono == null || telefono.trim().isEmpty()
					|| indirizzo == null || indirizzo.trim().isEmpty()) {
				throw new CampiVuotiNonAmmessiException("Campi vuoti non ammessi", null);
			}

			List<Utente> utentiUser = utenteDao.findByUsername(username);
			if (utentiUser.size() > 0) {
				throw new UsernameGiaEsistenteException("L'username \"" + username + "\" è gia' in uso.", null);
			}
	      /*List<Utente> utentiEmail = utenteDao.findByEmail(email);
			if (utentiEmail.size() > 0) {
				throw new EmailGiaEsistenteException("L'email: " + email + " gia' esistente!", null);
			}*/

			Ruolo ruolo = ruoloDao.findByNome(r).get(0);

			Utente u = new Utente(nome, cognome, username, password, email, telefono, citta,indirizzo, ruolo);
			utenteDao.create(u);

			Carrello carrello = new Carrello("Carrello_" + username, LocalDateTime.now(), u);
			carrelloDao.create(carrello);

			manager.getTransaction().commit();

		} catch (Exception e) {

			manager.getTransaction().rollback();
			throw e;
		}
	}

	public Utente login(String username, String password) throws Exception {
		try {
			manager.getTransaction().begin();

			List<Utente> utenti = utenteDao.findByUsername(username);
			if (utenti.isEmpty()) {
				throw new UtenteInesistenteException("L'utente non esiste", null);
			}

			utenti = utenteDao.checkPassword(username, password);
			if (utenti.isEmpty()) {
				throw new PwErrataException("Password sbagliata :(", null);
			}

			Utente u = utenti.get(0);

			Carrello carrello = carrelloDao.findByUtente(u).get(0);

			u.setCarrello(carrello);

			manager.getTransaction().commit();
			return u;
		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
	}

	public List<Utente> findAllUtenti() {

		try {

			manager.getTransaction().begin();

			List<Utente> utenti = utenteDao.retrieve();

			manager.getTransaction().commit();

			return utenti;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}

	public void createProdotto(String nome, String descrizione, Float prezzo, Integer quantita, Blob foto, String nomeImmagine,
			String categoria, String fornitore) {

		try {
			manager.getTransaction().begin();

			if (nome == null || nome.trim().isEmpty() || prezzo == null || quantita == null) {
				throw new CampiVuotiNonAmmessiException("Campi vuoti non ammessi", null);
			}

			if (prezzo < 0) {
				throw new PrezzoNegativoException("Prezzo negativo non ammesso", null);
			}

			if (quantita < 0) {
				throw new QuantitaNegativaException("Quantità negativa non ammessa", null);
			}

			Categoria c;
			List<Categoria> listaCat = categoriaDao.findByNome(categoria);
			if (!listaCat.isEmpty()) {
				c = listaCat.get(0);
			} else {
				c = null;
			}
			
			Fornitore f;
			List<Fornitore> listaFor = fornitoreDao.findByNome(fornitore);
			if (!listaFor.isEmpty()) {
				f = listaFor.get(0);
			} else {
				f = null;
			}

			Prodotto p = new Prodotto(nome, descrizione, prezzo, quantita, foto, nomeImmagine, c, f);

			prodottoDao.create(p);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
		}

	}

	public void updateProdotto(Integer id, String nome, Float prezzo, String descrizione, Integer disponibilita, String categoria, String fornitore, Blob foto, String nomeImmagine) {

		try {
			manager.getTransaction().begin();

			if (nome == null || nome.trim().isEmpty() || prezzo == null
					|| disponibilita == null) {
				throw new CampiVuotiNonAmmessiException("Campi vuoti non ammessi", null);
			}

			if (prezzo < 0) {
				throw new PrezzoNegativoException("Prezzo negativo non ammesso", null);
			}

			if (disponibilita < 0) {
				throw new QuantitaNegativaException("Quantità negativa non ammessa", null);
			}
			
			Prodotto p = prodottoDao.findById(id).get(0);
			p.setNome(nome);
			p.setPrezzo(prezzo);
			p.setDescrizione(descrizione);
			p.setQuantita(disponibilita);
			
			List<Categoria> listaCategorias = categoriaDao.findByNome(categoria);
			List<Fornitore> listFornitores = fornitoreDao.findByNome(fornitore);
			
			if (listaCategorias.size() > 0) {
				p.setCategoria(listaCategorias.get(0));
			}
			
			if (listFornitores. size() > 0) {
				p.setFornitore(listFornitores.get(0));
			}
			
			if (foto != null) {	
				p.setFoto(foto);
				p.setNomeImmagine(nomeImmagine);
			} 
	
			prodottoDao.update(p);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
		}

	}

	public void deleteProdotto(Prodotto p) {

		try {
			manager.getTransaction().begin();
			
			List<Ordine_Prodotto> ordine_Prodottos = ordine_ProdottoDao.findByIdProdotto(p);
			for (Ordine_Prodotto ordine_Prodotto : ordine_Prodottos) {
				ordine_Prodotto.setProdotto(null);
				ordine_ProdottoDao.update(ordine_Prodotto);
			}
			
			prodottoDao.delete(p);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
		} 

	}

	public List<Ordine> findAllOrdini() {

		try {

			manager.getTransaction().begin();

			List<Ordine> ordini = ordineDao.retrieve();

			manager.getTransaction().commit();

			return ordini;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}

	public List<Categoria> findAllCategorie() {

		try {

			manager.getTransaction().begin();

			List<Categoria> categorie = categoriaDao.retrieve();

			manager.getTransaction().commit();

			return categorie;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}

	public List<Fornitore> findAllFornitori() {

		try {

			manager.getTransaction().begin();

			List<Fornitore> fornitori = fornitoreDao.retrieve();

			manager.getTransaction().commit();

			return fornitori;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}

	public List<Ordine> findOrdiniByIdUtente(Utente idUtente) {

		try {

			manager.getTransaction().begin();

			List<Ordine> ordini = ordineDao.findByIdUtente(idUtente);

			manager.getTransaction().commit();

			return ordini;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}
	
	public Ordine findOrdineByIdOrdine(int idOrdine) {

		try {

			manager.getTransaction().begin();

			Ordine ordine = ordineDao.findByIdOrdine(idOrdine).get(0);

			manager.getTransaction().commit();

			return ordine;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}
	
	public List<Ordine_Prodotto> findOrdiniByIdOrdine(Integer idOrdine) {

		try {

			manager.getTransaction().begin();
			
			Ordine ordine = ordineDao.findByIdOrdine(idOrdine).get(0);

			List<Ordine_Prodotto> ordine_Prodottos = ordine_ProdottoDao.findByIdOrdine(ordine);

			manager.getTransaction().commit();

			return ordine_Prodottos;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}
	
	public List<Ordine_Prodotto> findAllOrdine_Prodotti() {

		try {

			manager.getTransaction().begin();;

			List<Ordine_Prodotto> ordine_Prodottos = ordine_ProdottoDao.retrieve();

			manager.getTransaction().commit();

			return ordine_Prodottos;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}

	public List<Prodotto> findAllProdotti() {

		try {

			manager.getTransaction().begin();

			List<Prodotto> prodotti = prodottoDao.retrieve();

			manager.getTransaction().commit();

			return prodotti;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}

	}

	public List<Prodotto> trovaProdottoByStringa(String stringa) {
		try {

			manager.getTransaction().begin();

			List<Prodotto> prodotti = prodottoDao.findByString("%" + stringa + "%");

			manager.getTransaction().commit();

			return prodotti;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
	}
	
	public List<Prodotto> trovaProdottoById(Integer id) {
		try {

			manager.getTransaction().begin();

			List<Prodotto> prodotti = prodottoDao.findById(id);

			manager.getTransaction().commit();

			return prodotti;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
	}

	public void addCarrello_Prodotto(Utente u, Prodotto p, Integer q) throws Exception {
		try {

			manager.getTransaction().begin();

			Carrello car = carrelloDao.findByUtente(u).get(0);

			Carrello_Prodotto cp = new Carrello_Prodotto(car, p, q);

			List<Carrello_Prodotto> carrello = carrello_ProdottoDao.findByCarrello(car);

			Integer numero = q;

			boolean exists = false;

			for (Carrello_Prodotto carrello_Prodotto : carrello) {
				if (carrello_Prodotto.getProdotto().getId() == p.getId()) {
					numero = carrello_Prodotto.getQuantita() + q;
					carrello_Prodotto.setQuantita(numero);
					carrello_ProdottoDao.update(carrello_Prodotto);
					exists = true;
				}
			}

			if (exists == false)
				carrello_ProdottoDao.create(cp);

			/*
			 * if (p.getQuantita() - numero < 0) { throw new
			 * DisponibilitàNegativaException("Non ci sono abbastanza prodotti", null); }
			 */

			// p.setQuantita(p.getQuantita() - q);
			// prodottoDao.update(p);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}

	public void removeCarrello_Prodotto(Integer id) {
		try {

			manager.getTransaction().begin();
			
			Carrello_Prodotto c = carrello_ProdottoDao.findbyId(id).get(0);

			carrello_ProdottoDao.delete(c);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}

	public void updateQCarrello_Prodotto(Carrello_Prodotto c, Integer q) {
		try {

			manager.getTransaction().begin();

			c.setQuantita(q);

			carrello_ProdottoDao.update(c);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}

	public void acquisto(List<Carrello_Prodotto> carrello_Prodotti, Utente u) {
		try {

			manager.getTransaction().begin();

			Ordine ordine = new Ordine(LocalDateTime.now(), u);
			ordineDao.create(ordine);

			for (Carrello_Prodotto c : carrello_Prodotti) {
				Ordine_Prodotto ordine_Prodotto = new Ordine_Prodotto(c.getProdotto().getPrezzo(), c.getQuantita(), ordine, c.getProdotto(), c.getProdotto().getNome());
				ordine_ProdottoDao.create(ordine_Prodotto);

				ordine_Prodotto.getProdotto()
						.setQuantita(ordine_Prodotto.getProdotto().getQuantita() - c.getQuantita());
				prodottoDao.update(ordine_Prodotto.getProdotto());

				carrello_ProdottoDao.delete(c);
			}

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}

	public Integer numeroAcquistoProdotto(Prodotto p) {

		try {

			manager.getTransaction().begin();

			List<Ordine_Prodotto> lista = ordine_ProdottoDao.findByIdProdotto(p);

			Integer numero = 0;

			if (lista.size() > 0) {
				numero = lista.size();
			}

			manager.getTransaction().commit();

			return numero;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}
	
	public List<Ordine_Prodotto> findProdottiByOrdine(List<Ordine> p) {

		try {

			manager.getTransaction().begin();

			List<Ordine_Prodotto> lista = new ArrayList<>();
			for (Ordine ordine : p) {
				List<Ordine_Prodotto> ordine_Prodottos = ordine_ProdottoDao.findByIdOrdine(ordine);
				for (Ordine_Prodotto ordine_Prodotto : ordine_Prodottos) {
					lista.add(ordine_Prodotto);
				}
			}
			
			manager.getTransaction().commit();

			return lista;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}

	public Float spesaOrdine(Ordine o) {

		try {

			manager.getTransaction().begin();

			List<Ordine_Prodotto> lista = ordine_ProdottoDao.findByIdOrdine(o);

			Float spesa = 0f;

			for (Ordine_Prodotto ordine_Prodotto : lista) {

				spesa += ordine_Prodotto.getPrezzo();
			}

			manager.getTransaction().commit();

			return spesa;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
	}

	public List<Carrello_Prodotto> findCarrelloProdottiUtente(Utente utente) {

		try {
			manager.getTransaction().begin();

			Carrello carrello = carrelloDao.findByUtente(utente).get(0);

			List<Carrello_Prodotto> cp = carrello_ProdottoDao.findByCarrello(carrello);

			manager.getTransaction().commit();

			return cp;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}

	public void removeQuantitaFromCarrello(Carrello_Prodotto carrello_Prodotto, Integer q) {

		try {

			manager.getTransaction().begin();

			if (carrello_Prodotto.getQuantita() - q == 0) {
				carrello_ProdottoDao.delete(carrello_Prodotto);
			} else {
				carrello_Prodotto.setQuantita(carrello_Prodotto.getQuantita() - q);
				carrello_ProdottoDao.update(carrello_Prodotto);
			}

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}

	public void sendEmail(Utente u, List<Carrello_Prodotto> carrello_Prodottos) {
		try {

			InviaEmail invia = new InviaEmail();

			invia.inviaEmail(u.getEmail(), carrello_Prodottos);

		} catch (Exception e) {
			throw e;
		}
	}

	public void createCategoria(String nome, Blob foto, String nomeImmagine) throws Exception {

		try {

			manager.getTransaction().begin();

			List<Categoria> lista = categoriaDao.findByNome(nome);
			if (lista.size() > 0) {
				throw new CategoriaGiaEsistenteException("La categoria: " + nome + "è gia' esistente!", null);
			}

			Categoria categoria = new Categoria(nome, foto, nomeImmagine);

			categoriaDao.create(categoria);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}
	
	public void createFornitore(String nome, Blob foto, String nomeImmagine) throws Exception {

		try {

			manager.getTransaction().begin();

			List<Fornitore> lista = fornitoreDao.findByNome(nome);
			if (lista.size() > 0) {
				throw new FornitoreGiaEsistenteException("La fornitore: " + nome + "è gia' esistente!", null);
			}

			Fornitore fornitore = new Fornitore(nome, foto, nomeImmagine);

			fornitoreDao.create(fornitore);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}
	
	public void createRuolo(Ruolo r){

		try {

			manager.getTransaction().begin();

			ruoloDao.create(r);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
		}

	}

	public void deleteCategoria(Categoria c) throws CategoriaNonVuotaException{

		try {

			manager.getTransaction().begin();
			
			List<Prodotto> listaProdotti = prodottoDao.findByCategoria(c);
			
			if (listaProdotti.size() > 0) {
				throw new CategoriaNonVuotaException("Non puoi eliminare una categoria con dei prodotti presenti in essa. Ci sono " + listaProdotti.size() + " prodotti nella categoria " + c.getNome(), null);
			} else {
				categoriaDao.delete(c);
			}

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}
	
	public void deleteFornitore(Fornitore c)throws FornitoreNonVuotoException{

		try {

			manager.getTransaction().begin();
			
			List<Prodotto> listaProdotti = prodottoDao.findByFornitore(c);
			
			if (listaProdotti.size() > 0) {
				throw new FornitoreNonVuotoException("Non puoi eliminare un fornitore con i suoi prodotti presenti in catalogo. Ci sono " + listaProdotti.size() + " prodotti del fornitore " + c.getNome(), null);
			} else {
				fornitoreDao.delete(c);
			}

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}

	}
	
	public Categoria findCategoriaByNome(String nome){

		try {

			manager.getTransaction().begin();

			Categoria c = categoriaDao.findByNome(nome).get(0);

			manager.getTransaction().commit();
			
			return c;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
		
	}
	
	public Categoria findCategoriaById(int id){

		try {

			manager.getTransaction().begin();

			Categoria c = categoriaDao.findById(id).get(0);

			manager.getTransaction().commit();
			
			return c;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
		
	}
	
	public Fornitore findFornitoreByNome(String nome){

		try {

			manager.getTransaction().begin();

			Fornitore c = fornitoreDao.findByNome(nome).get(0);

			manager.getTransaction().commit();
			
			return c;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
		
	}
	
	public Fornitore findFornitoreById(int id){

		try {

			manager.getTransaction().begin();

			Fornitore c = fornitoreDao.findById(id).get(0);

			manager.getTransaction().commit();
			
			return c;

		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
		
	}
	
	public void updateCategoria(int id, String nome, Blob foto, String nomeImmagine) {

		try {
			manager.getTransaction().begin();
			
			if (nome == null || nome.trim().isEmpty()) {
				throw new CampiVuotiNonAmmessiException("Campi vuoti non ammessi", null);
			}
			
			
			List<Categoria> categorias = categoriaDao.findByNome(nome);
			if (categorias.size()>0) {
				if (categorias.get(0).getId() != id) {
					throw new CategoriaGiaEsistenteException("La categoria esiste già", null);
				}			
			}
			
			Categoria c = categoriaDao.findById(id).get(0);
			
			c.setNome(nome);
			c.setLogo(foto);
			c.setNomeImmagine(nomeImmagine);

			categoriaDao.update(c);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
		}

	}
	
	public void updateFornitore(int id, String nome, Blob foto, String nomeImmagine) {

		try {
			manager.getTransaction().begin();
			
			if (nome == null || nome.trim().isEmpty()) {
				throw new CampiVuotiNonAmmessiException("Campi vuoti non ammessi", null);
			}
			
			
			List<Fornitore> categorias = fornitoreDao.findByNome(nome);
			if (categorias.size()>0) {
				if (categorias.get(0).getId() != id) {
					throw new FornitoreGiaEsistenteException("Il fornitore esiste già", null);
				}			
			}
			
			Fornitore c = fornitoreDao.findById(id).get(0);
			
			c.setNome(nome);
			c.setLogo(foto);
			c.setNomeImmagine(nomeImmagine);

			fornitoreDao.update(c);

			manager.getTransaction().commit();

		} catch (Exception e) {
			manager.getTransaction().rollback();
		}

	}

}
