package com.azienda.E_CommerceProva.Dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Carrello;
import com.azienda.E_CommerceProva.model.Utente;

public class CarrelloDao implements DaoInterface<Carrello>{
	
	private EntityManager manager;

	public CarrelloDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Carrello create(Carrello ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Carrello> retrieve() {

		return manager.createQuery("Select c from Carrello c", Carrello.class).getResultList();
	}

	@Override
	public Carrello update(Carrello ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Carrello ref) {
		manager.remove(ref);		
	}

	public List<Carrello> findByUtente(Utente id) {
		
		return manager.createQuery("Select c from Carrello c WHERE c.utente = :id", Carrello.class).setParameter("id", id).getResultList();
	}
	
	

}
