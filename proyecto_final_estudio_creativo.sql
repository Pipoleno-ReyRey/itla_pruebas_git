create database EstudioCreativo;
use EstudioCreativo;

create table clientes(
id int primary key auto_increment,
nombre varchar(60) not null,
correo_electronico varchar(45) not null,
numero_telefonico varchar(20) not null,
direccion varchar(100)
);

create table descripciones(
id int primary key auto_increment,
descripcion text not null 
);

create table categorias(
id int primary key auto_increment,
categoria varchar(45) not null
);

create table proyectos(
id int primary key auto_increment,
nombre varchar(60) not null,
coste float not null,
descripcion_id int not null,
fecha_entrega datetime not null,
id_cliente int not null,
categoria_id int not null,
foreign key (descripcion_id) references descripciones(id),
foreign key (id_cliente) references clientes(id),
foreign key (categoria_id) references categorias(id)
);

create table facturas(
num int primary key auto_increment,
coste float not null,
descripcion_id int not null,
proyecto_id int not null,
foreign key (descripcion_id) references descripciones(id),
foreign key (proyecto_id) references proyectos(id)
);

create table tareas(
id int primary key auto_increment,
tareas varchar(100) not null
);

create table profesiones(
id int primary key auto_increment,
profesion varchar(45) not null,
tareas_id int not null,
foreign key (tareas_id) references tareas(id)
);

create table trabajadores(
id int primary key auto_increment,
nombre varchar(60) not null,
proyecto_id int not null,
profesion_id int not null,
sueldo float,
foreign key (profesion_id) references profesiones(id),
foreign key (proyecto_id) references proyectos(id)
);

insert into clientes(nombre, correo_electronico, numero_telefonico, direccion) values 
('VeloCourier', 'VeloCourier@gmail.com', '8097651231', 'Calle del Sol #123, Santo Domingo'),
('QuantumGym', 'QuantumGym@gmail.com', '8498703129', 'Avenida del Merengue #567, San Pedro de Macorís'),
('SynthoGenetics', 'SynthoGenetics@gmail.com', '8295549922', 'Calle del Cacao #234, La Romana'),
('BioTech Harvest', 'BioTech_Harvest@gmail.com', '8795524332', 'Calle del Cacao #234, La Romana'),
('Raul Martinez Alcantara', 'RaulMartinez@gmail.com', '8094520665', 'Calle del Coral #543, Las Terrenas');

select * from clientes;

insert into descripciones(descripcion) values 
('Diseño de un nuevo centro de salud.
 Ubicación: Comunidad desatendida con acceso limitado a la atención médica. 
 Enfoque: Sostenibilidad, respeto al medio ambiente, inclusión y accesibilidad para personas con discapacidades. 
 Servicios: Atención primaria, atención especializada, servicios de salud mental y servicios de prevención.'),
('Creación de una campaña de marketing. 
Objetivo: Personas en comunidades desatendidas.
Mensaje: Beneficios de la atención médica integral.
Canales: Anuncios públicos, redes sociales y eventos comunitarios.'),
('Estrategia de marketing.
Redes sociales: Presencia activa en redes sociales como Facebook, Instagram, Twitter y YouTube para conectar con el público objetivo.
Marketing de influencers: Colaboración con influencers del mundo del cine para promocionar las películas de Cielo Lúcido.
Publicidad: Campañas de publicidad online y offline en medios especializados en cine.
Relaciones públicas: Gestión de relaciones con medios de comunicación para obtener cobertura editorial.'),
('Creación de un laboratorio de investigación interdisciplinario. 
Objetivo: Fomentar la colaboración entre investigadores de diferentes áreas para abordar problemas complejos desde una perspectiva holística. 
Características: espacios físicos y virtuales para la colaboración, equipamiento de última generación, programas de intercambio y formación para investigadores, financiamiento para proyectos interdisciplinarios.'),
('Desarrollo de una aplicación móvil integral.
Objetivo: facilitar la gestión del entrenamiento y la conexión con la comunidad Movimiento Vital.
Funciones: reserva de clases y seguimiento del progreso,lanes de entrenamiento personalizados, asesoramiento nutricional, conexión con otros miembros de la comunidad, retos y actividades motivacionales.'),
('Desarrollo de una plataforma de inteligencia artificial para la automatización de tareas. 
Objetivo: Automatizar tareas repetitivas y tediosas en diferentes sectores, como: atención al cliente, análisis de datos, gestión de procesos, marketing, finanzas.
Componentes: algoritmos de aprendizaje automático, interfaz intuitiva para la configuración y gestión de tareas, integración con otros sistemas y aplicaciones, capacitación y soporte técnico.'),
('Creación de un campus sostenible y conectado.
Diseño: espacios flexibles y adaptables que fomenten la creatividad y la colaboración. 
Tecnología: Equipamiento tecnológico de última generación para el aprendizaje.
Sostenibilidad: Implementación de prácticas sostenibles para el cuidado del medio ambiente.
Conectividad: Acceso a internet y recursos digitales para el aprendizaje.');

select * from descripciones;

insert into categorias(categoria) values ('Diseño Industrial'), 
('Diseño de Modas'), 
('Diseño de Experiencia del Usuario'), 
('Diseño de Packaging'),
('Diseño de Arte'),
('Diseño Gráfico'),
('Diseño Publicitario'),
('Diseño Textil'),
('Diseño Editorial');

select * from categorias;

insert into proyectos(nombre, coste, descripcion_id, fecha_entrega, id_cliente, categoria_id) values 
('Diseño de un nuevo centro de salud', 500.20, 1, '2020-01-02', 3, 1),
('Creación de una campaña de marketing.', 1000.40, 2, '2023-01-01', 3, 7),
('Desarrollo de una estrategia de marketing responsable.', 5000, 3, '2022-05-06', 1, 2),
('EcoFlow', 2000.90, 5, '2024-03-22', 4, 1),
('MixBo', 4000.20, 7, '2024-11-21', 1, 1),
('KioDay', 2036.90, 5, '2025-10-30', 4, 3);

select * from proyectos;

insert into facturas(num, coste, descripcion_id, proyecto_id) values 
(938111, 30000.02, 1, 1),
(1102761, 24040.10, 2, 2),
(657382, 32400.99, 5, 6),
(8882124, 28790, 5, 4);

select * from facturas;

insert into tareas(tareas) values 
('dibujar, plantear, esquematizar'),
('estructurar, graficar, plantear'),
('disenar'),
('contratar empresas'),
('contabilizar y administrar'),
('organizacion de reuniones con administrativos');

select * from tareas;

insert into profesiones(profesion, tareas_id) values 
('disenador grafico', 3),
('dibujante', 1),
('arquitecto', 2),
('contratista', 4),
('secretariado', 6);

select * from profesiones;

insert into trabajadores(nombre, proyecto_id, profesion_id, sueldo) values 
('Miguel Santana', 2, 3, 2500),
('Gabriela Castillo', 4, 4, 1640.90),
('Kevin Manuel', 1, 1, 1568.321),
('Daniel Gonzales', 1, 2, 2463.99),
('Albert Mejia', 6, 1, 521.65),
('Minerva Gonzales', 5, 5, 1200.66),
('Carlos Abinader', 3, 2, 1866.11),
('Tamara Kil', 2, 1, 1756.00),
('Luis Miguel', 6, 3, 2000.89);

select * from trabajadores;

-- mostrar solo los primeros 15 registros
select * from proyectos limit 15;

-- unir 2 tablas
select trabajadores.nombre, profesiones.profesion from trabajadores inner join profesiones on trabajadores.profesion_id = profesiones.id;

-- unir 3 tablas
select proyectos.nombre, proyectos.fecha_entrega, facturas.num, descripciones.descripcion from proyectos inner join descripciones on proyectos.descripcion_id = descripciones.id inner join facturas on facturas.proyecto_id = proyectos.id;

-- listar registros basandose en una condicion
select * from proyectos where id_cliente = 3;

-- union profesiones U tareas
select * from profesiones full join tareas;

-- interseccion facturas ∩ proyectos
select * from facturas inner join proyectos on facturas.proyecto_id = proyectos.id where facturas.descripcion_id = proyectos.descripcion_id;

-- diferencia proyectos - facturas
select * from proyectos left join facturas on proyectos.id = facturas.proyecto_id where proyectos.descripcion_id != facturas.descripcion_id; 

-- diferencia simetrica proyectos Δ facturas
select * from proyectos left join facturas on facturas.proyecto_id = proyectos.id right join proyectos on facturas.proyecto_id = proyectos.id where proyectos.descripcion_id != facturas.descripcion_id 
