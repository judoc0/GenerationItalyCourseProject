package com.azienda.E_CommerceProva.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Ruolo {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nomeRuolo;
	
	@OneToMany(mappedBy = "ruolo")
	private List<Utente> utenti = new ArrayList<>();
	
	
	public Ruolo() {
		super();
	}


	public Ruolo(String nomeRuolo) {
		super();
		this.nomeRuolo = nomeRuolo;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getNomeRuolo() {
		return nomeRuolo;
	}


	public void setNomeRuolo(String nomeRuolo) {
		this.nomeRuolo = nomeRuolo;
	}


	@Override
	public String toString() {
		return "Ruolo [id=" + id + ", nomeRuolo=" + nomeRuolo + "]";
	}
	
	
	

}
