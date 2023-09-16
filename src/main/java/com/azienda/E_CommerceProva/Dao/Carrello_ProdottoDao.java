package com.azienda.E_CommerceProva.Dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Carrello;
import com.azienda.E_CommerceProva.model.Carrello_Prodotto;
import com.azienda.E_CommerceProva.model.Prodotto;

public class Carrello_ProdottoDao implements DaoInterface<Carrello_Prodotto>{

	private EntityManager manager;

	public Carrello_ProdottoDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Carrello_Prodotto create(Carrello_Prodotto ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Carrello_Prodotto> retrieve() {

		return manager.createQuery("Select p from Carrello_Prodotto p", Carrello_Prodotto.class).getResultList();
	}

	@Override
	public Carrello_Prodotto update(Carrello_Prodotto ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Carrello_Prodotto ref) {
		manager.remove(ref);
		
	}

	public List<Carrello_Prodotto> findByCarrello(Carrello id) {
		
		return manager.createQuery("Select p from Carrello_Prodotto p WHERE p.carrello = :parCarrello", Carrello_Prodotto.class).setParameter("parCarrello", id).getResultList();
	}

	public List<Carrello_Prodotto> findbyId(Integer id) {
		
		return manager.createQuery("Select p from Carrello_Prodotto p WHERE p.id = :parCarrello", Carrello_Prodotto.class).setParameter("parCarrello", id).getResultList();
	}
	
	
}
