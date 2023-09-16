package com.azienda.E_CommerceProva.model;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Fornitore {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nome;
	private Blob logo;
	private String nomeImmagine;

	@OneToMany(mappedBy = "fornitore")
	private List<Prodotto> prodotti = new ArrayList<>();
	
	

	public Fornitore() {
		super();
	}

	public Fornitore(String nome, Blob logo, String nomeImmagine) {
		super();
		this.nome = nome;
		this.logo = logo;
		this.nomeImmagine = nomeImmagine;
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

	public Blob getLogo() {
		return logo;
	}

	public void setLogo(Blob logo) {
		this.logo = logo;
	}
	
	public String getNomeImmagine() {
		return nomeImmagine;
	}

	public void setNomeImmagine(String nomeImmagine) {
		this.nomeImmagine = nomeImmagine;
	}

	public List<Prodotto> getProdotti() {
		return prodotti;
	}

	public void setProdotti(List<Prodotto> prodotti) {
		this.prodotti = prodotti;
	}

}
