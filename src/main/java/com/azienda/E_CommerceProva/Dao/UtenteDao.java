package com.azienda.E_CommerceProva.Dao;

import java.util.List;

import javax.persistence.EntityManager;

import com.azienda.E_CommerceProva.model.Utente;

public class UtenteDao implements DaoInterface<Utente> {
	private EntityManager manager;


	public UtenteDao(EntityManager manager) {
		super();
		this.manager = manager;
	}

	@Override
	public Utente create(Utente ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public List<Utente> retrieve() {
		return manager.createQuery("Select u from Utente u", Utente.class).getResultList();
	}

	@Override
	public Utente update(Utente ref) {
		manager.persist(ref);
		return ref;
	}

	@Override
	public void delete(Utente ref) {
		manager.remove(ref);

	}
	public List<Utente> findByUsername(String username){
	return manager.createQuery("Select u from Utente u where u.username=:parUsername", Utente.class)
		.setParameter("parUsername", username).getResultList();
	}
	public List<Utente> findByEmail(String email){
		return manager.createQuery("Select u from Utente u where u.email=:parEmail", Utente.class)
			.setParameter("parEmail", email).getResultList();
		}
	public List<Utente> checkPassword(String username, String password){
		return manager.createQuery("Select u from Utente u where u.username=:parUsername AND"
				+ " u.password=:parPassword", Utente.class).setParameter("parUsername", username)
				.setParameter("parPassword", password).getResultList();
	}
}
