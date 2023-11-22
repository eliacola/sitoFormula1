create database formula1;
use formula1;

create table PILOTA(
    numero int check (numero<=100) primary key,
    nome char(20),
    cognome char(20),
    nazionalita char(20),
    data_di_nascita date
);

create table GRANPREMIO(
    nome char(50) primary key,
    dataGP date,
    circuito char(50),
    nazione char(20)
);

create table TEAM(
    nome char(30) primary key,
    sede char(30),
    nazionalita char(30),
    team_principal char(50)
);

create table FIA(
    ID char(5) primary key,
    nome char(20),
    cognome char(20),
    ruolo char(50)
);

create table MACCHINA(
    nome char(10) primary key,
    power_unit char(20)
);

create table CLASSIFICA(
    numero int CHECK (numero<=100) references PILOTA(numero),
    nome char(20) references PILOTA(nome),
    cognome char(20) references PILOTA(cognome),
    posizione int,
    punti int,
    data_agg date,
    primary key(numero, data_agg)
    
);

create table PARTECIPAZIONE(
id int auto_increment primary key,
    pilota_id int,
    gran_premio_id char(50),
    posizione int,
    punteggio int check (punteggio<=25),
    data_agg date,
    foreign key (pilota_id) references PILOTA(numero),
    foreign key (gran_premio_id) references GRANPREMIO(nome)
);

create table APPARTENENZA(
id int auto_increment primary key,
pilota_id int,
team char(30),
data_inizio_appartenenza date,
foreign key (pilota_id) references PILOTA(numero),
foreign key (team) references TEAM(nome)
);

create table ORGANIZZAZIONE(
id int auto_increment primary key,
nome_gp char(50),
data_gp date,
id_fia char(5),
ruolo char(50),
foreign key(data_gp) references GRANPREMIO(dataGP),
foreign key(id_fia)references FIA(ID)
);
alter table organizzazione
add constraint FK_data_gp
foreign key (data_gp) references granpremio(dataGP);

create table COSTRUZIONE(
id int auto_increment primary key,
nome_macchina char(10),
nome_team char(30),
data_uscita date,
foreign key(nome_macchina) references MACCHINA(nome),
foreign key(nome_team) references TEAM(nome)
);

-- Inserimento nella tabella PILOTA
INSERT INTO PILOTA (numero, nome, cognome, nazionalita, data_di_nascita)
VALUES
    ('16', 'Charles', 'Leclerc', 'Monaco', '1997-10-16'),
    ('33', 'Max', 'Verstappen', 'Olanda', '1997-09-30'),
    ('44', 'Lewis', 'Hamilton', 'Gran Bretagna', '1985-01-07'),
    ('55', 'Carlos', 'Sainz', 'Spagna', '1994-09-01'),
    ('63', 'George', 'Russell', 'Gran Bretagna', '1998-02-15'),
    ('11', 'Sergio', 'Perez', 'Messico', '1990-01-26'),
    ('14', 'Fernando', 'Alonso', 'Spagna', '1981-07-29'),
    ('18', 'Lance', 'Stroll', 'Canada', '1998-10-29'),
    ('77', 'Valtteri', 'Bottas', 'Finlandia', '1989-08-28'),
    ('24', 'Zhou', 'Guanyu', 'Cina', '1999-05-30'),
    ('10', 'Pierre', 'Gasly', 'France', '1996-02-07'),
    ('31', 'Esteban', 'Ocon', 'France', '1996-09-17');



-- Inserimento nella tabella GRANPREMIO
INSERT INTO GRANPREMIO (nome, dataGP, circuito, nazione)
VALUES
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'Bahrain International Circuit', 'Bahrain'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'Jeddah Corniche Circuit', 'Arabia Saudita'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'Albert Park', 'Australia'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'Baku City Circuit', 'Azerbaijan'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'Miami International Autodrome', 'Stati Uniti'),
    ('GRAN PREMIO DELL EMILIA ROMAGNA', '2023-05-21', 'Autodromo Enzo e Dino Ferrari', 'Italia'),
    ('GRAND PRIX DE MONACO', '2023-05-28', 'Circuit de Monaco', 'Monaco'),
    ('AWS GRAN PREMIO DE ESPANA', '2023-06-04', 'Circuit de Barcelona-Catalunya', 'Spagna'),
    ('PIRELLI GRAND PRIX DU CANADA', '2023-06-18', 'Circuit Gilles Villeneuve', 'Canada'),
    ('ROLEX GROSSER PREIS VON OSTERREICH', '2023-07-02', 'Red Bull Ring', 'Austria'),
    ('ARAMCO BRITISH GRAND PRIX', '2023-07-09', 'Silverstone Circuit', 'Gran Bretagna'),
    ('QATAR AIRWAYS HUNGARIAN GRAND PRIX', '2023-07-23', 'Hungaroring', 'Ungheria'),
    ('MSC CRUISES BELGIAN GRAND PRIX', '2023-07-30', 'Circuit de Spa-Francorchamps', 'Belgio'),
    ('HEINEKEN DUTCH GRAND PRIX', '2023-08-27', 'Circuit Zandvoort', 'Olanda'),
    ('PIRELLI GRAN PREMIO D ITALIA', '2023-09-03', 'Autodromo Nazionale Monza', 'Italia'),
    ('SINGAPORE AIRLINES SINGAPORE GRAND PRIX', '2023-09-17', 'Marina Bay Street Circuit', 'Singapore'),
    ('LENOVO JAPANESE GRAND PRIX', '2023-09-24', 'Suzuka International Racing Course', 'Giappone'),
    ('QATAR AIRWAYS QATAR GRAND PRIX', '2023-10-08', 'Lusail International Circuit', 'Qatar'),
    ('LENOVO UNITED STATES GRAND PRIX', '2023-10-22', 'Circuit of the Americas', 'Stati Uniti'),
    ('GRAN PREMIO DE LA CIUDAD DE MEXICO', '2023-10-29', 'Autodromo Hermanos Rodriguez', 'Messico'),
    ('ROLEX GRANDE PREMIO DE SAO PAULO', '2023-11-05', 'Autodromo Jose Carlos Pace', 'Brasile'),
    ('HEINEKEN SILVER LAS VEGAS GRAND PRIX', '2023-11-19', 'Las Vegas', 'Stati Uniti'),
    ('ETIHAD AIRWAYS ABU DHABI GRAND PRIX', '2023-11-26', 'Yas Marina Circuit', 'Emirati Arabi Uniti');
   
   
-- Inserimento nella tabella TEAM
INSERT INTO TEAM (nome, sede, nazionalita, team_principal)
VALUES
    ('Scuderia Ferrari', 'Maranello', 'Italia', 'Frederic Vasseur'),
    ('Alfa Romeo F1 Team Stake', 'Hinwil', 'Svizzera', 'Alessandro Alunni Bravi'),
    ('Mercedes-AMG PETRONAS F1 Team', 'Brackley', 'Germania', 'Toto Wolff'),
    ('Oracle Red Bull Racing', 'Milton Keynes', 'Austria', 'Christian Horner'),
    ('BWT Alpine F1 Team', 'Enstone', 'Francia', 'Bruno Famin'),
    ('Aston Martin F1 Team', 'Silverstone', 'Gran Bretagna', 'Mike Krack');

-- Inserimento nella tabella MACCHINA
INSERT INTO MACCHINA (nome, power_unit)
VALUES
    ('AMR23', 'Mercedes'),
    ('W14', 'Mercedes'),
    ('RB19', 'Honda RBPT'),
    ('C43', 'Ferrari'),
    ('SF23', 'Ferrari'),
    ('A523', 'Renault');
    
    

-- Inserimento nella tabella FIA
INSERT INTO FIA (ID, nome, cognome, ruolo)
VALUES
    ('TEC01', 'Jo', 'Bauer', 'Delegato tecnico'),
    ('TEC02', 'Laura', 'Wilson', 'Delegato tecnico'),
    ('TEC03', 'Daniel', 'Evans', 'Delegato tecnico'),
    ('PSC01', 'Bernd', 'Maylander', 'Pilota Safety Car'),
    ('STE01', 'Garry', 'Connelly', 'Steward'),
    ('STE02', 'Felix', 'Holter', 'Steward'),
    ('STE03', 'David', 'Domingo', 'Steward'),
    ('STE04', 'Emanuele', 'Pirro', 'Steward'),
    ('STE05', 'Derek', 'Warwick', 'Steward'),
    ('PMC01', 'Alan', 'Van Der Merwe', 'Pilota Medical Car'),
    ('MED01', 'Gary', 'Hartstein', 'Delegato medico'),
    ('MED02', 'Ian', 'Roberts', 'Delegato medico'),
	('MED03', 'Andrew', 'Green', 'Delegato medico'),
	('MED04', 'Alan', 'Jones', 'Delegato medico'),
    ('DIR01', 'Niels', 'Wittich', 'Direttore di gara'),
    ('DIR02', 'Michael', 'Masi', 'Direttore di gara'),
    ('REL01', 'David', 'Coulthard', 'Delegato ai media'),
    ('REL02', 'Jenson', 'Button', 'Delegato ai media'),
	('REL03', 'Mark', 'Webber', 'Delegato ai media'),
    ('SIC01', 'Thiago', 'Monteiro', 'Delegato alla sicurezza'),
	('SIC02', 'Jody', 'Hulme', 'Delegato alla sicurezza'),
	('SIC03', 'Graham', 'Watson', 'Delegato alla sicurezza');
 
-- Inizializzazione della tabella CLASSIFICA
INSERT INTO CLASSIFICA (numero, nome, cognome, posizione, punti, data_agg)
VALUES
    ('16', 'Charles', 'Leclerc', '1', '0','2023-01-01'),
    ('33', 'Max', 'Verstappen', '1', '0','2023-01-01'),
    ('44', 'Lewis', 'Hamilton', '1', '0', '2023-01-01'),
    ('55', 'Carlos', 'Sainz', '1', '0', '2023-01-01'),
    ('63', 'George', 'Russell', '1', '0','2023-01-01'),
    ('11', 'Sergio', 'Perez', '1', '0', '2023-01-01'),
    ('14', 'Fernando', 'Alonso', '1', '0', '2023-01-01'),
    ('18', 'Lance', 'Stroll', '1', '0', '2023-01-01'),
    ('77', 'Valtteri', 'Bottas', '1', '0', '2023-01-01'),
    ('24', 'Zhou', 'Guanyu', '1', '0', '2023-01-01'),
    ('10', 'Pierre', 'Gasly', '1', '0', '2023-01-01'),
    ('31', 'Esteban', 'Ocon', '1', '0', '2023-01-01');


INSERT INTO PARTECIPAZIONE (pilota_id, gran_premio_id, posizione, punteggio, data_agg)
VALUES
    (16, 'GULF AIR BAHRAIN GRAND PRIX', 2, 18, '2023-03-05'),
    (33, 'GULF AIR BAHRAIN GRAND PRIX', 1, 25, '2023-03-05'),
    (44, 'GULF AIR BAHRAIN GRAND PRIX', 5, 10, '2023-03-05'),
    (55, 'GULF AIR BAHRAIN GRAND PRIX', 3, 15, '2023-03-05'),
    (63, 'GULF AIR BAHRAIN GRAND PRIX', 7, 6, '2023-03-05'),
    (11, 'GULF AIR BAHRAIN GRAND PRIX', 4, 12, '2023-03-05'),
    (14, 'GULF AIR BAHRAIN GRAND PRIX', 9, 2, '2023-03-05'),
    (18, 'GULF AIR BAHRAIN GRAND PRIX', 6, 8, '2023-03-05'),
    (24, 'GULF AIR BAHRAIN GRAND PRIX', 10, 1, '2023-03-05'),
    (77, 'GULF AIR BAHRAIN GRAND PRIX', 8, 4, '2023-03-05'),
    (10, 'GULF AIR BAHRAIN GRAND PRIX', 11, 0, '2023-03-05'),
    (31, 'GULF AIR BAHRAIN GRAND PRIX', 12, 0, '2023-03-05'),
    (16, 'STC SAUDI ARABIAN GRAND PRIX', 6, 8, '2023-03-19'),
    (33, 'STC SAUDI ARABIAN GRAND PRIX', 3, 15, '2023-03-19'),
    (44, 'STC SAUDI ARABIAN GRAND PRIX', 2, 18, '2023-03-19'),
    (55, 'STC SAUDI ARABIAN GRAND PRIX', 1, 25, '2023-03-19'),
    (63, 'STC SAUDI ARABIAN GRAND PRIX', 7, 6, '2023-03-19'),
    (11, 'STC SAUDI ARABIAN GRAND PRIX', 4, 12, '2023-03-19'),
    (14, 'STC SAUDI ARABIAN GRAND PRIX', 5, 10, '2023-03-19'),
    (18, 'STC SAUDI ARABIAN GRAND PRIX', 8, 4, '2023-03-19'),
    (24, 'STC SAUDI ARABIAN GRAND PRIX', 10, 1, '2023-03-19'),
    (77, 'STC SAUDI ARABIAN GRAND PRIX', 9, 2, '2023-03-19'),
    (10, 'STC SAUDI ARABIAN GRAND PRIX', 12, 0, '2023-03-19'),
    (31, 'STC SAUDI ARABIAN GRAND PRIX', 11, 0, '2023-03-19'),
    (16, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 1, 25, '2023-04-02'),
    (33, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 12, 0, '2023-04-02'),
    (44, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 10, 1, '2023-04-02'),
    (55, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 5, 10, '2023-04-02'),
    (63, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 2, 18, '2023-04-02'),
    (11, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 4, 12, '2023-04-02'),
    (14, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 6, 8, '2023-04-02'),
    (18, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 11, 0, '2023-04-02'),
    (24, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 8, 4, '2023-04-02'),
    (77, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 9, 2, '2023-04-02'),
    (10, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 7, 6, '2023-04-02'),
    (31, 'ROLEX AUSTRALIAN GRAND PRIX 2023', 3, 15, '2023-04-02'),
	(16, 'AZERBAIJAN GRAND PRIX', 2, 18, '2023-04-30'),
    (33, 'AZERBAIJAN GRAND PRIX', 1, 25, '2023-04-30'),
    (44, 'AZERBAIJAN GRAND PRIX', 7, 6, '2023-04-30'),
    (55, 'AZERBAIJAN GRAND PRIX', 5, 10, '2023-04-30'),
    (63, 'AZERBAIJAN GRAND PRIX', 4, 12, '2023-04-30'),
    (11, 'AZERBAIJAN GRAND PRIX', 3, 15, '2023-04-30'),
    (14, 'AZERBAIJAN GRAND PRIX', 10, 1, '2023-04-30'),
    (18, 'AZERBAIJAN GRAND PRIX', 8, 4, '2023-04-30'),
    (24, 'AZERBAIJAN GRAND PRIX', 11, 0, '2023-04-30'),
    (77, 'AZERBAIJAN GRAND PRIX', 9, 2, '2023-04-30'),
    (10, 'AZERBAIJAN GRAND PRIX', 6, 8, '2023-04-30'),
    (31, 'AZERBAIJAN GRAND PRIX', 12, 0, '2023-04-30'),
    (16, 'CRYPTO.COM MIAMI GRAND PRIX', 2, 18, '2023-05-07'),
    (44, 'CRYPTO.COM MIAMI GRAND PRIX', 1, 25, '2023-05-07'),
    (33, 'CRYPTO.COM MIAMI GRAND PRIX', 3, 15, '2023-05-07'),
    (55, 'CRYPTO.COM MIAMI GRAND PRIX', 10, 1, '2023-05-07'),
    (63, 'CRYPTO.COM MIAMI GRAND PRIX', 4, 12, '2023-05-07'),
    (11, 'CRYPTO.COM MIAMI GRAND PRIX', 11, 0, '2023-05-07'),
    (14, 'CRYPTO.COM MIAMI GRAND PRIX', 12, 0, '2023-05-07'),
    (18, 'CRYPTO.COM MIAMI GRAND PRIX', 7, 6, '2023-05-07'),
    (24, 'CRYPTO.COM MIAMI GRAND PRIX', 9, 2, '2023-05-07'),
    (77, 'CRYPTO.COM MIAMI GRAND PRIX', 8, 4, '2023-05-07'),
    (10, 'CRYPTO.COM MIAMI GRAND PRIX', 6, 8, '2023-05-07'),
    (31, 'CRYPTO.COM MIAMI GRAND PRIX', 5, 10, '2023-05-07'),
    (16, 'GRAN PREMIO DELL EMILIA ROMAGNA', 3, 15, '2023-05-21'),
    (44, 'GRAN PREMIO DELL EMILIA ROMAGNA', 10, 1, '2023-05-21'),
    (33, 'GRAN PREMIO DELL EMILIA ROMAGNA', 2, 18, '2023-05-21'),
    (55, 'GRAN PREMIO DELL EMILIA ROMAGNA', 5, 10, '2023-05-21'),
    (63, 'GRAN PREMIO DELL EMILIA ROMAGNA', 1, 25, '2023-05-21'),
    (11, 'GRAN PREMIO DELL EMILIA ROMAGNA', 8, 4, '2023-05-21'),
    (14, 'GRAN PREMIO DELL EMILIA ROMAGNA', 4, 12, '2023-05-21'),
    (18, 'GRAN PREMIO DELL EMILIA ROMAGNA', 12, 0, '2023-05-21'),
    (24, 'GRAN PREMIO DELL EMILIA ROMAGNA', 7, 6, '2023-05-21'),
    (77, 'GRAN PREMIO DELL EMILIA ROMAGNA', 11, 0, '2023-05-21'),
    (10, 'GRAN PREMIO DELL EMILIA ROMAGNA', 9, 2, '2023-05-21'),
    (31, 'GRAN PREMIO DELL EMILIA ROMAGNA', 6, 8, '2023-05-21'),
    (16, 'GRAND PRIX DE MONACO', 1, 25, '2023-05-28'),
    (44, 'GRAND PRIX DE MONACO', 7, 6, '2023-05-28'),
    (33, 'GRAND PRIX DE MONACO', 3, 15, '2023-05-28'),
    (55, 'GRAND PRIX DE MONACO', 2, 18, '2023-05-28'),
    (63, 'GRAND PRIX DE MONACO', 5, 10, '2023-05-28'),
    (11, 'GRAND PRIX DE MONACO', 4, 12, '2023-05-28'),
    (14, 'GRAND PRIX DE MONACO', 6, 8, '2023-05-28'),
    (18, 'GRAND PRIX DE MONACO', 8, 4, '2023-05-28'),
    (24, 'GRAND PRIX DE MONACO', 11, 0, '2023-05-28'),
    (77, 'GRAND PRIX DE MONACO', 10, 1, '2023-05-28'),
    (10, 'GRAND PRIX DE MONACO', 12, 0, '2023-05-28'),
    (31, 'GRAND PRIX DE MONACO', 9, 2, '2023-05-28'),
    (16, 'AWS GRAN PREMIO DE ESPANA', 1, 25, '2023-06-04'),
    (44, 'AWS GRAN PREMIO DE ESPANA', 7, 6, '2023-06-04'),
    (33, 'AWS GRAN PREMIO DE ESPANA', 3, 15, '2023-06-04'),
    (55, 'AWS GRAN PREMIO DE ESPANA', 2, 18, '2023-06-04'),
    (63, 'AWS GRAN PREMIO DE ESPANA', 5, 10, '2023-06-04'),
    (11, 'AWS GRAN PREMIO DE ESPANA', 4, 12, '2023-06-04'),
    (14, 'AWS GRAN PREMIO DE ESPANA', 6, 8, '2023-06-04'),
    (18, 'AWS GRAN PREMIO DE ESPANA', 8, 4, '2023-06-04'),
    (24, 'AWS GRAN PREMIO DE ESPANA', 11, 0, '2023-06-04'),
    (77, 'AWS GRAN PREMIO DE ESPANA', 10, 1, '2023-06-04'),
    (10, 'AWS GRAN PREMIO DE ESPANA', 12, 0, '2023-06-04'),
    (31, 'AWS GRAN PREMIO DE ESPANA', 9, 2, '2023-06-04'),
    (16, 'PIRELLI GRAND PRIX DU CANADA', 1, 25, '2023-06-18'),
    (44, 'PIRELLI GRAND PRIX DU CANADA', 7, 6, '2023-06-18'),
    (33, 'PIRELLI GRAND PRIX DU CANADA', 3, 15, '2023-06-18'),
    (55, 'PIRELLI GRAND PRIX DU CANADA', 2, 18, '2023-06-18'),
    (63, 'PIRELLI GRAND PRIX DU CANADA', 5, 10, '2023-06-18'),
    (11, 'PIRELLI GRAND PRIX DU CANADA', 4, 12, '2023-06-18'),
    (14, 'PIRELLI GRAND PRIX DU CANADA', 6, 8, '2023-06-18'),
    (18, 'PIRELLI GRAND PRIX DU CANADA', 8, 4, '2023-06-18'),
    (24, 'PIRELLI GRAND PRIX DU CANADA', 11, 0, '2023-06-18'),
    (77, 'PIRELLI GRAND PRIX DU CANADA', 10, 1, '2023-06-18'),
    (10, 'PIRELLI GRAND PRIX DU CANADA', 12, 0, '2023-06-18'),
    (31, 'PIRELLI GRAND PRIX DU CANADA', 9, 2, '2023-06-18');
    
    INSERT INTO PARTECIPAZIONE (pilota_id, gran_premio_id, posizione, punteggio, data_agg)
VALUES
    (16, 'ROLEX GROSSER PREIS VON OSTERREICH', 5, 10, '2023-07-02'),
    (44, 'ROLEX GROSSER PREIS VON OSTERREICH', 4, 12, '2023-07-02'),
    (33, 'ROLEX GROSSER PREIS VON OSTERREICH', 1, 25, '2023-07-02'),
    (55, 'ROLEX GROSSER PREIS VON OSTERREICH', 6, 8, '2023-07-02'),
    (63, 'ROLEX GROSSER PREIS VON OSTERREICH', 2, 18, '2023-07-02'),
    (11, 'ROLEX GROSSER PREIS VON OSTERREICH', 3, 15, '2023-07-02'),
    (14, 'ROLEX GROSSER PREIS VON OSTERREICH', 9, 2, '2023-07-02'),
    (18, 'ROLEX GROSSER PREIS VON OSTERREICH', 8, 4, '2023-07-02'),
    (24, 'ROLEX GROSSER PREIS VON OSTERREICH', 11, 0, '2023-07-02'),
    (77, 'ROLEX GROSSER PREIS VON OSTERREICH', 12, 0, '2023-07-02'),
    (10, 'ROLEX GROSSER PREIS VON OSTERREICH', 7, 6, '2023-07-02'),
    (31, 'ROLEX GROSSER PREIS VON OSTERREICH', 10, 1, '2023-07-02');
    
	

INSERT INTO APPARTENENZA (pilota_id, team, data_inizio_appartenenza)
VALUES
    (16, 'Scuderia Ferrari', '2019-01-01'),
    (55, 'Scuderia Ferrari', '2021-01-01'),
    (33, 'Oracle Red Bull Racing', '2016-05-13'),
    (11, 'Oracle Red Bull Racing', '2021-01-01'),
    (44, 'Mercedes-AMG PETRONAS F1 Team', '2013-01-01'),
    (63, 'Mercedes-AMG PETRONAS F1 Team', '2022-01-01'),
    (14, 'Aston Martin F1 Team', '2023-01-01'),
    (18, 'Aston Martin F1 Team', '2019-01-01'),
    (24, 'Alfa Romeo F1 Team Stake', '2022-01-01'),
    (77, 'Alfa Romeo F1 Team Stake', '2022-01-01'),
    (10, 'BWT Alpine F1 Team', '2023-01-01'),
    (31, 'BWT Alpine F1 Team', '2020-01-01');

INSERT INTO ORGANIZZAZIONE (nome_gp, data_gp, id_fia, ruolo)
VALUES
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'TEC01', 'Delegato tecnico'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'STE02', 'Steward'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'STE03', 'Steward'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'STE05', 'Steward'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'PMC01', 'Pilota Medical Car'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'PSC01', 'Pilota Safety Car'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'SIC01', 'Delegato alla sicurezza'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'MED02', 'Delegato medico'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'REL01', 'Delegato ai media'),
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'DIR01', 'Direttore di gara'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'TEC01', 'Delegato tecnico'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'STE02', 'Steward'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'STE03', 'Steward'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'STE05', 'Steward'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'PMC01', 'Pilota Medical Car'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'PSC01', 'Pilota Safety Car'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'SIC01', 'Delegato alla sicurezza'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'MED02', 'Delegato medico'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'REL01', 'Delegato ai media'),
    ('STC SAUDI ARABIAN GRAND PRIX', '2023-03-19', 'DIR01', 'Direttore di gara'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'TEC02', 'Delegato tecnico'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'STE01', 'Steward'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'STE02', 'Steward'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'STE04', 'Steward'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'PMC01', 'Pilota Medical Car'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'PSC01', 'Pilota Safety Car'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'SIC03', 'Delegato alla sicurezza'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'MED01', 'Delegato medico'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'REL03', 'Delegato ai media'),
    ('ROLEX AUSTRALIAN GRAND PRIX 2023', '2023-04-02', 'DIR01', 'Direttore di gara'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'TEC01', 'Delegato tecnico'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'STE01', 'Steward'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'STE03', 'Steward'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'STE05', 'Steward'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'PMC01', 'Pilota Medical Car'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'PSC01', 'Pilota Safety Car'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'SIC02', 'Delegato alla sicurezza'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'MED04', 'Delegato medico'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'REL03', 'Delegato ai media'),
    ('AZERBAIJAN GRAND PRIX', '2023-04-30', 'DIR02', 'Direttore di gara'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'TEC02', 'Delegato tecnico'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'STE01', 'Steward'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'STE03', 'Steward'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'STE04', 'Steward'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'PMC01', 'Pilota Medical Car'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'PSC01', 'Pilota Safety Car'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'SIC03', 'Delegato alla sicurezza'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'MED01', 'Delegato medico'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'REL01', 'Delegato ai media'),
    ('CRYPTO.COM MIAMI GRAND PRIX', '2023-05-07', 'DIR02', 'Direttore di gara');
    
    INSERT INTO ORGANIZZAZIONE (nome_gp, data_gp, id_fia, ruolo)
VALUES
    ('GULF AIR BAHRAIN GRAND PRIX', '2023-03-05', 'TEC01', 'Delegato tennico');


INSERT INTO COSTRUZIONE (nome_macchina, nome_team, data_uscita)
VALUES
    ('SF23', 'Scuderia Ferrari', '2023-02-14'),
    ('W14', 'Mercedes-AMG PETRONAS F1 Team', '2023-02-17'),
    ('RB19', 'Oracle Red Bull Racing', '2023-02-03'),
    ('AMR23', 'Aston Martin F1 Team', '2023-02-10'),
    ('C43', 'Alfa Romeo F1 Team Stake', '2023-02-11'),
    ('A523', 'BWT ALpine F1 Team', '2023-02-12');
    
    



-- Visualizzazione prossimo GP
CREATE VIEW ProssimoGP AS
SELECT * FROM GRANPREMIO
WHERE GRANPREMIO.dataGP > (
SELECT MAX(data_agg)
FROM PARTECIPAZIONE)
ORDER BY GRANPREMIO.dataGP ASC
LIMIT 1;


-- Visualizzazione classifica piloti
CREATE VIEW VistaClassifica AS
SELECT posizione, nome, cognome, punti FROM CLASSIFICA
ORDER BY posizione;


-- Visualizzazione classifica costruttori
CREATE VIEW VistaClassificaCostruttori AS
    select a.team as squadra,
    sum(c.punti) as punti
    from APPARTENENZA a
    join CLASSIFICA c on a.pilota_id = c.numero
    group by a.team
    order by punti desc;
    
    
CREATE VIEW UltimoGP AS
SELECT
    PA.posizione AS Posizione,
    P.numero AS NumeroPilota,
    P.nome AS NomePilota,
    P.cognome AS CognomePilota,
    GP.nome AS NomeGranPremio,
    PA.data_agg AS DataGranPremio,
    PA.punteggio AS Punteggio
FROM
    PARTECIPAZIONE PA
INNER JOIN
    PILOTA P ON PA.pilota_id = P.numero
INNER JOIN
    GRANPREMIO GP ON PA.gran_premio_id = GP.nome
WHERE
    PA.data_agg = (
        SELECT MAX(data_agg)
        FROM PARTECIPAZIONE
    )
ORDER BY Posizione;



select pilota_id, gran_premio_id from partecipazione
where posizione = '1'
order by data_agg;

SELECT count(pilota_id) 
FROM PARTECIPAZIONE 
WHERE posizione = '1';


DELIMITER //
CREATE FUNCTION TrovaVittorieConsecutive() RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
-- Record di vittorie consecutive
DECLARE MaxVittorie int default 0;

-- Vittorie consecutive della striscia presa in esame
DECLARE VittorieConsecutiveAtt int default 1;

DECLARE num_pilota_corr int;
DECLARE num_pilota_prec int default 0;
DECLARE num_vincitore int default 0;
DECLARE nome_vincitore, cognome_vincitore VARCHAR(20);
DECLARE risultato varchar (255);
DECLARE counter int default 1;

-- Numero di gp che verranno analizzati
DECLARE gp int;

-- La funzione prende direttamente i vincitori e li ordina per data
DECLARE cur CURSOR FOR
SELECT pilota_id FROM PARTECIPAZIONE 
WHERE posizione = '1'
ORDER BY data_agg;

-- Conto dei Gran Premi
SELECT count(pilota_id) INTO gp
FROM PARTECIPAZIONE 
WHERE posizione = '1';



OPEN cur;
FETCH cur into num_pilota_corr;

main_loop: WHILE counter <= gp  DO
	-- Controllo se c'è la vittoria consecutiva
	IF num_pilota_corr = num_pilota_prec THEN
    SET VittorieConsecutiveAtt = VittorieConsecutiveAtt + 1;
    END IF;
    
    -- Confronto fra la striscia attuale di vittorie e il record
    IF VittorieConsecutiveAtt > MaxVittorie THEN
    SET MaxVittorie = VittorieConsecutiveAtt;
    SET num_vincitore = num_pilota_corr;
	END IF;
    
    SET num_pilota_prec = num_pilota_corr;
    
    IF counter = gp THEN
    LEAVE main_loop;
    END IF;
    
    FETCH cur into num_pilota_corr;
    SET counter = counter + 1;
   END WHILE;
   
   CLOSE cur;
   
   -- Costruzione della stringa risultato che verrà usata in output
    IF (MaxVittorie > 0) THEN
		SELECT nome, cognome INTO nome_vincitore, cognome_vincitore
        FROM PILOTA 
        WHERE numero = num_vincitore;
        SET risultato = CONCAT('Il pilota ', nome_vincitore, ' ', cognome_vincitore, ', con numero ', num_vincitore, ', ha il record di ', MaxVittorie, ' vittorie consecutive.');
    ELSE
        SET risultato = CONCAT('Nessun pilota ha vinto due gare consecutivamente.');
    END IF; 
RETURN risultato;
END;
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE ContaPartecipazioniAnnoFIA(IN anno INT)
BEGIN
    SELECT FIA.nome, FIA.cognome, COUNT(ORGANIZZAZIONE.id) AS NumeroPartecipazioni
    FROM FIA
    LEFT JOIN ORGANIZZAZIONE ON FIA.id = ORGANIZZAZIONE.id_fia
    WHERE YEAR(ORGANIZZAZIONE.data_gp) = anno
    GROUP BY FIA.id
    ORDER BY NumeroPartecipazioni DESC;
END;
//
DELIMITER ;





CREATE VIEW ContaVittoriePiloti AS
	SELECT p.numero, p.nome, p.cognome, COUNT(*) AS Vittorie
    FROM PILOTA p
    JOIN PARTECIPAZIONE pa ON p.numero = pa.pilota_id
    WHERE pa.posizione = '1'
	GROUP BY p.numero, p.nome, p.cognome
    ORDER BY Vittorie DESC;
    


CREATE VIEW ContaPodiPiloti AS
	SELECT p.numero, p.nome, p.cognome, COUNT(*) AS Podi
    FROM PILOTA p
    JOIN PARTECIPAZIONE pa ON p.numero = pa.pilota_id
    WHERE pa.posizione <= '3'
	GROUP BY p.numero, p.nome, p.cognome
	ORDER BY Podi DESC;



CREATE VIEW ContaVittorieTeam AS
	SELECT t.nome as NomeTeam, COUNT(pa.id) AS Vittorie
    FROM TEAM t
    LEFT JOIN APPARTENENZA a ON t.nome = a.team
    LEFT JOIN PILOTA pi ON a.pilota_id = pi.numero
    LEFT JOIN PARTECIPAZIONE pa ON pi.numero = pa.pilota_id
    WHERE pa.posizione = '1'
    GROUP BY t.nome
	ORDER BY Vittorie DESC;

;


CREATE VIEW ContaPodiTeam AS
	SELECT t.nome as NomeTeam, COUNT(pa.id) AS Podi
    FROM TEAM t
    LEFT JOIN APPARTENENZA a ON t.nome = a.team
    LEFT JOIN PILOTA pi ON a.pilota_id = pi.numero
    LEFT JOIN PARTECIPAZIONE pa ON pi.numero = pa.pilota_id
    WHERE pa.posizione <= '3'
    GROUP BY t.nome
    ORDER BY Podi DESC;



CREATE VIEW MediaPuntiPilota AS
SELECT p.numero, p.nome, p.cognome, AVG(pa.punteggio) AS media_punti
FROM PILOTA p  
JOIN PARTECIPAZIONE pa ON p.numero = pa.pilota_id
GROUP BY pilota_id
ORDER BY media_punti DESC;



CREATE VIEW MediaPuntiFuoriPodio AS
    SELECT p.numero, p.nome, p.cognome, AVG(pa.punteggio) AS MediaPuntiFuoriPodio
    FROM PILOTA p
    JOIN PARTECIPAZIONE pa ON p.numero = pa.pilota_id
    WHERE pa.posizione >= 4
    GROUP BY p.nome, p.cognome
    ORDER BY MediaPuntiFuoriPodio DESC;


-- Procedura che calcola le nuove poszioni in classifica
DELIMITER //
CREATE PROCEDURE CalcolaPosizioniClassifica()
NOT DETERMINISTIC
BEGIN
    -- Variabile per tener traccia della posizione
    DECLARE posizione_temp INT;
    DECLARE last_punti INT;
    DECLARE last_posizione INT;
    DECLARE Cnumero INT;
    DECLARE Cpunti INT;
    
    -- Dichiarazione di variabile per gestire eventuali eccezioni
    DECLARE exit_handler BOOLEAN DEFAULT FALSE;
        
    -- Cursore per scorrere la tabella CLASSIFICA in ordine decrescente di punti
    DECLARE cur CURSOR FOR
        SELECT numero, punti
        FROM CLASSIFICA
        ORDER BY punti DESC;
                
        -- Dichiarazione di gestore per l'uscita
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_handler = TRUE;
        
    -- Inizializza le variabili
    SET posizione_temp = 1;
    SET last_punti = 0;
    SET last_posizione = 1;

    -- Gira il cursore
    OPEN cur;
    -- Loop per assegnare le posizioni basate sui punti
    REPEAT
        FETCH cur INTO Cnumero, Cpunti;
        -- Esci dal loop se non ci sono più righe da leggere
        IF NOT exit_handler THEN
        -- Aggiorna la posizione solo se i punti sono diversi dai punti precedenti
        IF Cpunti != last_punti THEN
            SET last_posizione = posizione_temp;
        END IF;
        
        -- Aggiorna la posizione per il pilota attuale
        UPDATE CLASSIFICA
        SET posizione = last_posizione
        WHERE numero = Cnumero;
        -- Incrementa la posizione
        SET posizione_temp = posizione_temp + 1;
        -- Aggiorna l'ultimo punteggio
        SET last_punti = Cpunti;
		END IF;
        UNTIL exit_handler END REPEAT;
    -- Chiudi il cursore
    CLOSE cur;
END;
//

DELIMITER ;

-- Trigger per l'aggiornamento automatico della classifica
DELIMITER //
CREATE TRIGGER aggiorna_classifica
AFTER INSERT ON PARTECIPAZIONE
FOR EACH ROW
BEGIN
    -- Calcola la nuova posizione e punti del pilota
    DECLARE nuova_posizione INT;
    DECLARE nuovi_punti INT;
    DECLARE nuova_data date;
    
    SELECT (punteggio) INTO nuovi_punti
    FROM PARTECIPAZIONE
    WHERE gran_premio_id = NEW.gran_premio_id AND pilota_id = NEW.pilota_id;
    
    
    
    SELECT (data_agg) INTO nuova_data
    FROM PARTECIPAZIONE
    WHERE gran_premio_id = NEW.gran_premio_id AND pilota_id = NEW.pilota_id;

    

    -- Aggiorna la classifica con i nuovi dati
    UPDATE CLASSIFICA SET punti = punti + nuovi_punti
    WHERE numero = NEW.pilota_id;
    UPDATE CLASSIFICA SET data_agg = nuova_data
    WHERE numero = NEW.pilota_id;
    
    CALL CalcolaPosizioniClassifica();
    
END;
//
DELIMITER ; 


-- Trigger che impedisce la pianificazione di due gare nella stessa data
DELIMITER //
CREATE TRIGGER verifica_conflitto_date
BEFORE INSERT ON GRANPREMIO
FOR EACH ROW
BEGIN
	-- Dichiarazione variabile che terrà il conto dei conflitti registrati
	DECLARE numconflitti INT;
    
    SELECT COUNT(*) INTO numconflitti
    FROM GRANPREMIO
    WHERE dataGP = new.dataGP;
    IF numconflitti > 0 THEN
    SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Conflitto di date: Una gara è già pianificata per questa data.';
    END IF;    
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER verifica_esistenza_gp
BEFORE INSERT ON PARTECIPAZIONE
FOR EACH ROW
BEGIN
	-- Dichiarazione variabili per l'esistenza del GP e per la possibile data sbagliata
	DECLARE existence BOOLEAN DEFAULT FALSE;
    DECLARE wrong_date BOOLEAN DEFAULT FALSE;
    
    -- Existence diventa TRUE quando viene trovato un Gran Premio
    SELECT TRUE INTO existence
    FROM GRANPREMIO
    WHERE nome = NEW.gran_premio_id;
    
    -- Wrong date diventa TRUE se viene trovato il Gran Premio ed è anche nella stessa data di quello inserito
    SELECT TRUE INTO wrong_date
    FROM GRANPREMIO
    WHERE nome = NEW.gran_premio_id AND dataGP = NEW.data_agg;
        
	IF existence IS FALSE THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: Questa gara non è prevista nel calendario.';
    END IF;
    
    IF wrong_date IS FALSE THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: Questa gara non è prevista in questa data.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER verifica_organizzazione
BEFORE INSERT ON ORGANIZZAZIONE
FOR EACH ROW
BEGIN
	-- Dichiarazione variabili per l'esistenza del GP e per la possibile data sbagliata
	DECLARE gp_check BOOLEAN DEFAULT FALSE;
    -- DECLARE ruolo_check BOOLEAN DEFAULT FALSE;
    
    -- gp_check diventa TRUE quando viene trovato un Gran Premio
    SELECT TRUE INTO gp_check
    FROM GRANPREMIO
    WHERE nome = NEW.nome_gp;
    
    /*-- ruolo_check diventa TRUE se viene trovato il ruolo nella tabella FIA
    SELECT TRUE INTO ruolo_check
    FROM FIA
    WHERE ruolo = NEW.ruolo; */
        
	IF gp_check IS FALSE THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: Questa gara non è prevista nel calendario.';
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM FIA WHERE ruolo = NEW.ruolo) THEN
	SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: Questo ruolo non esiste.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER ContrAppartenenza
BEFORE INSERT ON Appartenenza
FOR EACH ROW
BEGIN
DECLARE counter INT;

SELECT COUNT(team) INTO counter
FROM APPARTENENZA
WHERE team = NEW.team;

IF counter = '2' THEN
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: Questo team è pieno.';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER ContrMaxGP
BEFORE INSERT ON GRANPREMIO
FOR EACH ROW
BEGIN
DECLARE massimo INT DEFAULT 0;

SELECT COUNT(*) INTO massimo
FROM GRANPREMIO
WHERE YEAR(GRANPREMIO.dataGP) = YEAR(NEW.dataGP);

IF massimo = '24' THEN
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: Sono gia state pianificate il numero massimo di gare per questa stagione.';
    END IF;

END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER ContrCostruzione
BEFORE INSERT ON COSTRUZIONE
FOR EACH ROW
BEGIN
DECLARE team_check BOOLEAN DEFAULT FALSE;

SELECT TRUE INTO team_check
FROM COSTRUZIONE
WHERE nome_team = NEW.nome_team;

IF team_check IS TRUE THEN
SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Errore: Questo team ha gia costruito una macchina.';
    END IF;

END;
//
DELIMITER ;

