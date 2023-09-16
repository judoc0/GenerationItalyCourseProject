package com.azienda.E_CommerceProva.Dao;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Categoria;

public class CategoriaDao implements DaoInterface<Categoria>{
	
	private EntityManager manager;

	public CategoriaDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Categoria create(Categoria ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Categoria> retrieve() {

		return manager.createQuery("Select c from Categoria c", Categoria.class).getResultList();
	}

	@Override
	public Categoria update(Categoria ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Categoria ref) {
		manager.remove(ref);		
	}

	public List<Categoria> findByNome(String categoria) {
		return manager.createQuery("Select c from Categoria c WHERE c.nome = :parNome", Categoria.class).setParameter("parNome", categoria).getResultList();
	}

	public List<Categoria> findById(int id) {
		return manager.createQuery("Select c from Categoria c WHERE c.id = :parNome", Categoria.class).setParameter("parNome", id).getResultList();
	}
	
	

}
