package com.azienda.E_CommerceProva.model;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Ordine {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private LocalDateTime date;
	
	@ManyToOne
	@JoinColumn(name = "Id_Utente")
	private Utente utente;
	
	@OneToMany(mappedBy = "ordine")
	private List<Ordine_Prodotto> ordine_Prodotti = new ArrayList<>();
	

	public Ordine() {
		super();
	}


	public Ordine(LocalDateTime date, Utente utente) {
		super();
		this.date = date;
		this.utente = utente;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
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


	public List<Ordine_Prodotto> getOrdine_Prodotti() {
		return ordine_Prodotti;
	}


	public void setOrdine_Prodotti(List<Ordine_Prodotto> ordine_Prodotti) {
		this.ordine_Prodotti = ordine_Prodotti;
	}


	@Override
	public String toString() {
		return "Ordine [id=" + id + ", date=" + date + ", utente=" + utente + ", ordine_Prodotti=" + ordine_Prodotti
				+ "]";
	}


}
