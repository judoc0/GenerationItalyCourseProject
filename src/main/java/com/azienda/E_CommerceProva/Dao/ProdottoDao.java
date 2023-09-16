package com.azienda.E_CommerceProva.Dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Categoria;
import com.azienda.E_CommerceProva.model.Fornitore;
import com.azienda.E_CommerceProva.model.Prodotto;

public class ProdottoDao implements DaoInterface<Prodotto>{

	private EntityManager manager;

	public ProdottoDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Prodotto create(Prodotto ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Prodotto> retrieve() {

		return manager.createQuery("Select p from Prodotto p", Prodotto.class).getResultList();
	}

	@Override
	public Prodotto update(Prodotto ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Prodotto ref) {
		manager.remove(ref);
		
	}

	public List<Prodotto> findByString(String string) {
		
		return manager.createQuery("SELECT c FROM Prodotto c WHERE c.nome LIKE: parNome", Prodotto.class)
				.setParameter("parNome", string)
				.getResultList();
	}
	
	
	public List<Prodotto> findById(Integer id) {
		
		return manager.createQuery("SELECT c FROM Prodotto c WHERE c.id =: parNome", Prodotto.class)
				.setParameter("parNome", id)
				.getResultList();
	}

	public List<Prodotto> findByCategoria(Categoria c) {
		
		return manager.createQuery("SELECT c FROM Prodotto c WHERE c.categoria =: parNome", Prodotto.class)
				.setParameter("parNome", c)
				.getResultList();
	}

	public List<Prodotto> findByFornitore(Fornitore c) {
		
		return manager.createQuery("SELECT c FROM Prodotto c WHERE c.fornitore =: parNome", Prodotto.class)
				.setParameter("parNome", c)
				.getResultList();
	}
	
}
