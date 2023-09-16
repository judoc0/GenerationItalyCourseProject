package com.azienda.E_CommerceProva.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

@Entity
public class Carrello_Prodotto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	@ManyToOne
	@JoinColumn(name = "Id_Carrello")
	private Carrello carrello;
	
	@ManyToOne
	@JoinColumn(name = "Id_Prodotto")
	private Prodotto prodotto;
	
	private Integer quantita;
	
	public Carrello_Prodotto() {
		super();
	}


	public Carrello_Prodotto(Carrello carrello, Prodotto prodotto, Integer quantita) {
		super();
		this.carrello = carrello;
		this.prodotto = prodotto;
		this.quantita = quantita;
	}



	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Integer getQuantita() {
		return quantita;
	}


	public void setQuantita(Integer quantita) {
		this.quantita = quantita;
	}
	

	public Carrello getCarrello() {
		return carrello;
	}


	public void setCarrello(Carrello carrello) {
		this.carrello = carrello;
	}


	public Prodotto getProdotto() {
		return prodotto;
	}


	public void setProdotto(Prodotto prodotto) {
		this.prodotto = prodotto;
	}


	@Override
	public String toString() {
		return "Carrello_Prodotto [id=" + id + ", carrello=" + carrello + ", prodotto=" + prodotto + ", quantita="
				+ quantita + "]";
	}


	
	
	
	
	
}
