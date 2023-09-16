package com.azienda.E_CommerceProva.Dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Ordine;
import com.azienda.E_CommerceProva.model.Utente;

public class OrdineDao implements DaoInterface<Ordine>{
	
	private EntityManager manager;

	public OrdineDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Ordine create(Ordine ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Ordine> retrieve() {

		return manager.createQuery("Select c from Ordine c", Ordine.class).getResultList();
	}

	@Override
	public Ordine update(Ordine ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Ordine ref) {
		manager.remove(ref);		
	}

	public List<Ordine> findByIdUtente(Utente idUtente) {
	
		return manager.createQuery("Select c from Ordine c WHERE c.utente =: idUtente", Ordine.class).setParameter("idUtente", idUtente).getResultList();
	}

	public List<Ordine> findByIdOrdine(Integer idOrdine) {
		
		return manager.createQuery("Select c from Ordine c WHERE c.id =: idUtente", Ordine.class).setParameter("idUtente", idOrdine).getResultList();
	}
	
	

}
