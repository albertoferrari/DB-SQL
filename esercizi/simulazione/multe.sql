-- creazione database
CREATE DATABASE multe

-- creazione tabella agente
CREATE TABLE agente ( 
   matricola INT NOT NULL,
   nominativo VARCHAR(30) NOT NULL, 
   PRIMARY KEY (matricola)
);

-- creazione tabella infrazione
CREATE TABLE infrazione ( 
   codice INT NOT NULL,
   data DATE,
   denominazione VARCHAR(30), 
   importo INT,
   agente INT NOT NULL,	
   automobile CHAR (8) NOT NULL, 
   FOREIGN KEY (agente) REFERENCES agente(matricola),
   FOREIGN KEY (automobile) REFERENCES automobile(targa),   
   PRIMARY KEY (codice)
);

-- creazione tabella automobilista
CREATE TABLE automobilista ( 
   codiceFiscale CHAR(16) NOT NULL,
   nominativo VARCHAR(30), 
   indirizzo VARCHAR(20), 
   citta VARCHAR(15), 
   cap INT, 
   PRIMARY KEY (codiceFiscale)
);

-- creazione tabella automobile
CREATE TABLE automobile  (
	targa CHAR (8) PRIMARY KEY NOT NULL,
	marca VARCHAR (4), 
	modello VARCHAR (50),
	proprietario CHAR(16),
    FOREIGN KEY (proprietario) REFERENCES automobilista(codiceFiscale)
);

-- targa e nominativo del proprietario delle automobili 
-- multate per “divieto di sosta”
SELECT automobile.targa, automobilista.nominativo
FROM infrazione INNER JOIN automobile 
                ON infrazione.automobile = automobile.targa
     INNER JOIN automobilista
                ON automobile.proprietario = automobilista.codiceFiscale
WHERE infrazione.denominazione = 'divieto di sosta'

-- importo medio delle multe per ogni denominazione
SELECT denominazione, AVG(importo)
FROM infrazione
GROUP BY denominazione
