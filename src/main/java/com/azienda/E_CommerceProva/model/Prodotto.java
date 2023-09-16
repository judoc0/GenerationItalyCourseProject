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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PreRemove;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
public class Prodotto {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nome;
	private String descrizione;
	private Float prezzo;
	private Integer quantita;
	private Blob foto;
	private String nomeImmagine;
	
	@OneToMany(mappedBy = "prodotto")
	@OnDelete(action = OnDeleteAction.CASCADE)
	private List<Carrello_Prodotto> carrello_Prodotti = new ArrayList<>();
	
	@ManyToOne
	@JoinColumn(name = "Id_Categoria")
	private Categoria categoria;
	
	@ManyToOne
	@JoinColumn(name = "Id_Fornitore")
	private Fornitore fornitore;
	
	@OneToMany(mappedBy = "prodotto", cascade = CascadeType.PERSIST)
	private List<Ordine_Prodotto> ordine_Prodotti = new ArrayList<>();
	

	public Prodotto() {
		super();
	}



	public Prodotto(String nome, String descrizione, Float prezzo, Integer quantita, Blob foto, String nomeImmagine, Categoria categoria,
			Fornitore fornitore) {
		super();
		this.nome = nome;
		this.descrizione = descrizione;
		this.prezzo = prezzo;
		this.quantita = quantita;
		this.foto = foto;
		this.categoria = categoria;
		this.fornitore = fornitore;
		this.foto = foto;
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

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
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

	public Blob getFoto() {
		return foto;
	}

	public void setFoto(Blob foto) {
		this.foto = foto;
	}
	
	


	public List<Ordine_Prodotto> getOrdine_Prodotti() {
		return ordine_Prodotti;
	}



	public void setOrdine_Prodotti(List<Ordine_Prodotto> ordine_Prodotti) {
		this.ordine_Prodotti = ordine_Prodotti;
	}



	public List<Carrello_Prodotto> getCarrello_Prodotti() {
		return carrello_Prodotti;
	}



	public void setCarrello_Prodotti(List<Carrello_Prodotto> carrello_Prodotti) {
		this.carrello_Prodotti = carrello_Prodotti;
	}



	public void setQuantita(Integer quantita) {
		this.quantita = quantita;
	}



	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Fornitore getFornitore() {
		return fornitore;
	}

	public void setFornitore(Fornitore fornitore) {
		this.fornitore = fornitore;
	}


	
	public String getNomeImmagine() {
		return nomeImmagine;
	}



	public void setNomeImmagine(String nomeImmagine) {
		this.nomeImmagine = nomeImmagine;
	}



	@PreRemove
	private void preRemove() {
		ordine_Prodotti.forEach(ordine_Prodotto -> ordine_Prodotto.setProdotto(null));
		
	/*	for (Ordine_Prodotto ordine : ordine_Prodotti) {
			
			ordine.setProdotto(null);
		}*/
		
	}
	

}
