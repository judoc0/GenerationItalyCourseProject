package com.azienda.E_CommerceProva.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PreRemove;

@Entity
public class Ordine_Prodotto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nome;
	private Float prezzo;
	private Integer quantita;
	
	@ManyToOne
	@JoinColumn(name = "Id_Ordine")
	private Ordine ordine;
	
	@ManyToOne
	@JoinColumn(name = "Id_Prodotto")
	private Prodotto prodotto;
	
	
	
	public Ordine_Prodotto() {
		super();
	}

	public Ordine_Prodotto(Float prezzo, Integer quantita, Ordine ordine, Prodotto prodotto, String nome) {
		super();
		this.prezzo = prezzo;
		this.quantita = quantita;
		this.ordine = ordine;
		this.prodotto = prodotto;
		this.nome = nome;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}
	

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Float getPrezzo() {
		return prezzo;
	}


	public void setPrezzo(Float prezzo) {
		this.prezzo = prezzo;
	}


	public Integer getQuantita() {
		return quantita;
	}


	public void setQuantita(Integer quantita) {
		this.quantita = quantita;
	}
	
	


	public Ordine getOrdine() {
		return ordine;
	}





	public void setOrdine(Ordine ordine) {
		this.ordine = ordine;
	}





	public Prodotto getProdotto() {
		return prodotto;
	}





	public void setProdotto(Prodotto prodotto) {
		this.prodotto = prodotto;
	}

	


	public String getDisponibile() {
		return prodotto == null ? " - Prodotto non disponibile" : "";
	}


	@Override
	public String toString() {
		return "Ordine_Prodotto [id=" + id + ", prezzo=" + prezzo + ", quantita=" + quantita + "]";
	}


}
