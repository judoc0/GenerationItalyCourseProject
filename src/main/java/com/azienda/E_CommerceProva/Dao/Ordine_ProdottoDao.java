package com.azienda.E_CommerceProva.Dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Ordine;
import com.azienda.E_CommerceProva.model.Ordine_Prodotto;
import com.azienda.E_CommerceProva.model.Prodotto;

public class Ordine_ProdottoDao implements DaoInterface<Ordine_Prodotto>{
	
	private EntityManager manager;

	public Ordine_ProdottoDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Ordine_Prodotto create(Ordine_Prodotto ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Ordine_Prodotto> retrieve() {

		return manager.createQuery("Select c from Ordine_Prodotto c", Ordine_Prodotto.class).getResultList();
	}

	@Override
	public Ordine_Prodotto update(Ordine_Prodotto ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Ordine_Prodotto ref) {
		manager.remove(ref);		
	}

	public List<Ordine_Prodotto> findByIdProdotto(Prodotto id) {
		
		return manager.createQuery("Select c from Ordine_Prodotto c WHERE c.prodotto = :id", Ordine_Prodotto.class).setParameter("id", id).getResultList();
	}

	public List<Ordine_Prodotto> findByIdOrdine(Ordine id) {
		
		return manager.createQuery("Select c from Ordine_Prodotto c WHERE c.ordine = :id", Ordine_Prodotto.class).setParameter("id", id).getResultList();
	}
	
	

}
