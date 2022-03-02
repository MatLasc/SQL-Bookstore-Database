CREATE TABLE ADRESA( 
    cod_adresa INT, 
    strada VARCHAR(40) NOT NULL, 
    numar INT NOT NULL, 
    CONSTRAINT pk_adresa PRIMARY KEY(cod_adresa) 
 
);

CREATE TABLE LIBRARIE( 
    cod_librarie INT, 
    nume VARCHAR(30) NOT NULL UNIQUE, 
    data_infiintare DATE, 
    cod_adresa INT, 
    CONSTRAINT pk_librarie PRIMARY KEY(cod_librarie), 
    CONSTRAINT fk_librarie1 FOREIGN KEY (cod_adresa) REFERENCES ADRESA(cod_adresa) 
);

CREATE TABLE ABONAT( 
    cod_abonat INT, 
    nume VARCHAR(40) NOT NULL, 
    cnp VARCHAR(13) NOT NULL UNIQUE, 
    sex VARCHAR(2) NOT NULL, 
    CONSTRAINT pk_abonat PRIMARY KEY(cod_abonat) 
 
);

CREATE TABLE ABONAMENT( 
    cod_abonament INT, 
    cod_abonat INT, 
    cod_librarie INT, 
    CONSTRAINT pk_abonament PRIMARY KEY(cod_abonament), 
    CONSTRAINT fk_abonament1 FOREIGN KEY (cod_abonat) REFERENCES ABONAT(cod_abonat), 
    CONSTRAINT fk_abonament2 FOREIGN KEY(cod_librarie) REFERENCES LIBRARIE(cod_librarie) 
);

CREATE TABLE EDITURA( 
  cod_editura INT, 
  nume VARCHAR(40), 
  CONSTRAINT pk_editura PRIMARY KEY(cod_editura) 
);

CREATE TABLE STUDIO( 
    cod_studio INT, 
    nume VARCHAR(30), 
    CONSTRAINT pk_studio PRIMARY KEY(cod_studio) 
);

CREATE TABLE PRODUS( 
   cod_produs INT, 
   pret INT, 
   titlu VARCHAR(50) NOT NULL, 
   data_aparitie DATE NOT NULL, 
   CONSTRAINT pk_produs PRIMARY KEY(cod_produs) 
 
);

CREATE TABLE CARTE( 
    cod_carte INT,  
    cod_produs INT, 
    pret INT , 
    titlu VARCHAR(50) NOT NULL, 
    data_aparitie DATE NOT NULL , 
    autor VARCHAR(40) NOT NULL, 
    nr_pagini INT NOT NULL, 
    cod_editura INT, 
    CONSTRAINT pk_carte PRIMARY KEY(cod_carte), 
    CONSTRAINT fk_carte2 FOREIGN KEY (cod_produs) REFERENCES PRODUS(cod_produs), 
    CONSTRAINT fk_carte1 FOREIGN KEY (cod_editura) REFERENCES EDITURA(cod_editura) 
);

CREATE TABLE FILM( 
    cod_film INT, 
    cod_produs INT, 
    pret INT, 
    titlu VARCHAR(25), 
    data_aparitie DATE NOT NULL, 
    regizor VARCHAR(25) NOT NULL, 
    durata INT NOT NULL, 
    cod_studio INT, 
    CONSTRAINT pk_film PRIMARY KEY(cod_film), 
    CONSTRAINT fk_film1 FOREIGN KEY(cod_produs) REFERENCES PRODUS(cod_produs), 
    CONSTRAINT fk_film2 FOREIGN KEY (cod_studio) REFERENCES STUDIO(cod_studio) 
);

CREATE TABLE RATING( 
   cod_rating INT, 
   nota INT NOT NULL, 
   sursa VARCHAR(30), 
   cod_produs INT, 
   CONSTRAINT pk_rating PRIMARY KEY(cod_rating), 
   CONSTRAINT fk_produs FOREIGN KEY (cod_produs) REFERENCES PRODUS(cod_produs) 
);

CREATE TABLE CONTRACT( 
    cod_contract INT, 
    data_semnatura DATE, 
    cod_produs INT, 
    cod_librarie INT, 
    CONSTRAINT pk_contract PRIMARY KEY(cod_contract), 
    CONSTRAINT fk_contract1 FOREIGN KEY(cod_produs) REFERENCES PRODUS(cod_produs), 
    CONSTRAINT fk_contract2 FOREIGN KEY(cod_librarie) REFERENCES LIBRARIE(cod_librarie) 
                     );

CREATE TABLE CLIENT( 
    cod_client INT, 
    nume VARCHAR(40) NOT NULL, 
    CONSTRAINT pk_client PRIMARY KEY(cod_client) 
);

CREATE TABLE PLATA( 
  cod_plata INT, 
  tip_plata VARCHAR(5), 
  CONSTRAINT pk_plata PRIMARY KEY(cod_plata) 
);

CREATE TABLE ACHIZITIE( 
    cod_achizitie INT, 
    cod_client INT, 
    cod_produs INT, 
    cod_plata INT, 
    CONSTRAINT pk_achizitie PRIMARY KEY(cod_achizitie), 
    CONSTRAINT fk_achizitie1 FOREIGN KEY(cod_client) REFERENCES CLIENT(cod_client), 
    CONSTRAINT fk_achizitie2 FOREIGN KEY(cod_produs) REFERENCES PRODUS(cod_produs), 
    CONSTRAINT fk_achizitie3 FOREIGN KEY(cod_plata) REFERENCES PLATA(cod_plata) 
);

INSERT INTO ADRESA VALUES(1, 'Nae Zae', 10);

INSERT INTO ADRESA VALUES(2, 'Ilie Varici', 20);

INSERT INTO ADRESA VALUES(3, 'Marcus Arcus', 9);

INSERT INTO ADRESA VALUES(4, 'Pop Protopop', 2);

INSERT INTO ADRESA VALUES(5, 'Stockholm', 71);

SELECT * 
FROM ADRESA;

INSERT INTO LIBRARIE VALUES(1, 'Librotesti',TO_DATE('10-10-2010', 'DD-MM-YYYY'), 1);

INSERT INTO LIBRARIE VALUES(2, 'Cartografia', TO_DATE('20-05-2011', 'DD-MM-YYYY'), 2);

INSERT INTO LIBRARIE VALUES(3, 'Cartes', TO_DATE( '04-04-2012', 'DD-MM-YYYY'), 3);

INSERT INTO LIBRARIE VALUES(4, 'Carte Parte', TO_DATE(  '04-05-2013', 'DD-MM-YYYY'), 4);

INSERT INTO LIBRARIE VALUES(5, 'Bibilioland', TO_DATE('06-06-2013' ,'DD-MM-YYYY'), 5);

SELECT * 
FROM LIBRARIE;

INSERT INTO ABONAT VALUES(1, 'Mihai Marcu', '5010502018919', 'M');

INSERT INTO ABONAT VALUES(2, 'Mircea Melenescu', '5020518018876', 'M');

INSERT INTO ABONAT VALUES(3, 'Maria Lupeanu', '6000702018333', 'F');

INSERT INTO ABONAT VALUES(4, 'Ion Eremia', '5010930118919', 'M');

INSERT INTO ABONAT VALUES(5, 'Alin Alecu', '5041206343434', 'M');

SELECT *  
FROM ABONAT;

INSERT INTO ABONAMENT VALUES(1, 1, 1);

INSERT INTO ABONAMENT VALUES(2, 1, 3);

INSERT INTO ABONAMENT VALUES(3, 2, 4);

INSERT INTO ABONAMENT VALUES(4, 2, 5);

INSERT INTO ABONAMENT VALUES(5, 3, 1);

INSERT INTO ABONAMENT VALUES(6, 4, 2);

INSERT INTO ABONAMENT VALUES(7, 4, 5);

INSERT INTO ABONAMENT VALUES(8, 5, 1);

INSERT INTO ABONAMENT VALUES(9, 5, 3);

INSERT INTO ABONAMENT VALUES(10, 5, 5);

SELECT * 
FROM ABONAMENT;

INSERT INTO EDITURA VALUES(1, 'Nemira');

INSERT INTO EDITURA VALUES(2, 'Curtea veche');

INSERT INTO EDITURA VALUES(3, 'Artemis');

INSERT INTO EDITURA VALUES(4, 'Corint');

INSERT INTO EDITURA VALUES(5, 'Vintage');

SELECT * 
FROM EDITURA;

INSERT INTO STUDIO VALUES(1, '20th Century Fox');

INSERT INTO STUDIO VALUES(2, 'MGM');

INSERT INTO STUDIO VALUES(3, 'Warner Bros');

INSERT INTO STUDIO VALUES(4, 'Disney');

INSERT INTO STUDIO VALUES(5, 'Studio Ghibli');

SELECT * 
FROM STUDIO;

INSERT INTO PRODUS VALUES(1, 40, '2001 : A Space Odyssey', TO_DATE( '06/08/1968', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(2, 40, 'The Favourite', TO_DATE('19/12/2018', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(4, 30, 'Birdman', TO_DATE( '12/12/2014', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(5, 30, 'Princess Mononoke', TO_DATE('30/07/1997', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(6, 100, 'Dune', TO_DATE('06/08/1965', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(7, 130, 'A Storm of Swords', TO_DATE('27/10/2002', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(8, 20, '1984', TO_DATE('06/08/1947', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(9, 50, 'Enciclopedia zmeilor', TO_DATE('24/12/2002', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(10, 40, 'Idiotul' , TO_DATE('20/09/1878', 'DD-MM-YYYY'));

INSERT INTO PRODUS VALUES(3, 20, 'Blade Runner 2049', TO_DATE('07/09/2017', 'DD-MM-YYYY'));

INSERT INTO FILM VALUES(1, 1, 40, '2001 : A Space Odyssey', TO_DATE( '06/08/1968', 'DD-MM-YYYY'),  'Stanley Kubrick', 168, 2);

INSERT INTO FILM VALUES(2, 2, 40, 'The Favourite', TO_DATE('19/12/2018', 'DD-MM-YYYY'),  'Yorgos Lanthimos', 121, 1);

INSERT INTO FILM VALUES(3, 3, 20, 'Blade Runner 2049', TO_DATE( '07/09/2017', 'DD-MM-YYYY'),  'Denis Villeneuve', 143, 3);

INSERT INTO FILM VALUES(4, 4, 30, 'Birdman', TO_DATE( '12/12/2014', 'DD-MM-YYYY'), 'Alejandro G. Inarritu', 125, 1);

INSERT INTO FILM VALUES(5, 5, 30, 'Princess Mononoke', TO_DATE('30/07/1997', 'DD-MM-YYYY'), 'Hayao Miyazaki', 110, 5);

INSERT INTO CARTE VALUES(6, 6, 100, 'Dune', TO_DATE('06/08/1965', 'DD-MM-YYYY'), 'Frank Herbert', 600, 1);

INSERT INTO CARTE VALUES(7, 7, 130, 'A Storm of Swords', TO_DATE( '27/10/2002', 'DD-MM-YYYY'),  'George R.R. Martin', 700, 1);

INSERT INTO CARTE VALUES(8, 8, 20, '1984', TO_DATE( '06/08/1947', 'DD-MM-YYYY'), 'George Orwell', 200, 5);

INSERT INTO CARTE VALUES(9, 9, 50, 'Enciclopedia zmeilor', TO_DATE('24/12/2002', 'DD-MM-YYYY'),  'Mircea Cartarescu', 60, 4);

INSERT INTO CARTE VALUES(10, 10, 40, 'Idiotul', TO_DATE('20/09/1878', 'DD-MM-YYYY'),  'Fyodor Dostoievski', 800, 5);

INSERT INTO RATING VALUES(1, 10, 'Roger Ebert', 1);

INSERT INTO RATING VALUES(2, 9, 'The Guardian', 2);

INSERT INTO RATING VALUES(3, 10, 'The Rolling Stone', 2);

INSERT INTO RATING VALUES(4, 7, 'Good Reviews', 7);

INSERT INTO RATING VALUES(5, 8, 'IGN', 3);

INSERT INTO CLIENT VALUES(1,'Marcel Vasile');

INSERT INTO CLIENT VALUES(2, 'Mihaela Pedore');

INSERT INTO CLIENT VALUES(3, 'Vasile Traian');

INSERT INTO CLIENT VALUES(4, 'Mortimer Manole');

INSERT INTO CLIENT VALUES(5, 'Marius Popovici');

INSERT INTO PLATA VALUES(1, 'card');

INSERT INTO PLATA VALUES(2, 'card');

INSERT INTO PLATA VALUES(3, 'card');

INSERT INTO PLATA VALUES(4, 'cash');

INSERT INTO PLATA VALUES(5, 'cash');

INSERT INTO PLATA VALUES(6, 'card');

INSERT INTO PLATA VALUES(7, 'card');

INSERT INTO PLATA VALUES(8, 'card');

INSERT INTO PLATA VALUES(9, 'cash');

INSERT INTO PLATA VALUES(10,'cash');

INSERT INTO ACHIZITIE VALUES(1, 1, 1, 1);

INSERT INTO ACHIZITIE VALUES(2, 2, 2, 2);

INSERT INTO ACHIZITIE VALUES(3, 3, 3, 3);

INSERT INTO ACHIZITIE VALUES(4, 4, 4, 4);

INSERT INTO ACHIZITIE VALUES(5, 5, 5, 5);

INSERT INTO ACHIZITIE VALUES(6, 1, 4, 6);

INSERT INTO ACHIZITIE VALUES(7, 2, 7, 7);

INSERT INTO ACHIZITIE VALUES(8, 3, 8, 8);

INSERT INTO ACHIZITIE VALUES(9, 4, 9, 4);

INSERT INTO ACHIZITIE VALUES(10, 5, 10, 5);

SELECT * 
FROM ACHIZITIE;

INSERT INTO CONTRACT VALUES(1, TO_DATE('10/08/2020', 'DD-MM-YYYY') , 1, 1);

INSERT INTO CONTRACT VALUES(2, TO_DATE( '20/09/2020', 'DD-MM-YYYY'), 2, 2);

INSERT INTO CONTRACT VALUES(3, TO_DATE('20/09/2020', 'DD-MM-YYYY'), 3, 3);

INSERT INTO CONTRACT VALUES(4, TO_DATE('21/10/2020', 'DD-MM-YYYY'), 4, 4);

INSERT INTO CONTRACT VALUES(5, TO_DATE('05/05/2021', 'DD-MM-YYYY'), 5, 5);

INSERT INTO CONTRACT VALUES(6, TO_DATE('10/08/2020', 'DD-MM-YYYY'), 6, 1);

INSERT INTO CONTRACT VALUES(7, TO_DATE( '20/09/2020', 'DD-MM-YYYY'), 7, 2);

INSERT INTO CONTRACT VALUES(8, TO_DATE('20/09/2020', 'DD-MM-YYYY'), 8, 3);

INSERT INTO CONTRACT VALUES(9, TO_DATE( '21/10/2020', 'DD-MM-YYYY'), 9, 4);

INSERT INTO CONTRACT VALUES(10, TO_DATE('05/05/2021', 'DD-MM-YYYY'), 10, 5);

CREATE OR REPLACE PROCEDURE nr_abonamente IS 
CURSOR c IS SELECT l.cod_librarie cod, l.nume nume, COUNT(*) nr_ab 
	    FROM LIBRARIE l LEFT JOIN ABONAMENT a 
	    ON a.cod_librarie = l.cod_librarie 
	    GROUP BY l.cod_librarie, l.nume; 
BEGIN 
 
FOR i in c LOOP 
	DBMS_OUTPUT.PUT_LINE('Libraria ' || i.nume || ' a inregistrat un numar de ' || i.nr_ab || ' abonamente.') ; 
END LOOP; 
 
END;
/

CREATE OR REPLACE FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER AS  
nr_b NUMBER(5);  
nr_l NUMBER(5);  
exc1 EXCEPTION;  
exc2 EXCEPTION;  
BEGIN  
  
  
SELECT COUNT(*)  
INTO nr_l  
FROM LIBRARIE  
WHERE nume = libr_nume;  
  
IF nr_l = 0 THEN  
 raise exc1;  
END IF;  
  
IF nr_l > 1 THEN  
  raise exc2;  
END IF;  
  
SELECT COUNT(*)  
INTO nr_b  
FROM ABONAMENT a  
INNER JOIN ABONAT b ON a.cod_abonat = b.cod_abonat  
INNER JOIN LIBRARIE c on a.cod_librarie = c.cod_librarie  
WHERE c.nume = libr_nume AND b.sex = 'M';  
  
RETURN nr_b;  
  
EXCEPTION  
	WHEN exc1 THEN  
		DBMS_OUTPUT.PUT_LINE('Nu exita librarii cu acest nume.');  
	WHEN exc2 THEN  
		DBMS_OUTPUT.PUT_LINE('Exista mai multe librarii cu acest nume.');  
	WHEN others THEN  
 		DBMS_OUTPUT.PUT_LINE('Alta eroare.');  
  
END nr_barbati; 
/

CREATE OR REPLACE PROCEDURE stat_not IS  
TYPE vector IS VARRAY(11) OF NUMBER;  
cont_note vector:= vector();  
TYPE tablou IS TABLE OF NUMBER;  
info_note  tablou;  
  
BEGIN  
FOR i in 1..10 LOOP  
 cont_note.extend; cont_note(i) := 0;  
END LOOP;  
  
SELECT nota  
BULK COLLECT INTO info_note  
FROM RATING;  
  
FOR i IN info_note.FIRST..info_note.LAST LOOP  
	cont_note(info_note(i)) := cont_note(info_note(i)) + 1;   
END LOOP;  
  
for i in 1..10 LOOP  
	DBMS_OUTPUT.PUT_LINE('Nota ' || i || ' a fost data de ' || cont_note(i) || ' ori.');  
END LOOP;  
  
END stat_not;
/

CREATE TRIGGER NO_UPDATE  
BEFORE INSERT ON PLATA  
BEGIN  
	DBMS_OUTPUT.PUT_LINE('O noua vanzare.');  
END;
/

CREATE TRIGGER PRICE_NOT_NULL 
BEFORE UPDATE OF pret ON PRODUS FOR EACH ROW 
BEGIN 
	IF :NEW.pret = 0 THEN RAISE_APPLICATION_ERROR(-20002, 'Pretul nu poate fi 0'); 
	END IF; 
END; 
/

CREATE OR REPLACE PROCEDURE nr_librarii (nume_client client.nume%type) IS 
nr_nm NUMBER(3); 
TYPE libr is TABLE of LIBRARIE.nume%TYPE; 
nume_libr libr; 
 
BEGIN	 
	SELECT COUNT(*)	 
	INTO nr_nm	 
	FROM client 
	WHERE nume = nume_client; 
	 
	IF nr_nm > 1 THEN 
		raise too_many_rows; 
	END IF; 
	IF nr_nm = 0 THEN	 
		raise no_data_found; 
	END IF; 
 
	SELECT DISTINCT l.nume 
        BULK COLLECT INTO nume_libr 
	FROM LIBRARIE l  
	INNER JOIN CONTRACT c ON l.cod_librarie = c.cod_librarie 
	INNER JOIN PRODUS p ON  c.cod_produs = p.cod_produs 
	INNER JOIN ACHIZITIE a ON p.cod_produs = a.cod_produs 
	INNER JOIN CLIENT cl  on cl.cod_client = a.cod_client 
	WHERE nume_client = cl.nume; 
	 
	FOR i IN nume_libr.first..nume_libr.last LOOP 
		DBMS_OUTPUT.PUT_LINE(nume_libr(i)); 
	END LOOP; 
	 
EXCEPTION 
	WHEN too_many_rows THEN  
		DBMS_OUTPUT.PUT_LINE('Prea multi clienti cu acest nume'); 
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('Nu exista clienti cu acest nume'); 
	WHEN others THEN 
		DBMS_OUTPUT.PUT_LINE('Error'); 
 
END nr_librarii;
/

CREATE OR REPLACE TRIGGER LOCK_T 
BEFORE DROP    
ON SCHEMA      
BEGIN 
   RAISE_APPLICATION_ERROR(-20003, 'Trigger-ul trebuie eliminat pentru a putea altera/sterge tabele'); 
END; 
 
/

CREATE OR REPLACE TRIGGER LOCK_T 
BEFORE DROP    
ON SCHEMA      
BEGIN 
   DBMS_OUTPUT.PUT_LINE('Trigger-ul trebuie eliminat pentru a putea sterge tabele'); 
   RAISE_APPLICATION_ERROR(-20003, 'Trigger-ul trebuie eliminat pentru a putea sterge tabele'); 
END; 
 
/

CREATE OR REPLACE TRIGGER LOCK_T 
BEFORE DROP    
ON SCHEMA      
BEGIN 
   DBMS_OUTPUT.PUT_LINE('Trigger-ul trebuie eliminat pentru a putea sterge tabele'); 
   RAISE_APPLICATION_ERROR(-20003, 'Trigger-ul trebuie eliminat pentru a putea sterge tabele'); 
END; 
 
/

CREATE OR REPLACE PACKAGE pack1 AS 
    PROCEDURE stat_not; 
    PROCEDURE nr_abonamente; 
    FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER; 
    PROCEDURE nr_librarii (nume_client client.nume%type); 
END pack1; 
/

CREATE OR REPLACE PACKAGE BODY pack1 AS 
    PROCEDURE stat_not IS 
        TYPE vector IS VARRAY(11) OF NUMBER; 
        cont_note vector:= vector(); 
        TYPE tablou IS TABLE OF NUMBER; 
        info_note  tablou; 
 
    BEGIN 
        FOR i in 1..10 LOOP 
        cont_note.extend; cont_note(i) := 0; 
        END LOOP; 
 
        SELECT nota 
        BULK COLLECT INTO info_note 
        FROM RATING; 
 
        FOR i IN info_note.FIRST..info_note.LAST LOOP 
        	cont_note(info_note(i)) := cont_note(info_note(i)) + 1;  
        END LOOP; 
 
        for i in 1..10 LOOP 
        	DBMS_OUTPUT.PUT('Nota ' || i || ' a fost data de ' || cont_note(i) || ' ori.'); 
        END LOOP; 
 
    END stat_not; 
     
    PROCEDURE nr_abonamente IS 
        CURSOR c IS SELECT l.cod_librarie cod, l.nume nume, COUNT(*) nr_ab 
	        FROM LIBRARIE l LEFT JOIN ABONAMENT a 
	        ON a.cod_librarie = l.cod_librarie 
	        GROUP BY l.cod_librarie, l.nume; 
    BEGIN 
 
        FOR i in c LOOP 
        	DBMS_OUTPUT.PUT_LINE('Libraria ' || i.nume || ' a inregistrat un numar de ' || i.nr_ab || ' abonamente.') ; 
        END LOOP; 
 
    END nr_abonamente;  
     
    FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER AS  
        nr_b NUMBER(5);  
        nr_l NUMBER(5);  
        exc1 EXCEPTION;  
        exc2 EXCEPTION;  
    BEGIN  
  
  
        SELECT COUNT(*)  
        INTO nr_l  
        FROM LIBRARIE  
        WHERE nume = libr_nume;  
  
        IF nr_l = 0 THEN  
            raise exc1;  
        END IF;  
  
        IF nr_l > 1 THEN  
            raise exc2;  
        END IF;  
  
        SELECT COUNT(*)  
        INTO nr_b  
        FROM ABONAMENT a  
        INNER JOIN ABONAT b ON a.cod_abonat = b.cod_abonat  
        INNER JOIN LIBRARIE c on a.cod_librarie = c.cod_librarie  
        WHERE c.nume = libr_nume AND b.sex = 'M';  
  
        RETURN nr_b;  
  
    EXCEPTION  
	    WHEN exc1 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Nu exita librarii cu acest nume.');  
	    WHEN exc2 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Exista mai multe librarii cu acest nume.');  
    	WHEN others THEN  
 	    	DBMS_OUTPUT.PUT_LINE('Alta eroare.');  
  
    END nr_barbati;  
     
     
    PROCEDURE nr_librarii (nume_client client.nume%type) IS 
        nr_nm NUMBER(3); 
        TYPE libr is TABLE of LIBRARIE.nume%TYPE; 
        nume_libr libr; 
 
    BEGIN	 
    	SELECT COUNT(*)	 
    	INTO nr_nm	 
	    FROM client 
	    WHERE nume = nume_client; 
	 
	    IF nr_nm > 1 THEN 
	    	raise too_many_rows; 
	    END IF; 
	    IF nr_nm = 0 THEN	 
	    	raise no_data_found; 
    	END IF; 
 
    	SELECT DISTINCT l.nume 
            BULK COLLECT INTO nume_libr 
    	FROM LIBRARIE l  
    	INNER JOIN CONTRACT c ON l.cod_librarie = c.cod_librarie 
    	INNER JOIN PRODUS p ON  c.cod_produs = p.cod_produs 
    	INNER JOIN ACHIZITIE a ON p.cod_produs = a.cod_produs 
    	INNER JOIN CLIENT cl  on cl.cod_client = a.cod_client 
    	WHERE nume_client = cl.nume; 
	 
    	FOR i IN nume_libr.first..nume_libr.last LOOP 
	    	DBMS_OUTPUT.PUT_LINE(nume_libr(i)); 
    	END LOOP; 
    	 
    EXCEPTION 
    	WHEN too_many_rows THEN  
	    	DBMS_OUTPUT.PUT_LINE('Prea multi clienti cu acest nume'); 
    	WHEN no_data_found THEN 
	    	DBMS_OUTPUT.PUT_LINE('Nu exista clienti cu acest nume'); 
    	WHEN others THEN 
	    	DBMS_OUTPUT.PUT_LINE('Error'); 
 
    END nr_librarii; 
 
END pack1;
/

CREATE OR REPLACE PACKAGE pack1 AS 
    PROCEDURE stat_not; 
    PROCEDURE nr_abonamente; 
    FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER; 
    PROCEDURE nr_librarii (nume_client client.nume%type); 
END pack1; 
/

CREATE OR REPLACE PACKAGE BODY pack1 AS 
    PROCEDURE stat_not IS 
        TYPE vector IS VARRAY(11) OF NUMBER; 
        cont_note vector:= vector(); 
        TYPE tablou IS TABLE OF NUMBER; 
        info_note  tablou; 
 
    BEGIN 
        FOR i in 1..10 LOOP 
        cont_note.extend; cont_note(i) := 0; 
        END LOOP; 
 
        SELECT nota 
        BULK COLLECT INTO info_note 
        FROM RATING; 
 
        FOR i IN info_note.FIRST..info_note.LAST LOOP 
        	cont_note(info_note(i)) := cont_note(info_note(i)) + 1;  
        END LOOP; 
 
        for i in 1..10 LOOP 
        	DBMS_OUTPUT.PUT('Nota ' || i || ' a fost data de ' || cont_note(i) || ' ori.'); 
        END LOOP; 
 
    END stat_not; 
     
    PROCEDURE nr_abonamente IS 
        CURSOR c IS SELECT l.cod_librarie cod, l.nume nume, COUNT(*) nr_ab 
	        FROM LIBRARIE l LEFT JOIN ABONAMENT a 
	        ON a.cod_librarie = l.cod_librarie 
	        GROUP BY l.cod_librarie, l.nume; 
    BEGIN 
 
        FOR i in c LOOP 
        	DBMS_OUTPUT.PUT_LINE('Libraria ' || i.nume || ' a inregistrat un numar de ' || i.nr_ab || ' abonamente.') ; 
        END LOOP; 
 
    END nr_abonamente;  
     
    FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER AS  
        nr_b NUMBER(5);  
        nr_l NUMBER(5);  
        exc1 EXCEPTION;  
        exc2 EXCEPTION;  
    BEGIN  
  
  
        SELECT COUNT(*)  
        INTO nr_l  
        FROM LIBRARIE  
        WHERE nume = libr_nume;  
  
        IF nr_l = 0 THEN  
            raise exc1;  
        END IF;  
  
        IF nr_l > 1 THEN  
            raise exc2;  
        END IF;  
  
        SELECT COUNT(*)  
        INTO nr_b  
        FROM ABONAMENT a  
        INNER JOIN ABONAT b ON a.cod_abonat = b.cod_abonat  
        INNER JOIN LIBRARIE c on a.cod_librarie = c.cod_librarie  
        WHERE c.nume = libr_nume AND b.sex = 'M';  
  
        RETURN nr_b;  
  
    EXCEPTION  
	    WHEN exc1 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Nu exita librarii cu acest nume.');  
	    WHEN exc2 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Exista mai multe librarii cu acest nume.');  
    	WHEN others THEN  
 	    	DBMS_OUTPUT.PUT_LINE('Alta eroare.');  
  
    END nr_barbati;  
     
     
    PROCEDURE nr_librarii (nume_client client.nume%type) IS 
        nr_nm NUMBER(3); 
        TYPE libr is TABLE of LIBRARIE.nume%TYPE; 
        nume_libr libr; 
 
    BEGIN	 
    	SELECT COUNT(*)	 
    	INTO nr_nm	 
	    FROM client 
	    WHERE nume = nume_client; 
	 
	    IF nr_nm > 1 THEN 
	    	raise too_many_rows; 
	    END IF; 
	    IF nr_nm = 0 THEN	 
	    	raise no_data_found; 
    	END IF; 
 
    	SELECT DISTINCT l.nume 
            BULK COLLECT INTO nume_libr 
    	FROM LIBRARIE l  
    	INNER JOIN CONTRACT c ON l.cod_librarie = c.cod_librarie 
    	INNER JOIN PRODUS p ON  c.cod_produs = p.cod_produs 
    	INNER JOIN ACHIZITIE a ON p.cod_produs = a.cod_produs 
    	INNER JOIN CLIENT cl  on cl.cod_client = a.cod_client 
    	WHERE nume_client = cl.nume; 
	 
    	FOR i IN nume_libr.first..nume_libr.last LOOP 
	    	DBMS_OUTPUT.PUT_LINE(nume_libr(i)); 
    	END LOOP; 
    	 
    EXCEPTION 
    	WHEN too_many_rows THEN  
	    	DBMS_OUTPUT.PUT_LINE('Prea multi clienti cu acest nume'); 
    	WHEN no_data_found THEN 
	    	DBMS_OUTPUT.PUT_LINE('Nu exista clienti cu acest nume'); 
    	WHEN others THEN 
	    	DBMS_OUTPUT.PUT_LINE('Error'); 
 
    END nr_librarii; 
 
END pack1; 
 
/

execute pack1.stat_not


execute pack1.nr_abonamente


execute pack1.nr_librarii


CREATE OR REPLACE PACKAGE pack1 AS 
    PROCEDURE stat_not; 
    PROCEDURE nr_abonamente; 
    FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER; 
    PROCEDURE nr_librarii (nume_client client.nume%type); 
END pack1; 
/

CREATE OR REPLACE PACKAGE BODY pack1 AS 
    PROCEDURE stat_not IS 
        TYPE vector IS VARRAY(11) OF NUMBER; 
        cont_note vector:= vector(); 
        TYPE tablou IS TABLE OF NUMBER; 
        info_note  tablou; 
 
    BEGIN 
        FOR i in 1..10 LOOP 
        cont_note.extend; cont_note(i) := 0; 
        END LOOP; 
 
        SELECT nota 
        BULK COLLECT INTO info_note 
        FROM RATING; 
 
        FOR i IN info_note.FIRST..info_note.LAST LOOP 
        	cont_note(info_note(i)) := cont_note(info_note(i)) + 1;  
        END LOOP; 
 
        for i in 1..10 LOOP 
        	DBMS_OUTPUT.PUT('Nota ' || i || ' a fost data de ' || cont_note(i) || ' ori.'); 
        END LOOP; 
 
    END stat_not; 
     
    PROCEDURE nr_abonamente IS 
        CURSOR c IS SELECT l.cod_librarie cod, l.nume nume, COUNT(*) nr_ab 
	        FROM LIBRARIE l LEFT JOIN ABONAMENT a 
	        ON a.cod_librarie = l.cod_librarie 
	        GROUP BY l.cod_librarie, l.nume; 
    BEGIN 
 
        FOR i in c LOOP 
        	DBMS_OUTPUT.PUT_LINE('Libraria ' || i.nume || ' a inregistrat un numar de ' || i.nr_ab || ' abonamente.') ; 
        END LOOP; 
 
    END nr_abonamente;  
     
    FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER AS  
        nr_b NUMBER(5);  
        nr_l NUMBER(5);  
        exc1 EXCEPTION;  
        exc2 EXCEPTION;  
    BEGIN  
  
  
        SELECT COUNT(*)  
        INTO nr_l  
        FROM LIBRARIE  
        WHERE nume = libr_nume;  
  
        IF nr_l = 0 THEN  
            raise exc1;  
        END IF;  
  
        IF nr_l > 1 THEN  
            raise exc2;  
        END IF;  
  
        SELECT COUNT(*)  
        INTO nr_b  
        FROM ABONAMENT a  
        INNER JOIN ABONAT b ON a.cod_abonat = b.cod_abonat  
        INNER JOIN LIBRARIE c on a.cod_librarie = c.cod_librarie  
        WHERE c.nume = libr_nume AND b.sex = 'M';  
  
        RETURN nr_b;  
  
    EXCEPTION  
	    WHEN exc1 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Nu exita librarii cu acest nume.');  
	    WHEN exc2 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Exista mai multe librarii cu acest nume.');  
    	WHEN others THEN  
 	    	DBMS_OUTPUT.PUT_LINE('Alta eroare.');  
  
    END nr_barbati;  
     
     
    PROCEDURE nr_librarii (nume_client client.nume%type) IS 
        nr_nm NUMBER(3); 
        TYPE libr is TABLE of LIBRARIE.nume%TYPE; 
        nume_libr libr; 
 
    BEGIN	 
    	SELECT COUNT(*)	 
    	INTO nr_nm	 
	    FROM client 
	    WHERE nume = nume_client; 
	 
	    IF nr_nm > 1 THEN 
	    	raise too_many_rows; 
	    END IF; 
	    IF nr_nm = 0 THEN	 
	    	raise no_data_found; 
    	END IF; 
 
    	SELECT DISTINCT l.nume 
            BULK COLLECT INTO nume_libr 
    	FROM LIBRARIE l  
    	INNER JOIN CONTRACT c ON l.cod_librarie = c.cod_librarie 
    	INNER JOIN PRODUS p ON  c.cod_produs = p.cod_produs 
    	INNER JOIN ACHIZITIE a ON p.cod_produs = a.cod_produs 
    	INNER JOIN CLIENT cl  on cl.cod_client = a.cod_client 
    	WHERE nume_client = cl.nume; 
	 
    	FOR i IN nume_libr.first..nume_libr.last LOOP 
	    	DBMS_OUTPUT.PUT_LINE(nume_libr(i)); 
    	END LOOP; 
    	 
    EXCEPTION 
    	WHEN too_many_rows THEN  
	    	DBMS_OUTPUT.PUT_LINE('Prea multi clienti cu acest nume'); 
    	WHEN no_data_found THEN 
	    	DBMS_OUTPUT.PUT_LINE('Nu exista clienti cu acest nume'); 
    	WHEN others THEN 
	    	DBMS_OUTPUT.PUT_LINE('Error'); 
 
    END nr_librarii; 
 
END pack1; 
 
/

execute pack1.stat_not


execute pack1.nr_abonamente


execute pack1.nr_librarii('Andrei Zax')


BEGIN 
    stat_not; 
END;
/

BEGIN 
    stat_not; 
END;
/

BEGIN 
    pack1.stat_not; 
END;
/

CREATE OR REPLACE PACKAGE BODY pack1 AS 
    PROCEDURE stat_not IS 
        TYPE vector IS VARRAY(11) OF NUMBER; 
        cont_note vector:= vector(); 
        TYPE tablou IS TABLE OF NUMBER; 
        info_note  tablou; 
 
    BEGIN 
        FOR i in 1..10 LOOP 
        cont_note.extend; cont_note(i) := 0; 
        END LOOP; 
 
        SELECT nota 
        BULK COLLECT INTO info_note 
        FROM RATING; 
 
        FOR i IN info_note.FIRST..info_note.LAST LOOP 
        	cont_note(info_note(i)) := cont_note(info_note(i)) + 1;  
        END LOOP; 
 
        for i in 1..10 LOOP 
        	DBMS_OUTPUT.PUT_LINE('Nota ' || i || ' a fost data de ' || cont_note(i) || ' ori.'); 
        END LOOP; 
 
    END stat_not; 
     
    PROCEDURE nr_abonamente IS 
        CURSOR c IS SELECT l.cod_librarie cod, l.nume nume, COUNT(*) nr_ab 
	        FROM LIBRARIE l LEFT JOIN ABONAMENT a 
	        ON a.cod_librarie = l.cod_librarie 
	        GROUP BY l.cod_librarie, l.nume; 
    BEGIN 
 
        FOR i in c LOOP 
        	DBMS_OUTPUT.PUT_LINE('Libraria ' || i.nume || ' a inregistrat un numar de ' || i.nr_ab || ' abonamente.') ; 
        END LOOP; 
 
    END nr_abonamente;  
     
    FUNCTION nr_barbati(libr_nume LIBRARIE.nume%type) RETURN NUMBER AS  
        nr_b NUMBER(5);  
        nr_l NUMBER(5);  
        exc1 EXCEPTION;  
        exc2 EXCEPTION;  
    BEGIN  
  
  
        SELECT COUNT(*)  
        INTO nr_l  
        FROM LIBRARIE  
        WHERE nume = libr_nume;  
  
        IF nr_l = 0 THEN  
            raise exc1;  
        END IF;  
  
        IF nr_l > 1 THEN  
            raise exc2;  
        END IF;  
  
        SELECT COUNT(*)  
        INTO nr_b  
        FROM ABONAMENT a  
        INNER JOIN ABONAT b ON a.cod_abonat = b.cod_abonat  
        INNER JOIN LIBRARIE c on a.cod_librarie = c.cod_librarie  
        WHERE c.nume = libr_nume AND b.sex = 'M';  
  
        RETURN nr_b;  
  
    EXCEPTION  
	    WHEN exc1 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Nu exita librarii cu acest nume.');  
	    WHEN exc2 THEN  
	    	DBMS_OUTPUT.PUT_LINE('Exista mai multe librarii cu acest nume.');  
    	WHEN others THEN  
 	    	DBMS_OUTPUT.PUT_LINE('Alta eroare.');  
  
    END nr_barbati;  
     
     
    PROCEDURE nr_librarii (nume_client client.nume%type) IS 
        nr_nm NUMBER(3); 
        TYPE libr is TABLE of LIBRARIE.nume%TYPE; 
        nume_libr libr; 
 
    BEGIN	 
    	SELECT COUNT(*)	 
    	INTO nr_nm	 
	    FROM client 
	    WHERE nume = nume_client; 
	 
	    IF nr_nm > 1 THEN 
	    	raise too_many_rows; 
	    END IF; 
	    IF nr_nm = 0 THEN	 
	    	raise no_data_found; 
    	END IF; 
 
    	SELECT DISTINCT l.nume 
            BULK COLLECT INTO nume_libr 
    	FROM LIBRARIE l  
    	INNER JOIN CONTRACT c ON l.cod_librarie = c.cod_librarie 
    	INNER JOIN PRODUS p ON  c.cod_produs = p.cod_produs 
    	INNER JOIN ACHIZITIE a ON p.cod_produs = a.cod_produs 
    	INNER JOIN CLIENT cl  on cl.cod_client = a.cod_client 
    	WHERE nume_client = cl.nume; 
	 
    	FOR i IN nume_libr.first..nume_libr.last LOOP 
	    	DBMS_OUTPUT.PUT_LINE(nume_libr(i)); 
    	END LOOP; 
    	 
    EXCEPTION 
    	WHEN too_many_rows THEN  
	    	DBMS_OUTPUT.PUT_LINE('Prea multi clienti cu acest nume'); 
    	WHEN no_data_found THEN 
	    	DBMS_OUTPUT.PUT_LINE('Nu exista clienti cu acest nume'); 
    	WHEN others THEN 
	    	DBMS_OUTPUT.PUT_LINE('Error'); 
 
    END nr_librarii; 
 
END pack1; 
 
/

BEGIN 
    pack1.stat_not; 
END;
/

