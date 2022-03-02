# SQL-Bookstore-Database

Un lant de librarii – fiecare avand locatii diferite - vinde carti si filme. Pentru aprovizionarea stocurilor, librariile primesc cartile de la edituri, iar filmele de la studiouri. Cartile si filmele reprezinta produsele vandute in librarii si fiecare are un pret, un numar de exemplare si o data de aparitie. Produsele sunt cumparate de client printr-o anume modalitate de plata. Librariile pot avea si abonati care sunt inregistrati in baza de date.  Libraria are de asemenea o adresa la care se afla.        Produsele au rating-uri din partea mai multor surse(critici, publicatii, site-uri de recenzii).

RESTRICTII:
Fiecare librarie are o singura adresa, iar la o adresa se poate afla o singura librarie.
O achizitie reprezinta achizitionarea de catre client a unui singur exemplar dintr-un anume tip de produs, in timp ce contractul prevede achizitionarea de catre librarie a unui anumit numar de produse de un anume tip. 
O persoana “abonata” poate avea mai multe abonamente la librarii diferite, insa doar unul la o anumita librarie.
Rating-urile produselor sunt de la 1 la 10.
Tipul unei plati este fie card, fie cash.
Notele sunt numere naturale de la 1 la 10.             

Relatii:
La o adresa se afla o  librarie.
O librarie are unul sau mai multi abonati, care la randul lor pot fi abonati la mai multe librarii.
 Vanzarea unui produs este prevazuta de unul sau mai multe contracte , iar librariile semneaza mai multe contracte.
Un produs are unul sau mai multe rating-uri
Un studio produce unul sau mai multe filme.
O editura publica una sau mai multe carti.
Un client poate cumpara, utilizand o singura metoda de plata, unul sau mai multe produse.

Entitati, scheme relationale:
LIBRARIE(cod_librarie#, nume, data_infiintare, cod_adresa(FK))
ADRESA(cod_adresa#, strada, numar)
ABONAMENT(cod_abonament#, cod_librarie(FK), cod_abonat(FK))
ABONAT(cod_abonat#, nume, cnp, sex)
CONTRACT(cod_contract#, cod_librarie(FK), cod_produs(FK), data_semnatura)
PRODUS(cod_produs#, pret, data_aparitie,)
FILM(cod_film #, cod_produs,pret, data_aparitie, regizor, durata, cod_studio(FK))
CARTE(cod_carte#, cod_produs, pret, data_aparitie, autor, nr_pagini, cod_editura(FK))
RATING(cod_rating#, cod_produs, nota, sursa)
EDITURA(cod_editura#, nume_editura)
STUDIO(cod_studio#, nume_studio)
ACHIZITIE(cod_achizitie#, cod_produs(FK), cod_client(FK),  cod_plata(FK))
CLIENT(cod_client#, nume)
PLATA(cod_plata# tip_plata)

Toate atributele de tip cod sunt de tip INT si accepta doar valori unice si nenule.
Toate atributele de tip nume sunt de tip VARCHAR si nu pot fi goale.
Atributele de tip data(precum data_aparitie si data_infiintare) sunt de tip DATE si trebuie completate.
tip_plata e de tip VARCHAR si trebuie completata.
nota e de tip INT si trebuie completata
sursa e de tip VARCHAR si trebuie completata.
Autorul si regizorul sunt de tip VARCHAR.
cnp si sex sunt de tip sunt de tip VARCHAR. 
