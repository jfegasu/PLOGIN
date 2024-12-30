-- 02/06/2022
CREATE DATABASE SALUD;
USE SALUD;
CREATE TABLE ESTADOEPS
(
  idEstadoEPS INT NOT NULL,
  descripcion VARCHAR(255)  NOT NULL
  );

INSERT INTO estadoeps  VALUES (2,'Sancionada');
INSERT INTO estadoeps  VALUES (3,'Desactivada');
INSERT INTO estadoeps  VALUES (4,'Intervenida');
INSERT INTO estadoeps  VALUES (5,'Liquidada');
INSERT INTO estadoeps  VALUES (1,'Activa');

CREATE TABLE EPS
(
ideps INT  NOT NULL,
nombre VARCHAR(255)  NOT NULL,
estadoeps INT NOT NULL
);

INSERT INTO eps  VALUES (1,'SALUDCOOP',4);
INSERT INTO eps  VALUES (2,'CAFESALUD',1);
INSERT INTO eps  VALUES (3,'NUEVA EPS',1);
INSERT INTO eps  VALUES (4,'ISS',5);
INSERT INTO eps  VALUES (5,'CAPRECOM',4);
INSERT INTO eps  VALUES (6,'COOMEVA',1);
INSERT INTO eps  VALUES (7,'COMPENSAR',1);
INSERT INTO eps  VALUES (8,'COLMEDICA',1);
INSERT INTO eps  VALUES (9,'HUMANA VIVIR',2);
INSERT INTO eps  VALUES (10,'FAMISANAR',1);
INSERT INTO eps  VALUES (11,'CRUZ BLANCA',3);
INSERT INTO eps  VALUES (12,'SOLSALUD',1);
INSERT INTO eps  VALUES (13,'SALUD TOTAL',5);
INSERT INTO eps  VALUES (14,'SANITAS',3);

CREATE TABLE tipoafiliado
(
  idTipoAfiliado INT NOT NULL ,
  descripcion VARCHAR(255)  NOT NULL
);



INSERT INTO tipoafiliado  VALUES (1,'Cotizante');
INSERT INTO tipoafiliado  VALUES (2,'Beneficiario');
INSERT INTO tipoafiliado  VALUES (3,'Subsidiado');
INSERT INTO tipoafiliado  VALUES (4,'Fosiga');
INSERT INTO tipoafiliado  VALUES (5,'Sisben');

CREATE TABLE TIPOIDENTIFICACION
(
  idTipoIdentificacion INT NOT NULL ,
  abreviatura VARCHAR(255)  NOT NULL,
  descripcion VARCHAR(255)  NULL
);


INSERT INTO tipoidentificacion  VALUES (1,'CC', 'cedula de ciudadania');
INSERT INTO tipoidentificacion  VALUES (2,'TI','tarjeta de identidad');
INSERT INTO tipoidentificacion  VALUES (3,'NUI', 'Numero Unico de Identificacion');
INSERT INTO tipoidentificacion  VALUES (4,'RC', 'Registro civil');
INSERT INTO tipoidentificacion  VALUES (5,'PS', 'Pasaporte');

CREATE TABLE tiposervicio
(
  idTipoServicio INT NOT NULL,
  descripcion VARCHAR(255)  NOT NULL
);


INSERT INTO tiposervicio  VALUES (1,'Consulta medico general');
INSERT INTO tiposervicio  VALUES (2,'Consulta especialista');
INSERT INTO tiposervicio  VALUES (3,'Consulta unidad de urgencias');
INSERT INTO tiposervicio  VALUES (4,'Consulta externa');
INSERT INTO tiposervicio  VALUES (5,'Odontologia');
INSERT INTO tiposervicio  VALUES (6,'Radiologia');
INSERT INTO tiposervicio  VALUES (7,'Consulta unidad de pediatra');
INSERT INTO tiposervicio  VALUES (8,'Consulta interna');
INSERT INTO tiposervicio  VALUES (9,'Unidad de cuidados intensivos');
INSERT INTO tiposervicio  VALUES (10,'Consulta psiquiatria');

CREATE TABLE estadopersona
(
  idEstadoPersona INT NOT NULL,
  descripcion VARCHAR(255)  NOT NULL
);


INSERT INTO estadopersona  VALUES (1,'Activo');
INSERT INTO estadopersona  VALUES (2,'Afiliado');
INSERT INTO estadopersona  VALUES (3,'Cesante');
INSERT INTO estadopersona  VALUES (4,'Retirado');

CREATE TABLE PERSONA
(
idPersona INT  NOT NULL PRIMARY KEY,
idTipoidentificacion INT NOT NULL, 
nombre VARCHAR(255)  NOT NULL,
apellido VARCHAR(255)  NOT NULL,
fechaNacimiento date NOT NULL,
sexo char(1) NOT NULL);


INSERT INTO persona VALUES (769086765, 1,'ARLETH','BRAVO', STR_TO_DATE('11/11/1965','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1057583006,1,'ANA','RIOS',STR_TO_DATE('02/01/1990','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (52158989,1,'MARILEIS','CAMACHO',STR_TO_DATE('29/05/1975','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (1026553762,1,'JOSE','ALARCON',STR_TO_DATE('13/11/1977','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (65799510,1,'CARMEN','CASTANEDA',STR_TO_DATE('30/12/1976','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (52377972,1,'ANA','ALGARRA',STR_TO_DATE('12/01/1970','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (250025,4,'LIZET','GORDO',STR_TO_DATE('23/06/2000','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (7276950,1,'CELSO','SALAMANCA',STR_TO_DATE('15/06/1972','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127722084,4,'JUAN','JIMENEZ',STR_TO_DATE('10/02/2004','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127722591,4,'LAURA','BELTRAN',STR_TO_DATE('07/09/2006','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (990014705,3,'CARIN','PENA',STR_TO_DATE('29/06/1998','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (990014543,3,'JERSON','GAITAN',STR_TO_DATE('23/02/1994','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (9267617,4,'JHON,','GAITAN',STR_TO_DATE('26/09/1990','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1126704602,4,'SHAILYN','ROJAS',STR_TO_DATE('22/11/2009','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (103251438,2,'JIMMY','CARDENAS',STR_TO_DATE('25/03/1991','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (96195585,1,'GONZALO','GUEVARA',STR_TO_DATE('10/11/1984','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (8190364,1,'EIVAR','BERGARA',STR_TO_DATE('01/08/1955','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (17360310,1,'MILTON','BURGOS',STR_TO_DATE('20/02/1964','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (40270715,1,'ANA','HERNANDEZ',STR_TO_DATE('25/07/1959','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (2952910,1,'ANGEL','RAMIREZ',STR_TO_DATE('23/11/1937','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127385618,4,'JHULLDER','BELTRAN',STR_TO_DATE('08/04/2008','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (26632648,1,'MYRIAM','GOMEZ',STR_TO_DATE('15/05/1961','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (206276711,2,'DAELLA','CARVAJAL',STR_TO_DATE('27/06/1992','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1122513211,4,'HAROLD','SANTANA',STR_TO_DATE('15/05/2006','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (79600774,1,'ALEXIS','HERRERA',STR_TO_DATE('05/10/1972','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (110763859,2,'ANGIE','HERRERA',STR_TO_DATE('07/11/1998','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (6611537,1,'MOISES','MALDONADO',STR_TO_DATE('06/10/1936','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1192213089,4,'EMANUEL','BABATIVA',STR_TO_DATE('08/07/2009','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127386495,4,'YEFERSSON','ROJAS',STR_TO_DATE('26/05/2009','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (250344,4,'KELLY','REINO',STR_TO_DATE('23/05/2000','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (12196489,1,'ALEXANDER','IBARRA',STR_TO_DATE('15/09/1975','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (27385092,4,'ANLLELY','IBARRA',STR_TO_DATE('04/07/2007','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (92373541,2,'JOSE','GONZALEZ',STR_TO_DATE('23/09/1998','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (91106202,1,'LUIS','PRADA',STR_TO_DATE('22/12/1967','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (40771163,1,'GLORIA','MEDINA',STR_TO_DATE('21/03/1968','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (33001267,2,'GERSON','PRADA',STR_TO_DATE('30/03/1995','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (26542999,1,'SANDRA','VARGAS',STR_TO_DATE('21/08/1979','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (82154809,4,'KAREN','CASTIBLANCO',STR_TO_DATE('29/03/2005','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (2213052,3,'CARLOS','RIVERA',STR_TO_DATE('08/01/2009','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (17340110,1,'EDGAR','DIAZ',STR_TO_DATE('04/09/1967','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (17339368,1,'HECTOR','LENIS',STR_TO_DATE('14/05/1967','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (40382477,1,'LUZ','ARANA',STR_TO_DATE('18/01/1968','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (21249349,1,'NUBIA','VALERO',STR_TO_DATE('08/06/1973','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (86055321,1,'CARLOS','HERRERA',STR_TO_DATE('28/08/1971','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (40216231,1,'JENNY','GARCIA',STR_TO_DATE('02/04/1982','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1121850975,4,'ISAIT','AMADO',STR_TO_DATE('02/04/2007','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (97610314,1,'YEINER','MEDELLIN',STR_TO_DATE('26/12/1982','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (30215164,1,'MARIA','GAITAN',STR_TO_DATE('31/12/1928','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (21184191,1,'MARIA','ACOSTA',STR_TO_DATE('27/09/1934','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (18263,1,'JOSE','GAITAN',STR_TO_DATE('20/07/1979','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (40417149,1,'JANETH','BARRETO',STR_TO_DATE('22/02/1977','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1127722566,4,' SEBASTIAN','RINCON',STR_TO_DATE('05/03/2006','%d/%m/%Y'),'M'); 
INSERT INTO persona VALUES (23836167,1,'MARTHA','PERDOMO',STR_TO_DATE('30/01/1969','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (2356060,1,'HECTOR','MENDEZ',STR_TO_DATE('19/06/1947','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (92122455540,2,'YORMAN','OLMOS',STR_TO_DATE('24/12/1992','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (40417953,1,'MARITZA','PRIETO',STR_TO_DATE('06/04/1976','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (17388376,1,'RAMON','ALARCON',STR_TO_DATE('09/01/1970','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (970417088,2,'JORGE','MONCADA',STR_TO_DATE('17/04/1997','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (17389974,1,'EUCLIDES','SUAREZ',STR_TO_DATE('04/09/1978','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1121816195,1,'YENNI','OLMOS',STR_TO_DATE('14/12/1985','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (17388487,1,'WILSON','CACERES',STR_TO_DATE('20/02/1970','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (40417370,1,'NURY','VARGAS',STR_TO_DATE('17/02/1974','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (23834813,1,'MARIA','CORTES',STR_TO_DATE('11/07/1954','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (93115847,1,'ARTURO','ARIAS',STR_TO_DATE('05/07/1958','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (40419288,1,'SILVANA','ANGULO',STR_TO_DATE('05/04/1970','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (40419253,1,'ANA','SANABRIA',STR_TO_DATE('25/02/1981','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (2254679,4,'HANIA','DAJOME',STR_TO_DATE('07/03/1983','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1127385269,1,'JHON','LAGUNA',STR_TO_DATE('27/05/1989','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1082019,1,'MIGUEL','PEREZ',STR_TO_DATE('29/09/1934','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (41479669,1,'LEONOR','APOLINAR',STR_TO_DATE('18/08/1946','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1052390132,4,'DAINNY','ALARCON',STR_TO_DATE('09/02/2008','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1127386763,4,'DIDIER','OROS',STR_TO_DATE('14/10/2009','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127722954,4,'WILLIAN','GUAYABO',STR_TO_DATE('25/07/2007','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1192748086,2,'DANIEL','GARCIA',STR_TO_DATE('22/11/1999','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127722523,4,'LUIS','BARRETO',STR_TO_DATE('31/01/2006','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1081406547,4,'JADER','BARRAGAN',STR_TO_DATE('05/12/2008','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (18262730,1,'WILLIAN','SANTANA',STR_TO_DATE('19/12/1976','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (86003367,1,'KENNEDY','LUGO',STR_TO_DATE('18/05/1962','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (47425902,1,'NANCY','OROS',STR_TO_DATE('22/10/1973','%d/%m/%Y'),'F');
INSERT INTO persona VALUES (1010045484,2,'LILIANA','OROS',STR_TO_DATE('26/08/1995','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (2746611,1,'JESUS','BUENO',STR_TO_DATE('01/11/1957','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (41250448,1,'NINFA','GARCIA',STR_TO_DATE('05/07/1959','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (18256624,1,'FREDY','JIMENEZ',STR_TO_DATE('24/10/1979','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127722326,4,'ELKAN','OROS',STR_TO_DATE('05/03/2004','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (1127385785,1,'WILLIAN','GUAYABO',STR_TO_DATE('29/06/1990','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (9307252,2,'EDIER','GARCIA',STR_TO_DATE('25/07/1993','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (1192748085,2,'KEILA','GARCIA',STR_TO_DATE('22/04/1997','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (1010080473,1,'ELKIN','SANCHEZ',STR_TO_DATE('29/06/1989','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (55212231,1,'EDITH','GOMEZ',STR_TO_DATE('22/05/1980','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (18263392,1,'JULIO','SANABRIA',STR_TO_DATE('18/04/1982','%d/%m/%Y'),'M');
INSERT INTO persona VALUES (1127722565,4,'CARLOS','SANTANA',STR_TO_DATE('12/04/2005','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (30937299,1,'MARIA','SANCHEZ',STR_TO_DATE('25/07/1978','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (1127722513,4,'WESLER','LUGO',STR_TO_DATE('06/01/2006','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (1122722735,1,'MARLLURY','TOVAR',STR_TO_DATE('28/04/1985','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (1105611093,4,'ANYHI','CASTILLA',STR_TO_DATE('18/03/2005','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (4186277,1,'AQUILINO','SIERRA',STR_TO_DATE('19/11/1952','%d/%m/%Y'),'M');	
INSERT INTO persona VALUES (1010081989,2,'SOLANLLI','SIERRA',STR_TO_DATE('29/03/1996','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (1120865708,1,'GLORI','JIMENEZ',STR_TO_DATE('13/09/1986','%d/%m/%Y'),'F');	
INSERT INTO persona VALUES (86050207,1,'JHON','GOMEZ',STR_TO_DATE('08/03/1976','%d/%m/%Y'),'M');	


CREATE TABLE historialpersona
(
idhistorialpersona INT primary key auto_increment, 
idpersona INT NOT NULL,
fechaingreso date NOT NULL,
fecharetiro date NULL,
estadopersona char NOT NULL,
ideps INT NOT NULL,
tipoafiliado INT NOT NULL,
idTipoServicio INT NOT NULL);

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (769086765,1, 1,STR_TO_DATE('01/11/2004','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'I','1');

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1057583006,4, 1,STR_TO_DATE('01/10/2007','%d/%m/%Y'),STR_TO_DATE('01/07/2009','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (52158989,	4, 1,STR_TO_DATE('04/09/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2009','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1026553762,4, 4,STR_TO_DATE('01/07/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2008','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (65799510,	1, 1,STR_TO_DATE('01/02/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2009','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (52377972,	4, 4,STR_TO_DATE('15/06/2006','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (250025,	2, 1,STR_TO_DATE('20/09/2001','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (7276950,	1, 4,STR_TO_DATE('01/12/1999','%d/%m/%Y'),STR_TO_DATE('01/04/2003','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722084,1, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722591,2, 2,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (990014705,	1, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (990014543,	8, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (9267617,	4, 5,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1126704602,5, 2,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (103251438,	2, 4,STR_TO_DATE('01/10/2008','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (96195585,	4, 4,STR_TO_DATE('01/10/2008','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (8190364,	5, 1,STR_TO_DATE('28/05/2008','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1736031,	7, 1,STR_TO_DATE('01/10/2008','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40270715,	8, 1,STR_TO_DATE('01/10/2008','%d/%m/%Y'),STR_TO_DATE('30/06/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (2952910,	3, 2,STR_TO_DATE('01/10/2008','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127385618,6, 1,STR_TO_DATE('25/09/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (26632648,	1, 1,STR_TO_DATE('01/04/2001','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (206276711,	2, 1,STR_TO_DATE('05/02/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1122513211,4, 4,STR_TO_DATE('07/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (79600774,	5, 1,STR_TO_DATE('19/11/2009','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (110763859,	6, 5,STR_TO_DATE('19/11/2009','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (6611537,	6, 2,STR_TO_DATE('01/10/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1192213089,3, 1,STR_TO_DATE('06/08/2009','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127386495,4, 1,STR_TO_DATE('20/06/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (250344,	9, 1,STR_TO_DATE('01/06/2004','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (12196489,	5, 1,STR_TO_DATE('10/09/2008','%d/%m/%Y'),STR_TO_DATE('01/04/2009','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (27385092,	7, 1,STR_TO_DATE('10/09/2008','%d/%m/%Y'),STR_TO_DATE('01/04/2009','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (92373541,	8, 1,STR_TO_DATE('09/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (91106202,	5, 1,STR_TO_DATE('13/09/2007','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40771163,	3, 1,STR_TO_DATE('01/06/2004','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (33001267,	4, 4,STR_TO_DATE('01/06/2004','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (26542999,	6, 1,STR_TO_DATE('15/12/2005','%d/%m/%Y'),STR_TO_DATE('01/10/2009','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (82154809,	7, 1,STR_TO_DATE('15/12/2005','%d/%m/%Y'),STR_TO_DATE('01/10/2009','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (2213052,	2, 1,STR_TO_DATE('13/01/2009','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (17340110,	3, 4,STR_TO_DATE('01/04/2005','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (17339368,	5, 4,STR_TO_DATE('01/12/2005','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40382477,	6, 4,STR_TO_DATE('01/04/2004','%d/%m/%Y'),STR_TO_DATE('01/10/2009','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (21249349,	7, 2,STR_TO_DATE('01/04/2005','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (86055321,	8, 4,STR_TO_DATE('16/12/2001','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40216231,	9, 4,STR_TO_DATE('16/12/2001','%d/%m/%Y'),STR_TO_DATE('16/12/2011','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1121850975,3, 5,STR_TO_DATE('12/07/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (97610314,	2, 1,STR_TO_DATE('20/12/2006','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (30215164,	1, 4,STR_TO_DATE('23/08/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (21184191,	3, 4,STR_TO_DATE('01/10/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (18263255,	4, 4,STR_TO_DATE('23/08/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40417149,	5, 1,STR_TO_DATE('22/01/2000','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722566,6, 4,STR_TO_DATE('31/03/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (23836167,	7, 2,STR_TO_DATE('01/10/2004','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (2356060,	8, 1,STR_TO_DATE('01/04/2005','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (92122455540,9,1,STR_TO_DATE('01/04/2005','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40417953,	4, 2,STR_TO_DATE('01/04/2005','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (17388376,	2, 1,STR_TO_DATE('01/04/2000','%d/%m/%Y'),STR_TO_DATE('30/09/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (97041708828,10,4,STR_TO_DATE('01/04/2000','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (17389974,	9,3,STR_TO_DATE('01/04/1998','%d/%m/%Y'),STR_TO_DATE('01/10/2009','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1121816195,3, 1,STR_TO_DATE('01/04/2000','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (17388487,	4, 1,STR_TO_DATE('01/04/2000','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40417370,	5, 1,STR_TO_DATE('01/04/2000','%d/%m/%Y'),STR_TO_DATE('01/06/2002','%d/%m/%Y'),'I','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (23834813,	6, 1,STR_TO_DATE('01/04/2000','%d/%m/%Y'),STR_TO_DATE('01/10/2009','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (93115847,	7, 1,STR_TO_DATE('01/04/2005','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40419288,	8, 1,STR_TO_DATE('01/04/2005','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (40419253,	5, 5,STR_TO_DATE('20/04/2007','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (2254679,	6, 5,STR_TO_DATE('01/04/2001','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127385269,1,1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1082019,	3, 4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (41479669,	4, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1052390132,2, 4,STR_TO_DATE('15/04/2008','%d/%m/%Y'),STR_TO_DATE('01/04/2009','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127386763,6, 4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722954,4, 3,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1192748086,1,3,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722523,5, 4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1081406547,7, 4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (18262730,	3, 2,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (86003367,	9, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (47425902,	4, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1010045484,4, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (2746611,	7, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (41250448,	4, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (18256624,	5, 4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722326,7, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127385785,2, 2,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');

INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (9307252,4,4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1192748085,5, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1010080473,8, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (55212231,	9, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (18263392,	5, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722565,4, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (30937299,	6, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1127722513,7, 4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1122722735,3, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1105611093,2, 4,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (4186277,	1, 5,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1010081989,6, 3,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (1120865708,7, 2,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');
INSERT INTO historialpersona (idpersona,ideps,tipoafiliado,fechaingreso,fecharetiro,estadopersona,idTipoServicio) VALUES (86050207,	8, 1,STR_TO_DATE('01/12/2009','%d/%m/%Y'),STR_TO_DATE('01/04/2010','%d/%m/%Y'),'A','1');

CREATE TABLE servicioeps
(
ideps INT NOT NULL,
idtiposervicio INT NOT NULL,
estado VARCHAR(255)  NOT NULL,
valor INT NOT NULL,
detalle VARCHAR(255)  NULL,
CONSTRAINT pk_servicioseps PRIMARY KEY (ideps, idtiposervicio)
);


INSERT INTO servicioeps VALUES (1,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (1,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (1,3,'I',36000,'COPAGO');
INSERT INTO servicioeps VALUES (1,4,'A',156000,'CIRUGIA');
INSERT INTO servicioeps VALUES (1,5,'I',256000,'COPAGO');
INSERT INTO servicioeps VALUES (1,6,'A',556000,'COPAGO');
INSERT INTO servicioeps VALUES (1,7,'I',78000,'COPAGO');
INSERT INTO servicioeps VALUES (1,8,'A',6000,'COPAGO');
INSERT INTO servicioeps VALUES (1,9,'A',76000,'COPAGO');
INSERT INTO servicioeps VALUES (1,10,'I',96000,'COPAGO');

INSERT INTO servicioeps VALUES (2,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (2,2,'A',28000,'CIRUGIA');
INSERT INTO servicioeps VALUES (2,3,'I',36000,'COPAGO');
INSERT INTO servicioeps VALUES (2,4,'A',156000,'CIRUGIA');
INSERT INTO servicioeps VALUES (2,5,'I',256000,'COPAGO');
INSERT INTO servicioeps VALUES (2,6,'A',556000,'CIRUGIA');
INSERT INTO servicioeps VALUES (2,7,'I',78000,'COPAGO');
INSERT INTO servicioeps VALUES (2,8,'A',6000,'COPAGO');
INSERT INTO servicioeps VALUES (2,9,'A',76000,'COPAGO');
INSERT INTO servicioeps VALUES (2,10,'I',96000,'COPAGO');

INSERT INTO servicioeps VALUES (3,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (3,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (3,3,'I',36000,'COPAGO');
INSERT INTO servicioeps VALUES (3,4,'A',156000,'CIRUGIA');
INSERT INTO servicioeps VALUES (3,5,'I',256000,'CIRUGIA');
INSERT INTO servicioeps VALUES (3,6,'A',556000,'CIRUGIA');
INSERT INTO servicioeps VALUES (3,7,'I',78000,'CIRUGIA');
INSERT INTO servicioeps VALUES (3,8,'A',6000,'COPAGO');
INSERT INTO servicioeps VALUES (3,9,'A',76000,'COPAGO');
INSERT INTO servicioeps VALUES (3,10,'I',96000,'CIRUGIA');

INSERT INTO servicioeps VALUES (4,1,'I',56000,'COPAGO');
INSERT INTO servicioeps VALUES (4,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (4,3,'I',36000,'COPAGO');
INSERT INTO servicioeps VALUES (4,4,'I',156000,'COPAGO');
INSERT INTO servicioeps VALUES (4,5,'I',256000,'COPAGO');
INSERT INTO servicioeps VALUES (4,6,'I',556000,'CIRUGIA');
INSERT INTO servicioeps VALUES (4,7,'A',78000,'COPAGO');
INSERT INTO servicioeps VALUES (4,8,'A',6000,'COPAGO');
INSERT INTO servicioeps VALUES (4,9,'I',76000,'COPAGO');
INSERT INTO servicioeps VALUES (4,10,'I',96000,'COPAGO');

INSERT INTO servicioeps VALUES (5,1,'I',56000,'COPAGO');
INSERT INTO servicioeps VALUES (5,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (5,3,'I',36000,'COPAGO');
INSERT INTO servicioeps VALUES (5,4,'I',156000,'COPAGO');
INSERT INTO servicioeps VALUES (5,5,'I',256000,'CIRUGIA');
INSERT INTO servicioeps VALUES (5,6,'I',556000,'COPAGO');
INSERT INTO servicioeps VALUES (5,7,'A',78000,'COPAGO');
INSERT INTO servicioeps VALUES (5,8,'A',6000,'COPAGO');
INSERT INTO servicioeps VALUES (5,9,'I',76000,'COPAGO');
INSERT INTO servicioeps VALUES (5,10,'I',96000,'COPAGO');

INSERT INTO servicioeps VALUES (6,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (6,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (6,3,'A',36000,'COPAGO');
INSERT INTO servicioeps VALUES (6,4,'I',156000,'CIRUGIA');
INSERT INTO servicioeps VALUES (6,5,'I',256000,'CIRUGIA');
INSERT INTO servicioeps VALUES (6,6,'A',556000,'CIRUGIA');
INSERT INTO servicioeps VALUES (6,7,'A',78000,'COPAGO');
INSERT INTO servicioeps VALUES (6,8,'I',6000,'COPAGO');
INSERT INTO servicioeps VALUES (6,9,'I',76000,'COPAGO');
INSERT INTO servicioeps VALUES (6,10,'A',96000,'COPAGO');

INSERT INTO servicioeps VALUES (7,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (7,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (7,3,'A',36000,'COPAGO');
INSERT INTO servicioeps VALUES (7,4,'I',156000,'COPAGO');
INSERT INTO servicioeps VALUES (7,5,'I',256000,'CIRUGIA');
INSERT INTO servicioeps VALUES (7,6,'A',556000,'CIRUGIA');
INSERT INTO servicioeps VALUES (7,7,'A',78000,'COPAGO');
INSERT INTO servicioeps VALUES (7,8,'I',6000,'COPAGO');
INSERT INTO servicioeps VALUES (7,9,'I',76000,'COPAGO');
INSERT INTO servicioeps VALUES (7,10,'A',96000,'COPAGO');

INSERT INTO servicioeps VALUES (8,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (8,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (8,3,'A',36000,'COPAGO');
INSERT INTO servicioeps VALUES (8,4,'I',156000,'COPAGO');
INSERT INTO servicioeps VALUES (8,5,'I',256000,'ADICIONAL');
INSERT INTO servicioeps VALUES (8,6,'A',556000,'ADICIONAL');
INSERT INTO servicioeps VALUES (8,7,'A',78000,'COPAGO');
INSERT INTO servicioeps VALUES (8,8,'I',6000,'COPAGO');
INSERT INTO servicioeps VALUES (8,9,'I',76000,'COPAGO');
INSERT INTO servicioeps VALUES (8,10,'A',96000,'COPAGO');

INSERT INTO servicioeps VALUES (9,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (9,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (9,3,'A',36000,'COPAGO');
INSERT INTO servicioeps VALUES (9,4,'I',156000,'COPAGO');
INSERT INTO servicioeps VALUES (9,5,'I',256000,'ADICIONAL');
INSERT INTO servicioeps VALUES (9,6,'A',556000,'ADICIONAL');
INSERT INTO servicioeps VALUES (9,7,'A',78000,'COPAGO');
INSERT INTO servicioeps VALUES (9,8,'I',6000,'COPAGO');
INSERT INTO servicioeps VALUES (9,9,'I',76000,'COPAGO');
INSERT INTO servicioeps VALUES (9,10,'A',96000,'COPAGO');

INSERT INTO servicioeps VALUES (10,1,'A',56000,'COPAGO');
INSERT INTO servicioeps VALUES (10,2,'A',28000,'COPAGO');
INSERT INTO servicioeps VALUES (10,3,'A',36000,'COPAGO');
INSERT INTO servicioeps VALUES (10,4,'I',156000,'COPAGO');
INSERT INTO servicioeps VALUES (10,5,'I',256000,'ADICIONAL');
INSERT INTO servicioeps VALUES (10,6,'A',556000,'ADICIONAL');
INSERT INTO servicioeps VALUES (10,7,'A',78000,'COPAGO');
INSERT INTO servicioeps VALUES (10,8,'I',6000,'COPAGO');
INSERT INTO servicioeps VALUES (10,9,'I',76000,'COPAGO');
INSERT INTO servicioeps VALUES (10,10,'A',96000,'COPAGO');

CREATE OR REPLACE VIEW SALUD AS
SELECT 'EPS' TABLA, COUNT(*) CANTIDAD FROM EPS
UNION
SELECT 'ESTADOEPS' TABLA, COUNT(*) CANTIDAD FROM ESTADOEPS
UNION
SELECT 'ESTADOPERSONA' TABLA, COUNT(*) CANTIDAD FROM ESTADOPERSONA
UNION
SELECT 'HISTORIALPERSONA' TABLA, COUNT(*) CANTIDAD FROM HISTORIALPERSONA
UNION
SELECT 'PERSONA' TABLA, COUNT(*) CANTIDAD FROM PERSONA
UNION
SELECT 'SERVICIOEPS' TABLA, COUNT(*) CANTIDAD FROM SERVICIOEPS
UNION
SELECT 'TIPOAFILIADO' TABLA, COUNT(*) CANTIDAD FROM TIPOAFILIADO
UNION
SELECT 'TIPOIDENTIFICACION' TABLA, COUNT(*) CANTIDAD FROM TIPOIDENTIFICACION
UNION
SELECT 'TIPOSERVICIO' TABLA, COUNT(*) CANTIDAD FROM TIPOSERVICIO;

CREATE OR REPLACE VIEW ESQUEMA AS
SELECT
CONSTRAINT_NAME,TABLE_SCHEMA,TABLE_NAME,CONSTRAINT_TYPE
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA='SALUD';

