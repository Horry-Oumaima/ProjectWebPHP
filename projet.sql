/***************table Banque***********************************************************************/
create table banque ( nombanque varchar(20) NOT NULL,adresseS varchar(20),primary key nombanque);

insert into banque (nombanque  ,adresseS) values ( 'ATB' ,  'Tunis');
insert into banque (nombanque  ,adresseS) values ( 'STB',  'Tunis');
insert into banque (nombanque  ,adresseS) values ( 'BIAT' ,'Tunis');
insert into banque (nombanque  ,adresseS) values ( 'BH' ,  'Ariana');

/***************************************table Adresse********************************************************/
create table adresse ( idadresse varchar(20) NOT NULL,codepostale INT,ville varchar(20),pays varchar(20), primary key (idadresse));
insert into adresse (idadresse , codepostale , ville , pays ) values ('A1' ,1111, 'Tunis', 'Tunisie' );

insert into adresse (idadresse , codepostale , ville , pays ) values ('A2' ,8000, 'Nabeul', 'Tunisie' );
insert into adresse (idadresse , codepostale , ville , pays ) values ('A3' ,7000, 'Bizerte', 'Tunisie' );

insert into adresse (idadresse , codepostale , ville , pays ) values ('A4' ,1111, 'Tunis', 'Tunisie' );

insert into adresse (idadresse , codepostale , ville , pays ) values ('A5' ,8000, 'Nabeul', 'Tunisie' );
insert into adresse (idadresse , codepostale , ville , pays ) values ('A6' ,7000, 'Bizerte', 'Tunisie' );




/*****************************************************table Agence***************************************************************/
create table agence ( idagence INT NOT NULL, nombanque varchar(20),numtelAG INT, idAdresseAg varchar(20) , primary key (idagence,nombanque),stock float,foreign key (nombanque) REFERENCES banque , foreign key (idAdresseAg) references Adresse  );

insert into agence (idagence , nombanque , numtelAG ,idAdresseAg, stock )  values (111 , 'ATB', 11111111, 'A1' ,100);
insert into agence (idagence , nombanque , numtelAG ,idAdresseAg, stock ) values (222 , 'STB', 22222222 ,'A3' , 200);
insert into agence (idagence , nombanque , numtelAG ,idAdresseAg, stock )  values (333 , 'ATB', 33333333 , 'A4' , 300);
insert into agence (idagence , nombanque , numtelAG ,idAdresseAg, stock )  values (444 , 'STB', 11111111, 'A2' , 400);
insert into agence (idagence , nombanque , numtelAG ,idAdresseAg, stock ) values (555 , 'BIAT', 22222222 ,'A5',500);
insert into agence (idagence , nombanque , numtelAG ,idAdresseAg, stock )  values (666 , 'BH', 33333333 ,'A6',600 );



/*******************************************************Table Materiel***************************************************************/
CREATE TABLE Materiel ( IDMATERIELAG INTEGER,
IDAG INTEGER,
NOMBANQUE VARCHAR2(5),
CODEC VARCHAR2(5),
CODEPC VARCHAR2(5),
CODEVEH VARCHAR2(5), 
primary key(IDMATERIELAG),
foreign key(IDAG,NOMBANQUE) references agence ,
foreign key(CODEC) references compteuse ,
foreign key(CODEPC) references PC , 
foreign key(CODEVEH) references vehicules);

INSERT INTO Materiel (IDMATERIELAG, IDAG, NOMBANQUE, CODEC, CODEPC,CODEVEH ) 
VALUES (1, 111, 'ATB', 'C1', 'Pc1', 'V1');

INSERT INTO Materiel (IDMATERIELAG, IDAG, NOMBANQUE, CODEC, CODEPC, CODEVEH) 
VALUES (2, 222, 'STB', 'C2', 'Pc2', 'V1');

INSERT INTO Materiel (IDMATERIELAG, IDAG, NOMBANQUE, CODEC, CODEPC, CODEVEH) 
VALUES (3, 333, 'ATB', 'C3', 'Pc3', 'V3');

INSERT INTO Materiel (IDMATERIELAG, IDAG, NOMBANQUE, CODEC, CODEPC,CODEVEH) 
VALUES (4, 444, 'STB', 'C4', 'Pc4', 'V4');

INSERT INTO Materiel (IDMATERIELAG, IDAG, NOMBANQUE, CODEC, CODEPC, CODEVEH) 
VALUES (5, 555, 'BIAT', 'C5', 'Pc5', 'V5');



/***************************************************************************table agence_proche*******************************************************************************************************/
create table agence_proche ( idagence INT NOT NULL,nombanquep varchar(20),nombanque varchar(20),idagenceP INT,distance float,primary key (idagenceP,nombanquep,idagence,nombanque),foreign key (idagenceP,nombanquep)references agence,foreign key(idagence,nombanque) references agence) ;

insert into agence_proche ( idagence , nombanquep , nombanque , idagenceP  ,distance ) values (111, 'ATB','ATB', 333 , 20);
insert into agence_proche ( idagence , nombanquep , nombanque, idagenceP ,distance ) values (222, 'STB', 'STB',444 , 50);



/*********************************************************************************table operation*****************************************************************/
CREATE TABLE Operation ( CODEOP VARCHAR2(5),
TYPEOP VARCHAR2(7),
MONTANTOP FLOAT,
DATEOP DATE,
TAUX_INTERET FLOAT,
NUMDEPOT INTEGER,
TAUX_CHANGE FLOAT , primary key (CODEOP) );

INSERT INTO Operation (CODEOP, TYPEOP, MONTANTOP, DATEOP, TAUX_INTERET, NUMDEPOT, TAUX_CHANGE) 
VALUES ('op1', 'Credit', 8000.0, to_date('05/11/2021'), 20.0, NULL, NULL);

INSERT INTO Operation (CODEOP, TYPEOP, MONTANTOP, DATEOP, TAUX_INTERET, NUMDEPOT, TAUX_CHANGE) 
VALUES ('op2', 'Change', 1000.0, to_date('12/01/2022'), NULL, NULL, 3.0);

INSERT INTO Operation (CODEOP, TYPEOP, MONTANTOP, DATEOP, TAUX_INTERET, NUMDEPOT, TAUX_CHANGE) 
VALUES ('op3', 'Deposer', 2000.0, to_date('01/12/2010'), NULL, 10, NULL);

INSERT INTO Operation (CODEOP, TYPEOP, MONTANTOP, DATEOP, TAUX_INTERET, NUMDEPOT, TAUX_CHANGE) 
VALUES ('op4', 'Retrait', 1500.0, to_date('12/05/2020'), NULL, NULL, NULL);

INSERT INTO Operation (CODEOP, TYPEOP, MONTANTOP, DATEOP, TAUX_INTERET, NUMDEPOT, TAUX_CHANGE) 
VALUES ('op5', 'Retrait', 2000.0, to_date('12/06/2021'), NULL, NULL, NULL);



/**************************************************************table compte_operation*****************************************************************/
CREATE TABLE Compte_Op ( CODECOMPTE INTEGER,
CODEOP VARCHAR2(3), primary key (CODECOMPTE,CODEOP), foreign key(CODEOP) references operation );

INSERT INTO Compte_Op(CODECOMPTE, CODEOP) 
VALUES (1, 'op1');

INSERT INTO Compte_Op(CODECOMPTE, CODEOP) 
VALUES (1, 'op2');

INSERT INTO Compte_Op(CODECOMPTE, CODEOP) 
VALUES (2, 'op1');

INSERT INTO Compte_Op (CODECOMPTE, CODEOP) 
VALUES (2, 'op2');

INSERT INTO Compte_Op (CODECOMPTE, CODEOP) 
VALUES (3, 'op1');



/***************************************************************************table distributeur*******************************************************************************/
CREATE TABLE Distribiteur ( CODEDISTR VARCHAR2(5),
CAPACITE INTEGER , primary key (CODEDISTR) );

INSERT INTO Distribiteur (CODEDISTR, CAPACITE) 
VALUES ('D1', 10000);

INSERT INTO Distribiteur (CODEDISTR, CAPACITE) 
VALUES ('D2', 15000);

INSERT INTO Distribiteur (CODEDISTR, CAPACITE) 
VALUES ('D3', 20000);

INSERT INTO Distribiteur (CODEDISTR, CAPACITE) 
VALUES ('D4', 10000);

INSERT INTO Distribiteur (CODEDISTR, CAPACITE) 
VALUES ('D5', 20000);

INSERT INTO Distribiteur (CODEDISTR, CAPACITE) 
VALUES ('D6', 15000);



/**********************************************table compteuse**************************************************************************/
INSERT INTO Compteuse (CODEC, MARQUEC) 
VALUES ('C1', 'SAFESCAN');

INSERT INTO Compteuse (CODEC, MARQUEC) 
VALUES ('C2', 'AIBECY');

INSERT INTO Compteuse (CODEC, MARQUEC) 
VALUES ('C3', 'AIBECY');

INSERT INTO Compteuse (CODEC, MARQUEC) 
VALUES ('C4', 'MONEPASS');

INSERT INTO Compteuse (CODEC, MARQUEC) 
VALUES ('C5', 'MONPASS');

INSERT INTO Compteuse (CODEC, MARQUEC) 
VALUES ('C6', 'MONPASS');


/**********************************************table organisation***************************************************************/
CREATE TABLE Organisation ( IDCLIENTO VARCHAR2(5),
NUMTELO VARCHAR2(11),
RAISONSS VARCHAR2(20),
CHIFFREAFF INTEGER,
IDADRESSEO VARCHAR2(5),  primary key (IDCLIENTO) , foreign key(IDADRESSEO) references adresse);

INSERT INTO Organisation (IDCLIENTO, NUMTELO, RAISONSS, CHIFFREAFF, IDADRESSEO) 
VALUES ('O1', '11111111', 'Delice', 1000, 'A1');

INSERT INTO Organisation (IDCLIENTO, NUMTELO, RAISONSS, CHIFFREAFF, IDADRESSEO) 
VALUES ('O2', '33333333', 'papillon', 2000, 'A2');

INSERT INTO Organisation (IDCLIENTO, NUMTELO, RAISONSS, CHIFFREAFF, IDADRESSEO) 
VALUES ('O3', '22222222', 'saida', 3000, 'A3');


/**********************************************************table personne************************************************************************/
CREATE TABLE Personne ( IDCLIENTP VARCHAR2(5),
NUMTELCL VARCHAR2(11),
CIN VARCHAR2(5),
NOMCL VARCHAR2(9),
PRENOMCL VARCHAR2(7),
SEXECL VARCHAR2(5),
DATENAISSCL DATE,
FONCTIONCL VARCHAR2(11),
ETATCIVILCL VARCHAR2(11),
IDADRESSCL VARCHAR2(5), Primary key (IDCLIENTP), foreign key (IDADRESSCL) references  adresse);

INSERT INTO Personne (IDCLIENTP, NUMTELCL, CIN, NOMCL, PRENOMCL, SEXECL, DATENAISSCL, FONCTIONCL, ETATCIVILCL, IDADRESSCL) 
VALUES ('C1', '11111111', '100', 'horry', 'Ismail', 'M', to_date('04/02/2000'), 'Directeur ', 'celibataire', 'A4');

INSERT INTO Personne (IDCLIENTP, NUMTELCL, CIN, NOMCL, PRENOMCL, SEXECL, DATENAISSCL, FONCTIONCL, ETATCIVILCL, IDADRESSCL) 
VALUES ('C2', '22222222', '200', 'Magri ', 'Yacine', 'M', to_date('11/11/1950'), 'Enseignant ', 'Marie', 'A5');

INSERT INTO Personne (IDCLIENTP, NUMTELCL, CIN, NOMCL, PRENOMCL, SEXECL, DATENAISSCL, FONCTIONCL, ETATCIVILCL, IDADRESSCL) 
VALUES ('C3', '44444444', '300', 'Horry', 'Oumaima', 'F', to_date('11/07/1960'), 'Ingenieure', 'celibataire', 'A6');




/**************************************************************************table compte_bancaire************************************************************************************/
CREATE TABLE Compte_Bancaire ( CODECOMPTE FLOAT,
SOLDE FLOAT,
ENGAGEMENT FLOAT,
DECOUVERT FLOAT,
IDAG INTEGER,
NOMBANQUE VARCHAR2(10),
IDCLIENTP varchar(20),
IDCLIENTO VARCHAR2(4), primary key (CODECOMPTE), foreign key(IDAG,NOMBANQUE) references agence, foreign key (IDCLIENTP) references personne , foreign key (IDCLIENTO) references organisation );

INSERT INTO Compte_Bancaire (CODECOMPTE, SOLDE, ENGAGEMENT, DECOUVERT, IDAG, NOMBANQUE, IDCLIENTP, IDCLIENTO) 
VALUES (11.0, 200.0, 100.0, 9 , 666, 'BH', 'C1' , 'O2');

INSERT INTO Compte_Bancaire (CODECOMPTE, SOLDE, ENGAGEMENT, DECOUVERT, IDAG, NOMBANQUE, IDCLIENTP, IDCLIENTO) 
VALUES (2.0, 100.0, 50.0, NULL, 111, 'ATB', 'C2', NULL);

INSERT INTO Compte_Bancaire (CODECOMPTE, SOLDE, ENGAGEMENT, DECOUVERT, IDAG, NOMBANQUE, IDCLIENTP, IDCLIENTO) 
VALUES (3.0, 1000.0, 30.0, NULL,222, 'STB', 'C3', NULL);

INSERT INTO Compte_Bancaire (CODECOMPTE, SOLDE, ENGAGEMENT, DECOUVERT, IDAG, NOMBANQUE, IDCLIENTP, IDCLIENTO) 
VALUES (4.0, 150.0, NULL, 10.0, 444, 'STB', NULL, 'O1');

INSERT INTO Compte_Bancaire (CODECOMPTE, SOLDE, ENGAGEMENT, DECOUVERT, IDAG, NOMBANQUE, IDCLIENTP, IDCLIENTO) 
VALUES (5.0, 300.0, NULL, 20.0, 555, 'BIAT', NULL, 'O2');








/******************************************************************************table vehicules*************************************************************************/
CREATE TABLE Vehicules ( CODEVEH VARCHAR2(5),
MATRICULE VARCHAR2(9),
MARQUEV VARCHAR2(10), primary key(CODEVEH));

INSERT INTO Vehicules (CODEVEH, MATRICULE, MARQUEV) 
VALUES ('V1', 'A111', 'RENAULT');

INSERT INTO Vehicules (CODEVEH, MATRICULE, MARQUEV) 
VALUES ('V2', 'B112', 'VOLSEWAGEN');

INSERT INTO Vehicules (CODEVEH, MATRICULE, MARQUEV) 
VALUES ('V3', 'C113', 'KIA');

INSERT INTO Vehicules (CODEVEH, MATRICULE, MARQUEV) 
VALUES ('V4', 'D114', 'FIAT');

INSERT INTO Vehicules (CODEVEH, MATRICULE, MARQUEV) 
VALUES ('V5', 'E115', 'AUDI');





/********************************************************************************table carte_bancaire****************************************************************************/
CREATE TABLE Carte_Bancaire ( CODECARTE INTEGER,
TYPE_ VARCHAR2(10), primary key(CODECARTE) );

INSERT INTO Carte_Bancaire (CODECARTE, TYPE_) 
VALUES (11, 'MasterCard');

INSERT INTO Carte_Bancaire (CODECARTE, TYPE_) 
VALUES (22, 'MasterCard');

INSERT INTO Carte_Bancaire (CODECARTE, TYPE_) 
VALUES (33, 'Visa');

INSERT INTO Carte_Bancaire (CODECARTE, TYPE_) 
VALUES (44, 'Gold');



/*****************************************************************************************************table pc**************************************************************************/
CREATE TABLE Pc ( CODEPC VARCHAR2(5),
MARQUEPC VARCHAR2(6),
PUISSANCE INTEGER , primary key (CODEPC));

INSERT INTO Pc (CODEPC, MARQUEPC, PUISSANCE) 
VALUES ('Pc1', 'dell', 5000.0);

INSERT INTO Pc (CODEPC, MARQUEPC, PUISSANCE) 
VALUES ('Pc2', 'hp', 5000.0);

INSERT INTO Pc (CODEPC, MARQUEPC, PUISSANCE) 
VALUES ('Pc3', 'msi', 7000.0);

INSERT INTO Pc (CODEPC, MARQUEPC, PUISSANCE) 
VALUES ('Pc4', 'msi', 7000.0);

INSERT INTO Pc (CODEPC, MARQUEPC, PUISSANCE) 
VALUES ('Pc5', 'lenovo', 5000.0);




/**************************************************************************table retrait_distributeur*******************************************************************************/
CREATE TABLE Retrait_Distributeur ( CODERET VARCHAR2(5),
CODEOP VARCHAR2(6),
CODECARTE INTEGER,
CODEDISTR VARCHAR2(6) ,Primary Key (CODERET) );

INSERT INTO Retrait_Distributeur (CODERET, CODEOP, CODECARTE, CODEDISTR) 
VALUES ('R1', 'Op4', 11, 'D1');

INSERT INTO Retrait_Distributeur (CODERET, CODEOP, CODECARTE, CODEDISTR) 
VALUES ('R2', 'Op5', 22, 'D2');











/**********************************Dans cette table on a une erreur : table or view does not exist!!!!************************************************************/
/*create table personnel ( idpersonel INT NOT NULL ,
nomP varchar(20),
prenomP varchar(20),
numtelP varchar(20),
sexeP char(5) , 
fonctionP varchar(20),
idadresseP varchar(20) ,
idchefagence INT ,
idagence INT,
nombanque varchar(20),
primary key( idpersonel),
foreign key (idadresseP) REFERENCES adresse,
foreign key( idchefagence) REFERENCES personel,
foreign key (idagence,nombanque) REFERENCES agence );
insert into personnel (idpersonel , nomP, prenomP, numtelP, sexeP , fonctionP, idadresseP , idchefagence, idagence, nombanque) values ( 1 , 'Dridi' , 'Yacine' , '11111111' , 'M' , 'Chef_agence' ,'A1', NULL , 111 , 'ATB' ); 

insert into personnel (idpersonel , nomP, prenomP,numtelP, sexeP, datenaisP, fonctionP, idadresseP , idchefagence,idagence, nombanque) values ( 2 , 'Magri4 , 'Ali' , 22222222 , 'M' , "1990/11/11" , 'cadre' ,'P1’  , 111 ,’ATB’ );
insert into personnel (idpersonel , nomP, prenomP,numtelP, sexeP, datenaisP, fonctionP, idadresseP , idchefagence,idagence, nombanque) values ( ‘P3’ , ‘Boulabiar’ , ‘Baha’ , ‘33333333’, ‘M’ , 2000/10/10,’chef agence   ‘ , NULL , 222 ,’STB’ ); 
idadresseP , idchefagence,idagence, nombanque) values ( ‘P4’ , ‘Boulabiar’ , ‘Maha’ , ‘44444444’ ’, F’ , 2000/10/09 ,’ingénieure ‘ , ‘P3’ , 222 ,’STB’ ); */







select idagenceP from  agence_proche
where (idagence=111)
and (distance<=30);






select count(*) from distribiteur 
where (capacite>15000);


select count(*) from organisation
where (chiffreaff>1000);


select count(*) from banque 
where (adresses='Tunis');







select * from carte_bancaire c , retrait_distributeur r
where (c.codecarte=r.codecarte)
and (c.type_='MasterCard');



select * from agence
where stock in (select max(stock) from agence);


select idclientp, datenaisscl from personne 
order by datenaisscl DESC ;




select * 
from compte_op join operation ON (operation.codeop = compte_op.codeop) ;



select codepc , marquepc, puissance 
from pc
group by (codepc , marquepc,puissance)
having (puissance>5000);


select codecompte , solde from compte_bancaire
where ( solde < ALL(select solde
                      from compte_bancaire 
                       where codecompte=3));


select codeop , typeop , dateop
from operation where exists (select * from operation
                                   where dateop >'01/12/2010'
                                   );



select codecompte from compte_bancaire c1
where not exists (select codecompte from compte_op o
                         where not exists (select * from  compte_bancaire c2
                         where c2.codecompte=c1.codecompte and c2.codecompte=c1.codecompte));
                         
                         