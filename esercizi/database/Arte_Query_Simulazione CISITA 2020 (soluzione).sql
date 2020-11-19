use arte;

-- 1. Alias e anno di nascita di tutti gli artisti
select AR_Alias, AR_DataNascita
from artisti;

-- 2. Nome dei musei di Parigi
select MM_Nome
from musei
where MM_Citta = 'Parigi';

-- 3. Titolo dei quadri dipinti con tecnica 
--    "Olio su tela" prima del 1700
select QQ_TitoloQuadro
from quadri
where QQ_Tecnica = 'Olio su tela' AND QQ_AnnoEsecuzione < 1700;

-- 4. Elenco degli artisti ordinati alfabeticamente per Alias
select *
from artisti
order by AR_Alias;

-- 5. Modificare in 1502 l'anno di esecuzione del quadro "La Tempesta" di Giorgione
UPDATE quadri 
SET QQ_AnnoEsecuzione=1502 
WHERE QQ_TitoloQuadro='La Tempesta';

-- 6. Alias dell'artista e titolo dei quadri del XVII secolo
select *
from artisti inner join quadri 
     on AR_CodiceArtista = QQ_CodiceArtista
where QQ_AnnoEsecuzione between 1600 AND 1700;

-- 7. Aggiornare il database includendo i dati desunti dalla seguente informazione:
--    "la prima versione della Vergine delle Rocce è un dipinto a olio su tavola 
--    (199x122 cm) di Leonardo da Vinci, databile al 1483 e conservato 
--    nel Musée du Louvre di Parigi"
-- a) codice artista di Leonardo -> 'A110' 
-- select AR_CodiceArtista
-- from artisti
-- where AR_Alias = 'Leonardo';
-- b) codice del Louvre -> 'M01'
-- select *
-- from musei
-- where MM_Nome = 'Louvre';
INSERT INTO quadri 
   (QQ_TitoloQuadro, QQ_CodiceArtista, QQ_AnnoEsecuzione, QQ_Altezza, QQ_Larghezza, QQ_CodiceMuseo) 
	VALUES ('Vergine delle Rocce', 'A110', '1483', '199', '122', 'M01');
-- Attenzione il quadro esiste già!    


-- 8. Nome e Alias dell'autore, titolo e anno si esecuzione del quadro 
-- e nome del museo di tutte le opere presenti nel database
select AR_Nome, AR_Alias, QQ_TitoloQuadro, QQ_AnnoEsecuzione, MM_Nome
from artisti inner join quadri on AR_CodiceArtista = QQ_CodiceArtista
             inner join musei on QQ_CodiceMuseo = MM_CodiceMuseo

