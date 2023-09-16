package com.azienda.E_CommerceProva.Dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Categoria;
import com.azienda.E_CommerceProva.model.Fornitore;

public class FornitoreDao implements DaoInterface<Fornitore>{
	
	private EntityManager manager;

	public FornitoreDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Fornitore create(Fornitore ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Fornitore> retrieve() {

		return manager.createQuery("Select c from Fornitore c", Fornitore.class).getResultList();
	}

	@Override
	public Fornitore update(Fornitore ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Fornitore ref) {
		manager.remove(ref);		
	}

	public List<Fornitore> findByNome(String fornitore) {
		return manager.createQuery("Select f from Fornitore f WHERE f.nome = :parNome", Fornitore.class).setParameter("parNome", fornitore).getResultList();
	}

	public List<Fornitore> findById(int id) {
		return manager.createQuery("Select f from Fornitore f WHERE f.id = :parNome", Fornitore.class).setParameter("parNome", id).getResultList();
	}
	
	

}
