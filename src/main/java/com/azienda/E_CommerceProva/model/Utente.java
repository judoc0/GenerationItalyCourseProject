package com.azienda.E_CommerceProva.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Utente {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String nome;
	private String cognome;
	private String username;
	private String password;
	private String email;
	private String telefono;
	private String citta;
	private String indirizzo;

	@ManyToOne
	@JoinColumn(name = "Id_Ruolo")
	private Ruolo ruolo;

	@OneToOne(mappedBy = "utente")
	private Carrello carrello;

	@OneToMany(mappedBy = "utente")
	private List<Ordine> ordini = new ArrayList<>();

	public Utente() {
		super();
	}

	public Utente(String nome, String cognome, String username, String password, String email, String telefono,
			String citta, String indirizzo, Ruolo ruolo) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.password = password;
		this.email = email;
		this.telefono = telefono;
		this.citta = citta;
		this.indirizzo = indirizzo;
		this.ruolo = ruolo;
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

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public Ruolo getRuolo() {
		return ruolo;
	}

	public void setRuolo(Ruolo ruolo) {
		this.ruolo = ruolo;
	}

	public Carrello getCarrello() {
		return carrello;
	}

	public void setCarrello(Carrello carrello) {
		this.carrello = carrello;
	}

	public List<Ordine> getOrdini() {
		return ordini;
	}

	public void setOrdini(List<Ordine> ordini) {
		this.ordini = ordini;
	}

	public Utente(Integer id, String username, String password, String email, String telefono, String indirizzo,
			Ruolo ruolo, Carrello carrello, List<Ordine> ordini) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.telefono = telefono;
		this.indirizzo = indirizzo;
		this.ruolo = ruolo;
		this.carrello = carrello;
		this.ordini = ordini;
	}

}
