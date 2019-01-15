CREATE DATABASE bomberosBD;

USE bomberosBD;
SET lc_time_names = 'es_CL';

CREATE TABLE tbl_usuario(
id_usuario INT AUTO_INCREMENT,
nombre_usuario VARCHAR(20000),
contrasenia_usuario VARCHAR (2000),
PRIMARY KEY (id_usuario)
);

select * from tbl_usuario;

CREATE TABLE tbl_estado_civil(
id_estado_civil INT AUTO_INCREMENT,
nombre_estado_civil TEXT,
PRIMARY KEY (id_estado_civil)
);


INSERT INTO tbl_estado_civil VALUES (NULL, 'Hijo/a');
INSERT INTO tbl_estado_civil VALUES (NULL, 'Padre/Madre');
INSERT INTO tbl_estado_civil VALUES (NULL, 'Soltero/a');
INSERT INTO tbl_estado_civil VALUES (NULL, 'Viudo/a');
INSERT INTO tbl_estado_civil VALUES (NULL, 'Divorciado/a');
INSERT INTO tbl_estado_civil VALUES (NULL, 'Separado/a');
INSERT INTO tbl_estado_civil VALUES (NULL, 'Conviviente');

CREATE TABLE tbl_genero(
id_genero INT AUTO_INCREMENT,
nombre_genero VARCHAR (21844),
PRIMARY KEY (id_genero)
);

INSERT INTO tbl_genero VALUES (NULL, 'Masculino');
INSERT INTO tbl_genero VALUES (NULL, 'Femenino');



CREATE TABLE tbl_medida (
id_medida INT AUTO_INCREMENT,
talla_de_chaqueta_camisa_medida VARCHAR (5000),
talla_de_pantalon_medida VARCHAR (5000),
talla_de_buzo_medida VARCHAR (5000),
talla_de_calzado_medida VARCHAR (5000),
PRIMARY KEY(id_medida)
);

INSERT INTO tbl_medida VALUES (NULL,'XX','L','S','44' );


CREATE TABLE tbl_informacionPersonal(
id_informacionPersonal INT AUTO_INCREMENT,
rut_informacionPersonal VARCHAR (12) UNIQUE,
nombre_informacionPersonal VARCHAR (5000),
apellido_paterno_informacionPersonal VARCHAR (5000),
apellido_materno_informacionPersonal VARCHAR (5000),
fecha_de_nacimiento_informacionPersonal DATE,
fk_estado_civil_informacionPersonal INT,
fk_medida_informacionPersonal INT,
altura_en_metros_informacionPersonal VARCHAR (5000),
peso_en_kg_informacionPersonal VARCHAR (5000),
e_mail_informacionPersonal VARCHAR (5000),
fk_genero_informacionPersonal INT,
telefono_fijo_informacionPersonal VARCHAR (5000),
telefono_movil_informacionPersonal VARCHAR (5000),
direccion_personal_informacionPersonal VARCHAR (5000),
pertenecio_a_brigada_juvenil_informacionPersonal VARCHAR (5000),
esInstructor_informacionPersonal VARCHAR (5000),
FOREIGN KEY (fk_estado_civil_informacionPersonal) REFERENCES tbl_estado_civil (id_estado_civil),
FOREIGN KEY (fk_medida_informacionPersonal) REFERENCES tbl_medida (id_medida),
FOREIGN KEY (fk_genero_informacionPersonal) REFERENCES tbl_genero (id_genero),
PRIMARY KEY (id_informacionPersonal)
);
-- Parece que hay que saber hacer los insert enn formato yyyy/mm/dd
INSERT INTO tbl_informacionPersonal VALUES (NULL, '20898088-2','Marcelo', 'Aranda', 'Tatto','1991-12-16',1,1,'1,70','80,2','cheloz_20@hotmail.com',
1,'123123123123','958677107','Carretera El Cobre','No sabe', 'Creo que no');

-- SELECT * FROM tbl_informacionPersonal;


CREATE TABLE tbl_region (
  id_region INT AUTO_INCREMENT,
  nombre_region VARCHAR(64) ,
  ordinal_region VARCHAR(4),
  PRIMARY KEY (id_region)
);

INSERT INTO tbl_region (id_region,nombre_region,ordinal_region)
VALUES
	(1,'Arica y Parinacota','XV'),
	(2,'Tarapacá','I'),
	(3,'Antofagasta','II'),
	(4,'Atacama','III'),
	(5,'Coquimbo','IV'),
	(6,'Valparaiso','V'),
	(7,'Metropolitana de Santiago','RM'),
	(8,'Libertador General Bernardo O\'Higgins','VI'),
	(9,'Maule','VII'),
	(10,'Biobío','VIII'),
	(11,'La Araucanía','IX'),
	(12,'Los Ríos','XIV'),
	(13,'Los Lagos','X'),
	(14,'Aisén del General Carlos Ibáñez del Campo','XI'),
	(15,'Magallanes y de la Antártica Chilena','XII');
    
   

CREATE TABLE tbl_provincia (
  id_provincia INT AUTO_INCREMENT,
  nombre_provincia VARCHAR(64),
  fk_region_provincia INT,
  FOREIGN KEY (fk_region_provincia) REFERENCES tbl_region (id_region),
  PRIMARY KEY (id_provincia)
); 

INSERT INTO tbl_provincia (id_provincia,nombre_provincia,fk_region_provincia)
VALUES
	(1,'Arica',1),
	(2,'Parinacota',1),
	(3,'Iquique',2),
	(4,'El Tamarugal',2),
	(5,'Antofagasta',3),
	(6,'El Loa',3),
	(7,'Tocopilla',3),
	(8,'Chañaral',4),
	(9,'Copiapó',4),
	(10,'Huasco',4),
	(11,'Choapa',5),
	(12,'Elqui',5),
	(13,'Limarí',5),
	(14,'Isla de Pascua',6),
	(15,'Los Andes',6),
	(16,'Petorca',6),
	(17,'Quillota',6),
	(18,'San Antonio',6),
	(19,'San Felipe de Aconcagua',6),
	(20,'Valparaiso',6),
	(21,'Chacabuco',7),
	(22,'Cordillera',7),
	(23,'Maipo',7),
	(24,'Melipilla',7),
	(25,'Santiago',7),
	(26,'Talagante',7),
	(27,'Cachapoal',7),
	(28,'Cardenal Caro',8),
	(29,'Colchagua',8),
	(30,'Cauquenes',9),
	(31,'Curicó',9),
	(32,'Linares',9),
	(33,'Talca',9),
	(34,'Arauco',10),
	(35,'Bio Bío',10),
	(36,'Concepción',10),
	(37,'Ñuble',10),
	(38,'Cautín',11),
	(39,'Malleco',11),
	(40,'Valdivia',12),
	(41,'Ranco',12),
	(42,'Chiloé',13),
	(43,'Llanquihue',13),
	(44,'Osorno',13),
	(45,'Palena',13),
	(46,'Aisén',14),
	(47,'Capitán Prat',14),
	(48,'Coihaique',14),
	(49,'General Carrera',14),
	(50,'Antártica Chilena',15),
	(51,'Magallanes',15),
	(52,'Tierra del Fuego',15),
	(53,'Última Esperanza',15);



CREATE TABLE tbl_comuna (
  id_comuna INT AUTO_INCREMENT,
  nombre_comuna VARCHAR(64),
  fk_provincia_comuna INT,
  FOREIGN KEY (fk_provincia_comuna) REFERENCES tbl_provincia (id_provincia),
  PRIMARY KEY (id_comuna)
);

INSERT INTO tbl_comuna (id_comuna,nombre_comuna,fk_provincia_comuna)
VALUES
	(1,'Arica',1),
	(2,'Camarones',1),
	(3,'General Lagos',2),
	(4,'Putre',2),
	(5,'Alto Hospicio',3),
	(6,'Iquique',3),
	(7,'Camiña',4),
	(8,'Colchane',4),
	(9,'Huara',4),
	(10,'Pica',4),
	(11,'Pozo Almonte',4),
	(12,'Antofagasta',5),
	(13,'Mejillones',5),
	(14,'Sierra Gorda',5),
	(15,'Taltal',5),
	(16,'Calama',6),
	(17,'Ollague',6),
	(18,'San Pedro de Atacama',6),
	(19,'María Elena',7),
	(20,'Tocopilla',7),
	(21,'Chañaral',8),
	(22,'Diego de Almagro',8),
	(23,'Caldera',9),
	(24,'Copiapó',9),
	(25,'Tierra Amarilla',9),
	(26,'Alto del Carmen',10),
	(27,'Freirina',10),
	(28,'Huasco',10),
	(29,'Vallenar',10),
	(30,'Canela',11),
	(31,'Illapel',11),
	(32,'Los Vilos',11),
	(33,'Salamanca',11),
	(34,'Andacollo',12),
	(35,'Coquimbo',12),
	(36,'La Higuera',12),
	(37,'La Serena',12),
	(38,'Paihuaco',12),
	(39,'Vicuña',12),
	(40,'Combarbalá',13),
	(41,'Monte Patria',13),
	(42,'Ovalle',13),
	(43,'Punitaqui',13),
	(44,'Río Hurtado',13),
	(45,'Isla de Pascua',14),
	(46,'Calle Larga',15),
	(47,'Los Andes',15),
	(48,'Rinconada',15),
	(49,'San Esteban',15),
	(50,'La Ligua',16),
	(51,'Papudo',16),
	(52,'Petorca',16),
	(53,'Zapallar',16),
	(54,'Hijuelas',17),
	(55,'La Calera',17),
	(56,'La Cruz',17),
	(57,'Limache',17),
	(58,'Nogales',17),
	(59,'Olmué',17),
	(60,'Quillota',17),
	(61,'Algarrobo',18),
	(62,'Cartagena',18),
	(63,'El Quisco',18),
	(64,'El Tabo',18),
	(65,'San Antonio',18),
	(66,'Santo Domingo',18),
	(67,'Catemu',19),
	(68,'Llaillay',19),
	(69,'Panquehue',19),
	(70,'Putaendo',19),
	(71,'San Felipe',19),
	(72,'Santa María',19),
	(73,'Casablanca',20),
	(74,'Concón',20),
	(75,'Juan Fernández',20),
	(76,'Puchuncaví',20),
	(77,'Quilpué',20),
	(78,'Quintero',20),
	(79,'Valparaíso',20),
	(80,'Villa Alemana',20),
	(81,'Viña del Mar',20),
	(82,'Colina',21),
	(83,'Lampa',21),
	(84,'Tiltil',21),
	(85,'Pirque',22),
	(86,'Puente Alto',22),
	(87,'San José de Maipo',22),
	(88,'Buin',23),
	(89,'Calera de Tango',23),
	(90,'Paine',23),
	(91,'San Bernardo',23),
	(92,'Alhué',24),
	(93,'Curacaví',24),
	(94,'María Pinto',24),
	(95,'Melipilla',24),
	(96,'San Pedro',24),
	(97,'Cerrillos',25),
	(98,'Cerro Navia',25),
	(99,'Conchalí',25),
	(100,'El Bosque',25),
	(101,'Estación Central',25),
	(102,'Huechuraba',25),
	(103,'Independencia',25),
	(104,'La Cisterna',25),
	(105,'La Granja',25),
	(106,'La Florida',25),
	(107,'La Pintana',25),
	(108,'La Reina',25),
	(109,'Las Condes',25),
	(110,'Lo Barnechea',25),
	(111,'Lo Espejo',25),
	(112,'Lo Prado',25),
	(113,'Macul',25),
	(114,'Maipú',25),
	(115,'Ñuñoa',25),
	(116,'Pedro Aguirre Cerda',25),
	(117,'Peñalolén',25),
	(118,'Providencia',25),
	(119,'Pudahuel',25),
	(120,'Quilicura',25),
	(121,'Quinta Normal',25),
	(122,'Recoleta',25),
	(123,'Renca',25),
	(124,'San Miguel',25),
	(125,'San Joaquín',25),
	(126,'San Ramón',25),
	(127,'Santiago',25),
	(128,'Vitacura',25),
	(129,'El Monte',26),
	(130,'Isla de Maipo',26),
	(131,'Padre Hurtado',26),
	(132,'Peñaflor',26),
	(133,'Talagante',26),
	(134,'Codegua',27),
	(135,'Coínco',27),
	(136,'Coltauco',27),
	(137,'Doñihue',27),
	(138,'Graneros',27),
	(139,'Las Cabras',27),
	(140,'Machalí',27),
	(141,'Malloa',27),
	(142,'Mostazal',27),
	(143,'Olivar',27),
	(144,'Peumo',27),
	(145,'Pichidegua',27),
	(146,'Quinta de Tilcoco',27),
	(147,'Rancagua',27),
	(148,'Rengo',27),
	(149,'Requínoa',27),
	(150,'San Vicente de Tagua Tagua',27),
	(151,'La Estrella',28),
	(152,'Litueche',28),
	(153,'Marchihue',28),
	(154,'Navidad',28),
	(155,'Peredones',28),
	(156,'Pichilemu',28),
	(157,'Chépica',29),
	(158,'Chimbarongo',29),
	(159,'Lolol',29),
	(160,'Nancagua',29),
	(161,'Palmilla',29),
	(162,'Peralillo',29),
	(163,'Placilla',29),
	(164,'Pumanque',29),
	(165,'San Fernando',29),
	(166,'Santa Cruz',29),
	(167,'Cauquenes',30),
	(168,'Chanco',30),
	(169,'Pelluhue',30),
	(170,'Curicó',31),
	(171,'Hualañé',31),
	(172,'Licantén',31),
	(173,'Molina',31),
	(174,'Rauco',31),
	(175,'Romeral',31),
	(176,'Sagrada Familia',31),
	(177,'Teno',31),
	(178,'Vichuquén',31),
	(179,'Colbún',32),
	(180,'Linares',32),
	(181,'Longaví',32),
	(182,'Parral',32),
	(183,'Retiro',32),
	(184,'San Javier',32),
	(185,'Villa Alegre',32),
	(186,'Yerbas Buenas',32),
	(187,'Constitución',33),
	(188,'Curepto',33),
	(189,'Empedrado',33),
	(190,'Maule',33),
	(191,'Pelarco',33),
	(192,'Pencahue',33),
	(193,'Río Claro',33),
	(194,'San Clemente',33),
	(195,'San Rafael',33),
	(196,'Talca',33),
	(197,'Arauco',34),
	(198,'Cañete',34),
	(199,'Contulmo',34),
	(200,'Curanilahue',34),
	(201,'Lebu',34),
	(202,'Los Álamos',34),
	(203,'Tirúa',34),
	(204,'Alto Biobío',35),
	(205,'Antuco',35),
	(206,'Cabrero',35),
	(207,'Laja',35),
	(208,'Los Ángeles',35),
	(209,'Mulchén',35),
	(210,'Nacimiento',35),
	(211,'Negrete',35),
	(212,'Quilaco',35),
	(213,'Quilleco',35),
	(214,'San Rosendo',35),
	(215,'Santa Bárbara',35),
	(216,'Tucapel',35),
	(217,'Yumbel',35),
	(218,'Chiguayante',36),
	(219,'Concepción',36),
	(220,'Coronel',36),
	(221,'Florida',36),
	(222,'Hualpén',36),
	(223,'Hualqui',36),
	(224,'Lota',36),
	(225,'Penco',36),
	(226,'San Pedro de La Paz',36),
	(227,'Santa Juana',36),
	(228,'Talcahuano',36),
	(229,'Tomé',36),
	(230,'Bulnes',37),
	(231,'Chillán',37),
	(232,'Chillán Viejo',37),
	(233,'Cobquecura',37),
	(234,'Coelemu',37),
	(235,'Coihueco',37),
	(236,'El Carmen',37),
	(237,'Ninhue',37),
	(238,'Ñiquen',37),
	(239,'Pemuco',37),
	(240,'Pinto',37),
	(241,'Portezuelo',37),
	(242,'Quillón',37),
	(243,'Quirihue',37),
	(244,'Ránquil',37),
	(245,'San Carlos',37),
	(246,'San Fabián',37),
	(247,'San Ignacio',37),
	(248,'San Nicolás',37),
	(249,'Treguaco',37),
	(250,'Yungay',37),
	(251,'Carahue',38),
	(252,'Cholchol',38),
	(253,'Cunco',38),
	(254,'Curarrehue',38),
	(255,'Freire',38),
	(256,'Galvarino',38),
	(257,'Gorbea',38),
	(258,'Lautaro',38),
	(259,'Loncoche',38),
	(260,'Melipeuco',38),
	(261,'Nueva Imperial',38),
	(262,'Padre Las Casas',38),
	(263,'Perquenco',38),
	(264,'Pitrufquén',38),
	(265,'Pucón',38),
	(266,'Saavedra',38),
	(267,'Temuco',38),
	(268,'Teodoro Schmidt',38),
	(269,'Toltén',38),
	(270,'Vilcún',38),
	(271,'Villarrica',38),
	(272,'Angol',39),
	(273,'Collipulli',39),
	(274,'Curacautín',39),
	(275,'Ercilla',39),
	(276,'Lonquimay',39),
	(277,'Los Sauces',39),
	(278,'Lumaco',39),
	(279,'Purén',39),
	(280,'Renaico',39),
	(281,'Traiguén',39),
	(282,'Victoria',39),
	(283,'Corral',40),
	(284,'Lanco',40),
	(285,'Los Lagos',40),
	(286,'Máfil',40),
	(287,'Mariquina',40),
	(288,'Paillaco',40),
	(289,'Panguipulli',40),
	(290,'Valdivia',40),
	(291,'Futrono',41),
	(292,'La Unión',41),
	(293,'Lago Ranco',41),
	(294,'Río Bueno',41),
	(295,'Ancud',42),
	(296,'Castro',42),
	(297,'Chonchi',42),
	(298,'Curaco de Vélez',42),
	(299,'Dalcahue',42),
	(300,'Puqueldón',42),
	(301,'Queilén',42),
	(302,'Quemchi',42),
	(303,'Quellón',42),
	(304,'Quinchao',42),
	(305,'Calbuco',43),
	(306,'Cochamó',43),
	(307,'Fresia',43),
	(308,'Frutillar',43),
	(309,'Llanquihue',43),
	(310,'Los Muermos',43),
	(311,'Maullín',43),
	(312,'Puerto Montt',43),
	(313,'Puerto Varas',43),
	(314,'Osorno',44),
	(315,'Puero Octay',44),
	(316,'Purranque',44),
	(317,'Puyehue',44),
	(318,'Río Negro',44),
	(319,'San Juan de la Costa',44),
	(320,'San Pablo',44),
	(321,'Chaitén',45),
	(322,'Futaleufú',45),
	(323,'Hualaihué',45),
	(324,'Palena',45),
	(325,'Aisén',46),
	(326,'Cisnes',46),
	(327,'Guaitecas',46),
	(328,'Cochrane',47),
	(329,'O\'higgins',47),
	(330,'Tortel',47),
	(331,'Coihaique',48),
	(332,'Lago Verde',48),
	(333,'Chile Chico',49),
	(334,'Río Ibáñez',49),
	(335,'Antártica',50),
	(336,'Cabo de Hornos',50),
	(337,'Laguna Blanca',51),
	(338,'Punta Arenas',51),
	(339,'Río Verde',51),
	(340,'San Gregorio',51),
	(341,'Porvenir',52),
	(342,'Primavera',52),
	(343,'Timaukel',52),
	(344,'Natales',53),
	(345,'Torres del Paine',53);




-- consulta de prueba SELECT * FROM comuna ORDER BY comuna_nombre ASC;


CREATE TABLE tbl_cargo (
id_cargo INT AUTO_INCREMENT,
nombre_cargo VARCHAR (20000),
PRIMARY KEY (id_cargo)
);

CREATE TABLE tbl_estado (
id_estado INT AUTO_INCREMENT,
nombre_estado VARCHAR (20000),
PRIMARY KEY (id_estado)
);

INSERT INTO tbl_estado VALUES (NULL, 'Activo');
INSERT INTO tbl_estado VALUES (NULL, 'Suspendido');
INSERT INTO tbl_estado VALUES (NULL, 'Separado');
INSERT INTO tbl_estado VALUES (NULL, 'Fallecido');
INSERT INTO tbl_estado VALUES (NULL, 'Mártir');

/*DROP TABLE tbl_cargo;*/
CREATE TABLE tbl_cargo (
id_cargo INT AUTO_INCREMENT,
nombre_cargo VARCHAR (5000),
PRIMARY KEY (id_cargo)
);

INSERT INTO tbl_cargo (nombre_cargo) VALUES
('Superintendente'),
('Vice Superintendente'),
('Comandante Primero'),
('Comandante Segundo'),
('Tesorero General'),
('Secretario General')
;

CREATE TABLE tbl_compania (
id_compania INT AUTO_INCREMENT,
nombre_compania VARCHAR (5000),
PRIMARY KEY (id_compania)
);

INSERT INTO tbl_compania (nombre_compania) VALUES 
('Primera'),
('Segunda'),
('Tercera')
;


CREATE TABLE tbl_informacionBomberil (
id_informacionBomberil INT AUTO_INCREMENT,
fk_region_informacionBomberil INT,
cuerpo_informacionBomberil VARCHAR (20000),
fk_compania_informacionBomberil INT,
fk_cargo_informacionBomberil INT,
fecha_de_ingreso_informacionBomberil DATE,
N_Reg_General_informacionBomberil INT,
fk_estado_informacionBomberil INT,
N_Reg_Cia_informacionBomberil INT,
fk_informacion_personal__informacionBomberil INT,
FOREIGN KEY (fk_informacion_personal__informacionBomberil) REFERENCES tbl_informacionPersonal (id_informacionPersonal),
FOREIGN KEY (fk_region_informacionBomberil) REFERENCES tbl_region (id_region),
FOREIGN KEY (fk_cargo_informacionBomberil) REFERENCEs tbl_cargo (id_cargo),
FOREIGN KEY (fk_estado_informacionBomberil) REFERENCEs tbl_estado (id_estado),
FOREIGN KEY (fk_compania_informacionBomberil) REFERENCEs tbl_compania (id_compania),
PRIMARY KEY (id_informacionBomberil)
);


CREATE TABLE tbl_informacionLaboral (
id_informacionLaboral INT AUTO_INCREMENT,
nombre_de_empresa_informacionLaboral VARCHAR (5000),
direccion_de_empresa_informacionLaboral VARCHAR (5000),
telefono_de_empresa_informacionLaboral VARCHAR (5000),
cargo_en_la_empresa_informacionLaboral VARCHAR (5000),
fecha_de_ingreso_a_la_empresa_informacionLaboral DATE,
area_o_departamento_en_la_empresa_informacionLaboral VARCHAR (5000),
afp_informacionLaboral VARCHAR (5000),
profesion_informacionLaboral VARCHAR (5000),
fk_informacion_personal_informacionLaboral INT,
FOREIGN KEY (fk_informacion_personal_informacionLaboral) REFERENCES tbl_informacionPersonal (id_informacionPersonal),
PRIMARY KEY (id_informacionLaboral)
);


CREATE TABLE tbl_grupo_sanguineo (
id_grupo_sanguineo INT AUTO_INCREMENT,
nombre_grupo_sanguineo VARCHAR (30), 
factorRHPositivo_grupo_sanguineo BOOLEAN,
PRIMARY KEY (id_grupo_sanguineo)
);

INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'A',0);
INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'B',0);
INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'AB',0);
INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'0',0);
INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'A',1);
INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'B',1);
INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'AB',1);
INSERT INTO tbl_grupo_sanguineo VALUES (NULL,'0',1);

CREATE TABLE tbl_parentesco (
id_parentesco INT AUTO_INCREMENT,
nombre_parentesco VARCHAR (5000),
PRIMARY KEY(id_parentesco)
);

INSERT INTO tbl_parentesco VALUES (NULL, 'Padre');
INSERT INTO tbl_parentesco VALUES (NULL, 'Madre');
INSERT INTO tbl_parentesco VALUES (NULL, 'Hijo');
INSERT INTO tbl_parentesco VALUES (NULL, 'Hija');
INSERT INTO tbl_parentesco VALUES (NULL, 'Abuelo');
INSERT INTO tbl_parentesco VALUES (NULL, 'Abuela');
INSERT INTO tbl_parentesco VALUES (NULL, 'Hermano');
INSERT INTO tbl_parentesco VALUES (NULL, 'Hermana');
INSERT INTO tbl_parentesco VALUES (NULL, 'Primo');
INSERT INTO tbl_parentesco VALUES (NULL, 'Prima');
INSERT INTO tbl_parentesco VALUES (NULL, 'Tío');
INSERT INTO tbl_parentesco VALUES (NULL, 'Tía');

-- informacion medica es la tabla que hay que partir en 2
CREATE TABLE tbl_informacionMedica1 (
id_informacionMedica1 INT AUTO_INCREMENT,
prestacionMedica_informacionMedica1 VARCHAR (5000),
alergias_informacionMedica1 VARCHAR (5000),
enfermedades_croncias_informacionMedica1 VARCHAR (5000),
fk_informacion_personal_informacionMedica1 INT,
FOREIGN KEY (fk_informacion_personal_informacionMedica1) REFERENCES tbl_informacionPersonal (id_informacionPersonal),
PRIMARY KEY (id_informacionMedica1)
);


CREATE TABLE tbl_informacionMedica2 (
id_informacionMedica2 INT,
medicamentos_habituales_informacionMedica2 VARCHAR (5000),
nombre_de_contacto_informacionMedica2 VARCHAR (5000),
telefono_de_contacto_informacionMedica2 VARCHAR (5000),
fk_parentesco_del_contacto_informacionMedica2 INT,
nivel_de_actividad_fisica_informacionMedica2 VARCHAR (5000),
es_donante_informacionMedica2 BOOLEAN,
es_fumador_informacionMedica2 BOOLEAN,
fk_grupo_sanguineo_informacionMedica2 INT,
fk_informacion_personal_informacionMedica2 INT,
FOREIGN KEY (fk_informacion_personal_informacionMedica2) REFERENCES tbl_informacionPersonal (id_informacionPersonal),
FOREIGN KEY (fk_parentesco_del_contacto_informacionMedica2) REFERENCES tbl_parentesco (id_parentesco),
FOREIGN KEY (fk_grupo_sanguineo_informacionMedica2) REFERENCES tbl_grupo_sanguineo (id_grupo_sanguineo),
PRIMARY KEY (id_informacionMedica2)

);



CREATE TABLE tbl_informacionFamiliar (
id_informacionFamiliar INT AUTO_INCREMENT,
nombres_informacionFamiliar VARCHAR (5000),
fecha_de_nacimiento_informacionFamiliar DATE,
fk_parentesco_informacionFamiliar INT,
fk_informacionPersonal_informacionFamiliar INT,
FOREIGN KEY (fk_informacionPersonal_informacionFamiliar) REFERENCES tbl_informacionPersonal (id_informacionPersonal),
FOREIGN KEY (fk_parentesco_informacionFamiliar) REFERENCES tbl_informacionPersonal (id_informacionPersonal),
PRIMARY KEY(id_informacionFamiliar)
);


CREATE TABLE tbl_estado_curso(
id_estado_curso INT AUTO_INCREMENT,
nombre_estado_curso VARCHAR (5000),
PRIMARY KEY(id_estado_curso)
);

INSERT INTO tbl_estado_curso VALUES (NULL, 'Aprobado');
INSERT INTO tbl_estado_curso VALUES (NULL, 'Rechazado');
INSERT INTO tbl_estado_curso VALUES (NULL, 'En curso');
INSERT INTO tbl_estado_curso VALUES (NULL, 'Congelado');


CREATE TABLE tbl_informacionAcademica(
id_informacionAcademica INT AUTO_INCREMENT,
fecha_informacionAcademica DATE,
actividad_informacionAcademica VARCHAR (300),
fk_estado_curso_informacionAcademica INT,
fk_informacionPersonal_informacionAcademica INT,
FOREIGN KEY (fk_informacionPersonal_informacionAcademica) REFERENCES tbl_informacionPersonal (id_informacionPersonal), 
FOREIGN KEY (fk_estado_curso_informacionAcademica) REFERENCES tbl_estado_curso (id_estado_curso), 
PRIMARY KEY (id_informacionAcademica)
);

CREATE TABLE tbl_entrenamientoEstandar(
id_entrenamientoEstandar INT AUTO_INCREMENT,
fecha_entrenamientoEstandar DATE,
actividad_entrenamientoEstandar VARCHAR (300),
fk_estado_curso_entrenamientoEstandar INT,
fk_informacionPersonal_entrenamientoEstandar INT,
FOREIGN KEY (fk_informacionPersonal_entrenamientoEstandar) REFERENCES tbl_informacionPersonal (id_informacionPersonal), 
FOREIGN KEY (fk_estado_curso_entrenamientoEstandar) REFERENCES tbl_estado_curso (id_estado_curso), 
PRIMARY KEY (id_entrenamientoEstandar)
);



CREATE TABLE tbl_informacionHistorica(
id_informacionHistorica INT AUTO_INCREMENT,
fk_region_informacionHistorica INT,
cuerpo VARCHAR (5000),
compania VARCHAR (5000),
fechaDeCambio DATE,
tipoDeCambio VARCHAR (20000),
motivo TEXT (2000),
detalle VARCHAR (20000),
fk_informacionPersonal_informacionHistorica INT,
FOREIGN KEY (fk_informacionPersonal_informacionHistorica) REFERENCES tbl_informacionPersonal (id_informacionPersonal), 
FOREIGN KEY (fk_region_informacionHistorica) REFERENCES tbl_region (id_region), 
PRIMARY KEY (id_informacionHistorica)
);








/*
DELIMITER //
CREATE PROCEDURE crearUsuario () -- DROP PROCEDURE crearUsuario
MODIFIES SQL DATA
BEGIN
DECLARE nombreUsuario VARCHAR(12);
DECLARE idMasAlto INT;
DECLARE pass VARCHAR (12);
START TRANSACTION;
SELECT MAX(id) INTO @idMasAlto FROM informacionPersonal;
SELECT rut INTO @nombreUsuario FROM informacionPersonal WHERE id= @idMasAlto;
SET pass='123';
SET @query1 = CONCAT("
        CREATE USER  ",@nombreUsuario,"@localhost IDENTIFIED BY ",@pass,"" 
        );
PREPARE stmt FROM @query1; EXECUTE stmt; DEALLOCATE PREPARE stmt;
SET @query1 = CONCAT("
    GRANT SELECT ON bomberosPrimeraIteracion.* TO ",@nombreUsuario,"@localhost" 
        );
PREPARE stmt FROM @query1; EXECUTE stmt; DEALLOCATE PREPARE stmt;
COMMIT;
END //
DELIMITER ;
*/









/*
select * from mysql.user;
SELECT * FROM usuario;
SELECT * FROM informacionPersonal;
SELECT * FROM region;

SELECT nombre AS 'Nombre', 
             CASE WHEN factorRHPositivo=0      
             THEN 'Negativo'
                ELSE 'Positivo'
       END AS Factor_RH FROM grupo_sanguineo;



SELECT enfermedad_cronica.nombre FROM enfermedad_cronica, enfermedad_cronica_informacionMedica, informacionMedica  WHERE enfermedad_cronica_informacionMedica.fk_enfermedad_cronica=enfermedad_cronica.id
AND enfermedad_cronica_informacionMedica.fk_informacionMedica=informacionMedica.id; -- con esta se pueden ver los nombres de las alergias



SELECT *, DATE_FORMAT(fecha_de_nacimiento,'%d/%m/%Y') AS niceDate 
FROM informacionPersonal 
ORDER BY fecha_de_nacimiento DESC
LIMIT 0,14;


SET @exporter = 'yolo';

SET @createUser = CONCAT(
            "CREATE USER ",@exporter,"@localhost IDENTIFIED BY 'mypass'" 
          );

PREPARE smtpCreateUser FROM @createUser;
EXECUTE smtpCreateUser;


DROP DATABASE bomberosBD;


*/