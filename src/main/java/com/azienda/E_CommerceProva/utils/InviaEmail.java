package com.azienda.E_CommerceProva.utils;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.azienda.E_CommerceProva.model.Carrello_Prodotto;

public class InviaEmail {
	
	

	public void inviaEmail(String to, List<Carrello_Prodotto> carrello_Prodottos) {    
	      // Recipient's email ID needs to be mentioned.

	      // Sender's email ID needs to be mentioned
	      String from = "jsanziapis@gmail.com";

	      // Assuming you are sending email from localhost
	      String host = "smtp.gmail.com";

	      // Get system properties
	      Properties properties = System.getProperties();

	      // Setup mail server
	      properties.put("mail.smtp.host", host);
	       properties.put("mail.smtp.port", "465");
	       properties.put("mail.smtp.ssl.enable", "true");
	       properties.put("mail.smtp.auth", "true");

	      // Get the default Session object.
	      Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

	            protected PasswordAuthentication getPasswordAuthentication() {

	                return new PasswordAuthentication("jsanziapis@gmail.com", "boojjuizpjrajdkc");

	            }

	        });

	      try {
	         // Create a default MimeMessage object.
	         MimeMessage message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

	         // Set Subject: header field
	         message.setSubject("GenerationGaming: Ordine elaborato");

	         // Now set the actual message
	      // Creazione del testo dell'email
	         String emailText = "<html><head>"
	         		    + "<link href=\"https://fonts.googleapis.com/css2?family=Roboto&display=swap\" rel=\"stylesheet\">"
	         		    + "</head><body style=\"font-family: Arial, sans-serif;\">"
	        	        + "<h1 style=\"color: #F04027; text-align: center;\">Grazie per aver effettuato un acquisto! <i class=\"fas fa-shopping-cart\"></i></h1>"
	        	        + "<p style=\"color: #333; text-align: center;\">Siamo lieti di averti come nostro cliente. Ecco i dettagli dei prodotti che hai acquistato:</p>"
	        	        + "<table style=\"width:100%; border-collapse: collapse; border: 1px solid #333;\">"
	        	        + "<thead>"
	        	        + "<tr>"
	        	        + "<th style=\"background-color: #F04027; color: #fff; padding: 10px; border: 1px solid #333;\">Prodotto</th>"
	        	        + "<th style=\"background-color: #F04027; color: #fff; padding: 10px; border: 1px solid #333;\">Prezzo Singolo</th>"
	        	        + "<th style=\"background-color: #F04027; color: #fff; padding: 10px; border: 1px solid #333;\">Quantità</th>"
	        	        + "<th style=\"background-color: #F04027; color: #fff; padding: 10px; border: 1px solid #333;\">Subtotale</th>"
	        	        + "</tr>"
	        	        + "</thead>"
	        	        + "<tbody>";

	        	double prezzoTotaleOrdine = 0.0;

	        	for (Carrello_Prodotto carrello_Prodotto : carrello_Prodottos) {
	        	    double subtotale = carrello_Prodotto.getProdotto().getPrezzo() * carrello_Prodotto.getQuantita();

	        	    emailText += "<tr>"
	        	            + "<td style=\"border: 1px solid #333;\">" + carrello_Prodotto.getProdotto().getNome() + "</td>"
	        	            + "<td style=\"border: 1px solid #333; text-align: right\">€" + carrello_Prodotto.getProdotto().getPrezzo() + "</td>"
	        	            + "<td style=\"border: 1px solid #333; text-align: right\">" + carrello_Prodotto.getQuantita() + "</td>"
	        	            + "<td style=\"border: 1px solid #333; text-align: right\">€" + subtotale + "</td>"
	        	            + "</tr>";

	        	    prezzoTotaleOrdine += subtotale;
	        	}

	        	emailText += "<tr>"
	        	        + "<td colspan=\"4\" style=\"height: 20px; border: 1px solid #333; background-color: #F04027; color: #fff; text-align: right;\">Totale</td>"
	        	        + "</tr>"
	        	        + "<tr>"
	        	        + "<td colspan=\"3\" style=\"text-align: right;\">Prezzo Totale dell'Ordine:</td>"
	        	        + "<td style=\"text-align: right\">€" + prezzoTotaleOrdine + "</td>"
	        	        + "</tr>"
	        	        + "</tbody>"
	        	        + "</table>"
	        	        + "<p style=\"color: #333; text-align: center;\">Se hai domande o necessiti di assistenza, non esitare a contattarci.</p>"
	        	        + "<div style=\"text-align: center;\">"
	        	        + "<h1 style=\"font-family: 'Roboto', sans-serif; font-size: 36px; color: black;\"><a href=\"http://localhost:8080/E_CommerceProva/Utente\" style=\"color: black; text-decoration: none;\">Generation<span style=\"color:#f04027;\">Gaming</span></a></h1>"
	        	        + "</div>"
	        	        + "</body></html>";






	        	message.setContent(emailText, "text/html; charset=utf-8");



	         // Send message
	         Transport.send(message);
	         System.out.println("Sent message successfully....");
	      } catch (MessagingException mex) {
	         mex.printStackTrace();
	      }
	   }

}
