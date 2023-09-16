package com.azienda.E_CommerceProva.Dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Ruolo;

public class RuoloDao implements DaoInterface<Ruolo> {
	private EntityManager manager;


	public RuoloDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Ruolo create(Ruolo ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Ruolo> retrieve() {
		return manager.createQuery("Select u from Ruolo u", Ruolo.class).getResultList();
	}

	@Override
	public Ruolo update(Ruolo ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Ruolo ref) {
		manager.remove(ref);

	}
	public List<Ruolo> findByNome(String nome){
	return manager.createQuery("Select u from Ruolo u where u.nomeRuolo=:parNome", Ruolo.class)
		.setParameter("parNome", nome).getResultList();
	}
}
