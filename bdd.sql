DROP TABLE IF EXISTS video;
DROP TABLE IF EXISTS disco;
DROP TABLE IF EXISTS prestamo;
DROP TABLE IF EXISTS empleado;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS permisos;
DROP TABLE IF EXISTS socio;

CREATE TABLE permisos (
	id_permiso int(2) PRIMARY KEY AUTO_INCREMENT,
	descripcion varchar(100)
);

CREATE TABLE usuario (
	id_usuario int(5) PRIMARY KEY AUTO_INCREMENT,
	pass varchar(100) /*WIP SHA?*/,
	nombre varchar(25) NOT NULL UNIQUE,
	apellidos varchar(50) NOT NULL,
	permiso int(2) NOT NULL,
	FOREIGN KEY (permiso) REFERENCES permisos(id_permiso)
);

/*
CREATE TABLE empleado (
	id_empleado int(5) PRIMARY KEY AUTO_INCREMENT,
	id_usuario int(5),
	posicion varchar(20) NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

CREATE TABLE socio (
	id_socio int(5) PRIMARY KEY AUTO_INCREMENT,
	id_usuario int(5) ,
	FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
*/

CREATE TABLE prestamo (
	id_prestamo int(5) PRIMARY KEY AUTO_INCREMENT,
	empleado int(5) ,
	socio int(5) ,
	fecha_inicio date NOT NULL,
	duracion int(3) NOT NULL,
	fecha_entrega date,
	FOREIGN KEY (empleado) REFERENCES usuario(id_usuario),
	FOREIGN KEY (socio) REFERENCES usuario(id_usuario)
);

CREATE TABLE video (
	id_video int(5) PRIMARY KEY AUTO_INCREMENT,
	id_prestamo int(5),
	nombre_video varchar(50) NOT NULL,
	protagonista varchar(70),
	FOREIGN KEY (id_prestamo) REFERENCES prestamo(id_prestamo)
);

CREATE TABLE disco (
	id_disco int(5) PRIMARY KEY AUTO_INCREMENT,
	id_prestamo int(5),
	nombre_disco varchar(25) NOT NULL,
	autor varchar(70) NOT NULL,
	FOREIGN KEY (id_prestamo) REFERENCES prestamo(id_prestamo) 
);

INSERT INTO permisos VALUES (0,'socio'),(0,'empleado'),(0,'jefe');
INSERT INTO usuario VALUES (0,'123','socio','socio',1),(0,'123','empleado','empleado',2);
INSERT INTO prestamo (id_prestamo, empleado, socio, fecha_inicio, duracion, fecha_entrega) VALUES (NULL, '2', '1', '2018-02-04', '7', NULL);
INSERT INTO disco (id_disco, id_prestamo, nombre_disco, autor) VALUES (NULL, '1', 'Thriller', 'Michael Jackson');
INSERT INTO prestamo (id_prestamo, empleado, socio, fecha_inicio, duracion, fecha_entrega) VALUES (NULL, '2', '1', '2018-02-07', '20', NULL);
INSERT INTO disco (id_disco, id_prestamo, nombre_disco, autor) VALUES (NULL, '2', 'The dark side of the moon', 'Pink Floy');
INSERT INTO video (id_video, id_prestamo, nombre_video, protagonista) VALUES (NULL, '2', 'Live at Wembley Stadium', 'Queen');
INSERT INTO video (id_video, id_prestamo, nombre_video, protagonista) VALUES (NULL, '2', 'En la arena', 'Hombre G');

INSERT INTO video (id_video, id_prestamo, nombre_video, protagonista) VALUES (NULL, NULL, 'Uprising Live!', 'Bob Marley');
INSERT INTO video (id_video, id_prestamo, nombre_video, protagonista) VALUES (NULL, NULL, 'Live at Rockpalast', 'Aswad');
INSERT INTO video (id_video, id_prestamo, nombre_video, protagonista) VALUES (NULL, NULL, 'Quebec Magnetic', 'Metallica');
INSERT INTO video (id_video, id_prestamo, nombre_video, protagonista) VALUES (NULL, NULL, 'Yo me veo contigo', 'Melendi ');

INSERT INTO disco (id_disco, id_prestamo, nombre_disco, autor) VALUES (NULL, NULL, 'Back in black', 'AC/DC');
INSERT INTO disco (id_disco, id_prestamo, nombre_disco, autor) VALUES (NULL, NULL, 'The Greatest hits', 'The Eagles');
INSERT INTO disco (id_disco, id_prestamo, nombre_disco, autor) VALUES (NULL, NULL, 'Rumours', 'Fleetwood Mac');
INSERT INTO disco (id_disco, id_prestamo, nombre_disco, autor) VALUES (NULL, NULL, 'Nevermind', 'Nirvana');