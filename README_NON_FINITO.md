# README NON FINITO
## Repository per il corso Java di Generation Italy 2023

 Generation Italy - corso per Junior Java Developer

 Project Work finale 

---------------------------------------------------------------------------------------------------

### Descrizione generale


Realizzare una web application «CatalogoProdotti» di gestione di prodotti, memorizzati su database:
* che presenti pagine Jsp pubbliche di carattere puramente informativo accessibili a qualsiasi utente, nonché le pagine per la login e per la registrazione al sito
* che presenti pagine Jsp private: il cui accesso sia «controllato» da un filtro e consentito solo agli utenti loggati che consentano a tutti gli utenti loggati, indipendentemente dal loro profilo, di ricercare i prodotti presenti su di un database, aggiungerli/rimuoverli al/dal carrello e comprarli (simulazione)
* che consentano, ai solo utenti loggati con profilo di amministratore, di creare/modificare/cancellare prodotti sul database e di visualizzare tutti gli utenti registrati sul sito


Per ulteriori informazioni rigurardo i requisiti dell Project Work andare a vedere il file pdf [Traccia_elaborato_software_valida_da_Giugno_2021_a_Maggio_2022.pdf](Traccia_elaborato_software_valida_da_Giugno_2021_a_Maggio_2022.pdf).


---------------------------------------------------------------------------------------------------

### Indicazioni per lo svolgimento

Il sistema deve essere realizzato con il linguaggio di sviluppo ***Java***, adottando l’architettura software e i design pattern
analizzati durante il corso. I dati dovranno essere memorizzati in una base dati relazionale ***MySQL***. Si deve adottare un
processo di sviluppo ***agile Scrum*** e documentare il procedimento di lavoro adottato. Si devono realizzare gli ***unit test*** delle
contenute classi nel package ***DAO***.
La documentazione deve essere
composta da un unico documento con frontespizio e indice, contenente: 

1. analisi dei requisiti,

2. progettazione ***UML*** dell’architettura software, 

3. esplicita indicazione dei ***design pattern*** adottati, 

4. progettazione concettuale e logica della base dati, 

5. esiti degli ***unit test*** eseguiti, 

6. ***Scrum sprint backlog*** e ***burndown chart***.

Per consultare la doumentazione andare a vedere il file pdf [Progetto_PIS.pdf](Progetto_PIS.pdf).


--------------------------------------------------------------------------------------------------


### Database e IDE

Usare il file ***dump.sql*** per generare il database.
Ricordare di cambiare lo 'user' e 'password' nel file ***persistence.xml*** a seconda delle credenziali del proprio ***DBMS***


Per utilizzare gli utenti usati per testare il programma:

* ***Utente acquirente*** -> username: 1, password: 1

* ***Amministratore*** -> username: 2, password: 2

Questo progetto è stato sviluppato utilizzando l'IDE ***Eclipse 4.27.0***  e il DBMS ***MySQL 8.0***. 
