package com.azienda.E_CommerceProva.model;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Carrello {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nomeCarrello;
	private LocalDateTime date;
	
	@OneToOne
	private Utente utente;

	@OneToMany(mappedBy = "carrello")
	private List<Carrello_Prodotto> carrello_Prodotti = new ArrayList<>();
	
	

	public Carrello() {
		super();
	}

	public Carrello(String nomeCarrello, LocalDateTime date, Utente utente) {
		super();
		this.nomeCarrello = nomeCarrello;
		this.date = date;
		this.utente = utente;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNomeCarrello() {
		return nomeCarrello;
	}

	public void setNomeCarrello(String nomeCarrello) {
		this.nomeCarrello = nomeCarrello;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	

	public List<Carrello_Prodotto> getCarrello_Prodotti() {
		return carrello_Prodotti;
	}

	public void setCarrello_Prodotti(List<Carrello_Prodotto> carrello_Prodotti) {
		this.carrello_Prodotti = carrello_Prodotti;
	}

	@Override
	public String toString() {
		return "Carrello [id=" + id + ", nomeCarrello=" + nomeCarrello + ", date=" + date + ", utente=" + utente + "]";
	}
	
	
}
