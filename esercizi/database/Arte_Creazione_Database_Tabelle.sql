CREATE DATABASE  Arte ;

USE Arte;

CREATE TABLE Musei  (
	MM_CodiceMuseo char (3) PRIMARY KEY NOT NULL,
	MM_Nome char (60),
	MM_Citta char (50)
);

CREATE TABLE Artisti  (
	AR_CodiceArtista char (4) primary key not NULL,
	AR_Nome char (60),
	AR_Alias char (20),
	AR_DataNascita integer,
	AR_DataMorte integer
);

CREATE TABLE Quadri  (
	QQ_TitoloQuadro char (40) primary key not NULL,
	QQ_CodiceArtista char (4), 
	QQ_AnnoEsecuzione integer, 
	QQ_Tecnica char (30),
	QQ_Altezza integer,
	QQ_Larghezza integer,
	QQ_CodiceMuseo char (3),
	QQ_Note char (50),
    FOREIGN KEY (QQ_CodiceArtista) REFERENCES Artisti(AR_CodiceArtista),
    FOREIGN KEY (QQ_CodiceMuseo) REFERENCES Musei(MM_CodiceMuseo)
);




