CREATE TABLE public.sistema (
	id_sistema char(10) NOT NULL,
	nom_sistema char(50),
	web_sistema char(150),
	propietario_sistema char(50),
	email_sistema char(60),
	CONSTRAINT sistema_pk PRIMARY KEY (id_sistema)
);

CREATE TABLE public.tipo_servicio (
	id_servicio char(10) NOT NULL,
	nom_servicio char(50),
	costo_servicio numeric(5,2),
	cantidad_cita_servicio char(2),
	id_sistema_sistema char(10) NOT NULL,
	CONSTRAINT tipo_servicio_pk PRIMARY KEY (id_servicio)
);

CREATE TABLE public.usuario (
	id_usuario char(10) NOT NULL,
	nickname_usuario char(50),
	nom_usuario char(50),
	apell_usuario char(50),
	fecha_nacimiento_usuario date,
	ced_usuario char(15),
	telf_usuario char(15),
	email_usuario char(60),
	dirc_usuario char(50),
	ciudad_usuario char(50),
	provincia_usuario char(50),
	pais_usuario char(50),
	genero_usuario char(1),
	genero_preferente_usuario char(1),
	talla_usuario numeric(3,2),
	profesion_usuario char(50),
	id_servicio_tipo_servicio char(10) NOT NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (id_usuario)
);

ALTER TABLE public.usuario ADD CONSTRAINT tipo_servicio_fk FOREIGN KEY (id_servicio_tipo_servicio)
REFERENCES public.tipo_servicio (id_servicio) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.tipo_servicio ADD CONSTRAINT sistema_fk FOREIGN KEY (id_sistema_sistema)
REFERENCES public.sistema (id_sistema) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE public.hobbies (
	id_hobbies char(10) NOT NULL,
	nom_hobbies char(50),
	CONSTRAINT hobbies_pk PRIMARY KEY (id_hobbies)

);

CREATE TABLE public.hobbies_usuario (
	id_usuario_usuario char(10) NOT NULL,
	id_hobbies_hobbies char(10) NOT NULL
);

ALTER TABLE public.hobbies_usuario ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario_usuario)
REFERENCES public.usuario (id_usuario) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE public.hobbies_usuario ADD CONSTRAINT hobbies_fk FOREIGN KEY (id_hobbies_hobbies)
REFERENCES public.hobbies (id_hobbies) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE public.pareja_de_cita (
	id_pareja_cita char(10) NOT NULL,
	id_usuario_usuario char(10) NOT NULL,
	id_cita_cita char(10) NOT NULL,
	CONSTRAINT pareja_de_cita_pk PRIMARY KEY (id_pareja_cita)

);

ALTER TABLE public.pareja_de_cita ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario_usuario)
REFERENCES public.usuario (id_usuario) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE public.cita (
	id_cita char(10) NOT NULL,
	hora_cita char(15),
	fecha_cita date,
	estado_cita bool,
	calificacion_cita char(20),
	id_lugar_lugar_cita char(10) NOT NULL,
	CONSTRAINT cita_pk PRIMARY KEY (id_cita)

);

ALTER TABLE public.pareja_de_cita ADD CONSTRAINT cita_fk FOREIGN KEY (id_cita_cita)
REFERENCES public.cita (id_cita) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE public.lugar_cita (
	id_lugar char(10) NOT NULL,
	nom_lugar char(50),
	dirc_lugar char(50),
	email_lugar char(50),
	ciudad_lugar char(50),
	provincia_lugar char(50),
	pais_lugar char(50),
	convenio_lugar bool,
	CONSTRAINT lugar_cita_pk PRIMARY KEY (id_lugar)
);

ALTER TABLE public.cita ADD CONSTRAINT lugar_cita_fk FOREIGN KEY (id_lugar_lugar_cita)
REFERENCES public.lugar_cita (id_lugar) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;




-- 								INSERT								--
--SISTEMA
--select * from sistema
insert into sistema values ('sistema001','Citas a Ciegas','www.citas_a_ciegas.com',
						   'Enrique, C','citasciegas@gmail.com');


--TIPO DE SERVICIO
--select * from tipo_servicio
insert into tipo_servicio values ('servicio01','Suscripción Bronce','15.00',
						   '2','sistema001');
insert into tipo_servicio values ('servicio02','Suscripción Plata','25.00',
						   '4','sistema001');
insert into tipo_servicio values ('servicio03','Suscripción Oro','40.00',
						   '8','sistema001');
						   

--LUGAR DE CITAS
--select * from lugar_cita
insert into lugar_cita values ('lugarct001','La Pata Gorda','Cdla. Miraflores Av. Principal 116 y Calle 2da', 
							   'lapatagorda@hotmail.com','Manta','Manabí', 'Ecuador', '1');
insert into lugar_cita values ('lugarct002','Cafetería Chispita','Chue Guevara Entre 4ta y 5ta Transversal', 
							   'cafechispita@hotmail.com','Portoviejo','Manabí', 'Ecuador', '1');
insert into lugar_cita values ('lugarct003','Casa Club Chone','Calle Colón y Manuel de Jesús', 
							   'casaclubchone@hotmail.com','Chone','Manabí', 'Ecuador', '1');
insert into lugar_cita values ('lugarct004','Atletica Restaurant','Calle Rocafuerte entre Colón y Montalvo', 
							   'atletica@hotmail.com','Jipijapa','Manabí', 'Ecuador', '0');					   
						   


--HOBBIES DE USUARIOS
--select * from hobbies_usuario
insert into hobbies values ('hobbies001','Acampar');
insert into hobbies values ('hobbies002','Ejercicios');
insert into hobbies values ('hobbies003','Viajar');
insert into hobbies values ('hobbies004','Deporte');
insert into hobbies values ('hobbies005','Cocinar');


--USUARIO
--select * from usuario
insert into usuario values ('usuario001','AndresQ','Andres, D', 'Quiroz, M','16/06/1997', '1121545789', 
							   '+593 988989895', 'andresq@hotmail.com', 'Calle 32, av 15', 'Manta',
							'Manabí', 'Ecuador', 'M', 'F', '1.65', 'Estudiante', 'servicio01');
insert into usuario values ('usuario002','SamuelP','Samuel, D', 'Palacios, M','16/07/1997', '1187875522', 
							   '+593 988942121', 'samuelp@hotmail.com', 'Calle 15, av 15', 'Manta',
							'Manabí', 'Ecuador', 'M', 'F', '1.70', 'Estudiante', 'servicio01');
insert into usuario values ('usuario003','CarlosR','Carlos, D', 'Ruiz, M','16/06/1996', '1121544411', 
							   '+593 989891110', 'carlosr@hotmail.com', 'Calle 21, av 15', 'Chone',
							'Manabí', 'Ecuador', 'M', 'F', '1.75', 'Estudiante', 'servicio02');
insert into usuario values ('usuario004','SofiaQ','Sofia, D', 'Quijije, M','16/06/1997', '1121547189', 
							   '+593 988989801', 'sofiaq@hotmail.com', 'Calle 12, av 32', 'portoviejo',
							'Manabí', 'Ecuador', 'F', 'M', '1.65', 'Estudiante', 'servicio02');
insert into usuario values ('usuario005','MelisaG','Melisa, D', 'Guerra, M','16/06/1997', '1121547009', 
							   '+593 988989000', 'melisag@hotmail.com', 'Calle 2, av 15', 'Rocafuerte',
							'Manabí', 'Ecuador', 'F', 'M', '1.60', 'Estudiante', 'servicio03');
insert into usuario values ('usuario006','JulissaM','Julissa, D', 'Mero, M','16/06/1994', '1121547003', 
							   '+593 988989009', 'julissamg@hotmail.com', 'Calle 2, av 15', 'Manta',
							'Manabí', 'Ecuador', 'F', 'M', '1.60', 'Estudiante', 'servicio03');	
					
					
--TABLA INTERMEDIA DE HOBBIES DE USUARIOS
--select * from hobbies_usuario
insert into hobbies_usuario values ('usuario001','hobbies001');
insert into hobbies_usuario values ('usuario002','hobbies003');
insert into hobbies_usuario values ('usuario003','hobbies005');	
insert into hobbies_usuario values ('usuario004','hobbies002');	
insert into hobbies_usuario values ('usuario005','hobbies004');	
insert into hobbies_usuario values ('usuario006','hobbies001');	
	
	
--CITAS
--select * from cita
insert into cita values ('cita000001','15:00 pm', '15/06/2021', '1', 'Excelente', 'lugarct001');
insert into cita values ('cita000002','15:00 pm', '15/06/2021', '1', 'Excelente', 'lugarct001');
insert into cita values ('cita000003','16:00 pm', '18/07/2021', '1', 'Excelente', 'lugarct001');
insert into cita values ('cita000004','17:00 pm', '01/05/2021', '1', 'Bueno', 'lugarct001');
insert into cita values ('cita000005','10:00 am', '01/05/2021', '0', 'Malo', 'lugarct001');

insert into cita values ('cita000006','15:00 pm', '15/07/2021', '1', 'Excelente', 'lugarct002');
insert into cita values ('cita000007','10:00 pm', '14/05/2021', '1', 'Bueno', 'lugarct002');
insert into cita values ('cita000008','10:00 am', '21/06/2021', '0', 'Malo', 'lugarct002');
insert into cita values ('cita000009','20:00 pm', '06/06/2021', '0', 'Malo', 'lugarct002');
insert into cita values ('cita000010','21:00 am', '15/04/2021', '0', 'Malo', 'lugarct002');

insert into cita values ('cita000011','15:00 pm', '15/07/2021', '1', 'Bueno', 'lugarct003');
insert into cita values ('cita000012','10:00 pm', '14/05/2021', '0', 'Malo', 'lugarct003');
insert into cita values ('cita000013','10:00 am', '21/06/2021', '0', 'Malo', 'lugarct003');

insert into cita values ('cita000014','15:00 pm', '15/07/2021', '1', 'Excelente', 'lugarct004');
insert into cita values ('cita000015','10:00 pm', '14/05/2021', '1', 'Excelente', 'lugarct004');
insert into cita values ('cita000016','10:00 am', '21/06/2021', '1', 'Bueno', 'lugarct004');
insert into cita values ('cita000017','15:00 pm', '15/07/2021', '0', 'Malo', 'lugarct004');
insert into cita values ('cita000018','10:00 pm', '14/05/2021', '0', 'Malo', 'lugarct004');



--PAREJA DE CITA
--select * from pareja_de_cita
insert into pareja_de_cita values ('pcita00001','usuario001', 'cita000001');
insert into pareja_de_cita values ('pcita00002','usuario004', 'cita000001');

insert into pareja_de_cita values ('pcita00003','usuario001', 'cita000002');
insert into pareja_de_cita values ('pcita00004','usuario005', 'cita000002');

insert into pareja_de_cita values ('pcita00005','usuario001', 'cita000003');
insert into pareja_de_cita values ('pcita00006','usuario006', 'cita000003');

insert into pareja_de_cita values ('pcita00007','usuario002', 'cita000004');
insert into pareja_de_cita values ('pcita00008','usuario004', 'cita000004');

insert into pareja_de_cita values ('pcita00009','usuario002', 'cita000005');
insert into pareja_de_cita values ('pcita00010','usuario005', 'cita000005');

insert into pareja_de_cita values ('pcita00011','usuario002', 'cita000006');
insert into pareja_de_cita values ('pcita00012','usuario006', 'cita000006');

insert into pareja_de_cita values ('pcita00013','usuario003', 'cita000007');
insert into pareja_de_cita values ('pcita00014','usuario005', 'cita000007');

insert into pareja_de_cita values ('pcita00015','usuario003', 'cita000008');
insert into pareja_de_cita values ('pcita00016','usuario006', 'cita000008');

insert into pareja_de_cita values ('pcita00017','usuario004', 'cita000009');
insert into pareja_de_cita values ('pcita00018','usuario003', 'cita000009');

insert into pareja_de_cita values ('pcita00019','usuario005', 'cita000010');
insert into pareja_de_cita values ('pcita00020','usuario001', 'cita000010');

insert into pareja_de_cita values ('pcita00021','usuario005', 'cita000011');
insert into pareja_de_cita values ('pcita00022','usuario003', 'cita000011');

insert into pareja_de_cita values ('pcita00023','usuario006', 'cita000012');
insert into pareja_de_cita values ('pcita00024','usuario002', 'cita000012');

insert into pareja_de_cita values ('pcita00025','usuario006', 'cita000013');
insert into pareja_de_cita values ('pcita00026','usuario004', 'cita000013');

---
insert into pareja_de_cita values ('pcita00027','usuario004', 'cita000014');
insert into pareja_de_cita values ('pcita00028','usuario003', 'cita000014');

insert into pareja_de_cita values ('pcita00029','usuario005', 'cita000015');
insert into pareja_de_cita values ('pcita00030','usuario001', 'cita000015');

insert into pareja_de_cita values ('pcita00031','usuario005', 'cita000016');
insert into pareja_de_cita values ('pcita00032','usuario003', 'cita000016');

insert into pareja_de_cita values ('pcita00033','usuario006', 'cita000017');
insert into pareja_de_cita values ('pcita00034','usuario002', 'cita000017');

insert into pareja_de_cita values ('pcita00035','usuario006', 'cita000018');
insert into pareja_de_cita values ('pcita00036','usuario004', 'cita000018');




