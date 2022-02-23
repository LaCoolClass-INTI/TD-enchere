----Création table 

CREATE TABLE Adresse (
id_adresse int IDENTITY PRIMARY KEY,
rue varchar(30) NOT NULL,
cp int NOT NULL,
ville varchar(20) NOT NULL
);
SELECT * FROM Adresse

----- Insertion données

insert into Adresse values('12 rue des peupliers', 31300, 'toulouse');
insert into Adresse values('60 rue des roses', 31200, 'toulouse');
insert into Adresse values('360 rue des tulipes', 31000, 'toulouse');
insert into Adresse values('5 rue des chrysantèmes', 31400, 'toulouse');

CREATE TABLE PERSONNE (
email varchar(40) PRIMARY KEY,
mdp varchar(40),
nom varchar(20) NOT NULL,
prenom varchar(20) NOT NULL,
lieu_naissance varchar(30),
id_adresse int FOREIGN KEY (id_adresse) REFERENCES ADRESSE,
);

SELECT * FROM PERSONNE

insert into PERSONNE values('toto@hotmail.com', 'motdepasse', 'Dupond', 'Léo', 'Toulouse', 1);
insert into PERSONNE values('leadubois@hotmail.com', '123456', 'Dubois', 'Léa', 'Marseille', 2);
insert into PERSONNE values('duchampsléon@hotmail.com', 'duchampion', 'Duchamps', 'léon', 'Istres', 3);
insert into PERSONNE values('léontineducoin@hotmail.com', 'leocoin', 'Ducoin', 'Léontine', 'Auch', 4);


CREATE TABLE OBJET (
id_objet int not null identity primary key,
email varchar(40) not null,
categorie varchar(100) not null,
intitule varchar (100) not null,
[description] varchar (200) not null,
prix_initial float not null,
debut_vente datetime not null,
duree_vente int not null,
photo varchar(100),
foreign key (email) references PERSONNE(email),
);
SELECT * FROM OBJET

insert into OBJET values('toto@hotmail.com', 'voiture', 'clio', 'clio 2 avec siège en cuir et bas de caisse tuning', 15000, '20221231 18:00.00', 2, '');
insert into OBJET values('leadubois@hotmail.com', 'Electroménager', 'Frigo', 'frigo siemens datant de 1930, tbe quelques moisissures, objet collector', 200, '20220112 20:30.00', 7, '');
insert into OBJET values('toto@hotmail.com', 'Vetement', 'Robe', 'Robe gucci noire idéale pour soirées sandwich lablabi', 450, '20220225 07:15.00', 5, '');

create table jointurepersonneobjet (
prix_proposé float not null,
date_proposition datetime not null,
id_vendeur varchar(40) not null,
id_acheteur varchar(40) not null,
id_objet int not null,
primary key (id_vendeur, id_acheteur, id_objet, prix_proposé),
foreign key (id_vendeur) references PERSONNE(email),
foreign key (id_acheteur) references Personne(email),
foreign key (id_objet) references Objet(id_objet),
);
insert into jointurepersonneobjet values(16000, '20221231 20:00.00', 'toto@hotmail.com', 'leadubois@hotmail.com', 4);
insert into jointurepersonneobjet values(16000, '20221231 20:00.00', 'toto@hotmail.com', 'leadubois@hotmail.com', 4);
insert into jointurepersonneobjet values(16001, '20220101 21:00.00', 'leadubois@hotmail.com','duchampsléon@hotmail.com',3);
insert into jointurepersonneobjet values(200, '20220112 22:00.00', 'léontineducoin@hotmail.com','toto@hotmail.com',5);

SELECT * FROM jointurepersonneobjet
