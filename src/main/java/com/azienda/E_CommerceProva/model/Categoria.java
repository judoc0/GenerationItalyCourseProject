package com.azienda.E_CommerceProva.model;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;

@Entity
public class Categoria {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nome;
	private Blob logo;
	private String nomeImmagine;
	
	@OneToMany(mappedBy = "categoria", cascade = CascadeType.PERSIST)
	private List<Prodotto> prodotti = new ArrayList<>();

	public Categoria() {
		super();
	}

	public Categoria(String nome, Blob logo, String nomeImmagine) {
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

	public List<Prodotto> getProdotti() {
		return prodotti;
	}

	public void setProdotti(List<Prodotto> prodotti) {
		this.prodotti = prodotti;
	}
	
	

	
	public String getNomeImmagine() {
		return nomeImmagine;
	}

	public void setNomeImmagine(String nomeImmagine) {
		this.nomeImmagine = nomeImmagine;
	}

	@PreRemove
	private void preRemove() {
		prodotti.forEach(prodotto -> prodotto.setCategoria(null));
		
	/*	for (Ordine_Prodotto ordine : ordine_Prodotti) {
			
			ordine.setProdotto(null);
		}*/
		
	}
	

}
