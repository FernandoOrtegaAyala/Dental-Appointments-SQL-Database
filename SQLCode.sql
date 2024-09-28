-- Verificación de las DB
SHOW DATABASES;

-- Creación de la DB
CREATE DATABASE citas_odonto;

-- Utilizacion de la DB actual
USE citas_odonto;

-- Verificacion de las tablas en la DB
SHOW TABLES;

-- Creación de la tabla roles
CREATE TABLE roles(
	id_rol INT AUTO_INCREMENT PRIMARY KEY,
	rol ENUM ("Administrador", "Dentista", "Asistente", "Recepcionista", "Paciente"));

-- Insertar datos de prueba en roles
INSERT INTO roles (rol)
	VALUES 
	("Administrador"),
	("Dentista"),
	("Asistente"),
	("Recepcionista"),
	("Paciente");

-- Verificación de los datos de prueba en roles
SELECT *
FROM roles;

-- Creación de la tabla permisos
CREATE TABLE permisos (
	id_permiso INT AUTO_INCREMENT PRIMARY KEY,
	nombre_permiso VARCHAR(45),
	descripción_permiso VARCHAR(255)
);

-- Insertar datos de prueba en permisos
INSERT INTO permisos (nombre_permiso, descripción_permiso)
	VALUES 
	("Administrador", "Gestionar usuarios (crear, editar, eliminar cuentas de usuario), 
	configurar roles y permisos, acceder a todas las funcionalidades del sistema."),
	("Dentista", "Ver y gestionar citas asignadas, acceder al historial médico de los 
	pacientes, registrar tratamientos y recetas para los pacientes asignados, acceder a 
	herramientas específicas para realizar procedimientos dentales."),
	("Asistente", "Gestionar agenda de citas (crear, modificar, cancelar citas), actualizar 
	información básica de pacientes, enviar recordatorios de citas a los pacientes, acceder 
	a ciertas funcionalidades administrativas bajo supervisión."),
	("Recepcionista", "Atender llamadas y confirmar citas, registrar y gestionar la 
	información de pacientes en la base de datos, ayudar en la gestión de la agenda y las 
	citas."),
	("Paciente", "Ver su historial médico y de tratamientos, programar, ver y cancelar sus 
	propias citas, acceder y modificar información personal y básica del perfil.");
	
-- Verificación de los datos de prueba en permisos
SELECT *
FROM permisos;

-- Creación de la tabla roles_permisos
CREATE TABLE roles_permisos (
	id_rol_permiso INT AUTO_INCREMENT PRIMARY KEY,
	id_rol INT,
	id_permiso INT,
	FOREIGN KEY(id_rol) REFERENCES roles(id_rol),
	FOREIGN KEY(id_permiso) REFERENCES permisos(id_permiso)
);

-- Insertar datos de prueba en roles_permisos
INSERT INTO roles_permisos (id_rol, id_permiso)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

-- Verificación de los datos de prueba en roles_permisos
SELECT *
FROM roles_permisos;

-- Creación de la tabla usuarios
CREATE TABLE usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_usuario VARCHAR(30) UNIQUE NOT NULL,
	id_rol INT,
	nombre VARCHAR(45) NOT NULL,
	apellidos VARCHAR(45) NOT NULL,
	email VARCHAR(45) UNIQUE NOT NULL,
	contraseña VARCHAR(45) NOT NULL,
	avatar VARCHAR(255),
	dirección VARCHAR(100) NOT NULL,
	código_postal VARCHAR(15) NOT NULL,
	teléfono_fijo VARCHAR(25) DEFAULT "Sin numero",
	teléfono_celular VARCHAR(25) DEFAULT "Sin numero",
	fecha_nacimiento DATE,
	edad INT NOT NULL,
	FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

-- Insertar datos de prueba en usuarios
INSERT INTO usuarios (nombre_usuario, id_rol, nombre, apellidos, email, contraseña, avatar, 
	dirección, código_postal, teléfono_fijo, teléfono_celular, fecha_nacimiento, edad)
	VALUES
	("admin_prueba", 1, "Juan", "Mir", "admin22@correo.com", "admin232411", "https://cdn-icons-png.flaticon.com/512/4140/4140077.png", 
	"Dirección1212", "55410112", "55-14-14-25-41", "55-74-84-69-85", "1990-05-21", 33),
	("dentista_prueba", 2, "Luis", "H", "dentista@correo.com", "dentista4512", "https://cdn-icons-png.flaticon.com/512/4140/4140071.png",
	"Dirección2323", "12659845", "55-41-85-96-85", "55-74-85-96-25", "1985-09-08", 38),
	("asistente_prueba", 3, "Federico", "V", "asistente@correo.com", "asistente9865", "https://cdn-icons-png.flaticon.com/512/4140/4140061.png",
	"Dirección7485", "12457845", "55-41-58-96-85", "55-41-85-69-58", "1978-12-17", 44),
	("recepcionista_prueba", 4, "John", "C", "recepcionista@correo.com", "recepcionista8574", "https://cdn-icons-png.flaticon.com/512/4140/4140068.png",
	"Dirección7414", "12568945", "55-95-25-74-47", "55-36-14-58-56", "1987-03-29", 35),
	("paciente_prueba", 5, "Regina", "G", "paciente@gmail.com", "paciente7474", "https://cdn-icons-png.flaticon.com/512/4140/4140052.png", 
	"Direcció1425", "32659845", "55-84-96-14-12", "55-14-96-25-15", "1995-11-02", 27);

-- Verificación de los datos de prueba en usuarios
SELECT *
FROM usuarios;

-- Creación de la tabla dentistas
CREATE TABLE dentistas (
	id_dentista INT AUTO_INCREMENT PRIMARY KEY,
	id_usuario INT,
	nombre VARCHAR(100) NOT NULL,
	cédula_profesional VARCHAR(45) NOT NULL,
	especialidad VARCHAR(45) NOT NULL,
	experiencia_años INT,
	certificaciones TEXT,
	FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Creación de más usuarios dentistas para la tabla dentistas
INSERT INTO usuarios (nombre_usuario, id_rol, nombre, apellidos, email, contraseña, avatar, 
	dirección, código_postal, teléfono_fijo, teléfono_celular, fecha_nacimiento, edad)
	VALUES
	("dentista_general", 2, "Eduardo", "H", "general@correo.com", "dentista526385", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección4812", "021452", "55-65-84-20-41", "55-66-77-77-44", "1986-09-08", 37),
	("dentista_ortodoncia", 2, "Marcos", "J", "ortodoncia@correo.com", "dentista142512", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección1423", "418596", "55-14-58-76-65", "55-34-25-56-05", "1985-09-08", 38),
	("dentista_periodoncia", 2, "Julian", "A", "periodoncia@correo.com", "dentista560285", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección8956", "012584", "55-00-11-22-33", "55-44-55-66-77", "1984-09-08", 39),
	("dentista_endodoncia", 2, "David", "D", "endodoncia@correo.com", "dentista968574", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección2342", "987845", "55-41-86-67-56", "55-43-52-56-50", "1983-09-08", 40),
	("dentista_cirugía", 2, "Luis", "S", "cirugia@correo.com", "dentista258574", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección2415", "2489612", "55-44-47-36-52", "55-02-02-11-22", "1982-09-08", 41),
	("dentista_odontopediatría", 2, "Victor", "M", "pediatria@correo.com", "dentista986589", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección2574", "847589", "55-69-85-74-05", "55-14-25-36-74", "1981-09-08", 42),
	("dentista_estética", 2, "Valeria", "R", "estetica@correo.com", "dentista859674", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección3685", "748514", "55-96-58-47-45", "55-12-45-74-96", "1980-09-08", 43),
	("dentista_implantología", 2, "Laura", "J", "implantologia@correo.com", "dentista976431", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"Dirección0022", "849562", "55-84-51-30-59", "55-48-15-02-03", "1979-09-08", 44);

-- Verificación de los datos de prueba en usuarios
SELECT *
FROM usuarios;

-- Insertar datos de prueba en dentistas
INSERT INTO dentistas (id_usuario, nombre, cédula_profesional, especialidad, 
	experiencia_años, certificaciones)
	VALUES
	(6, "Eduardo Hernández Jiménez", 778899, "Odontología general", 14, "Miembro de la Asociación Dental Regional"),
	(7, "Marcos Javier Ortíz Soler", 123456, "Ortodoncia", 12, "Certificado en Invisalign"),
	(8, "Julian Aguilar Fuentes ", 987654, "Periodoncia", 8, "Miembro de la Sociedad de Periodoncia"),
	(9, "David Domínguez Maya", 142536, "Endodoncia", 10, "Especialista en Tratamientos de Conducto"),
	(10, "Luis Suárez Treviño", 475869, "Cirugía oral y maxilofacial", 15, "Diplomado en Cirugía Reconstructiva Facial"),
	(11, "Victor Martínez Rubio", 849562, "Odontopediatría", 7, "Certificado en Trato con Niños"),
	(12, "Valeria Rosales Soler", 849562, "Odontología estética", 9, "Especialista en Carillas Dentales"),
	(13, "Laura Robles Ayala", 794613, "Implantología dental", 11, "Certificación en Implantes Orales");

-- Verificación de los datos de prueba en dentistas
SELECT *
FROM dentistas;

-- Creación de la tabla citas
CREATE TABLE citas (
	id_cita INT AUTO_INCREMENT PRIMARY KEY,
	fecha_hora DATETIME NOT NULL,
	método_pago ENUM ("Tarjeta de crédito", "Efectivo", "Transferencia bancaria", "Paypal"),
	estado_pago ENUM ("Pendiente", "Pagado", "Rechazado"),
	notas VARCHAR(255) DEFAULT "Sin notas para la cita",
	duración VARCHAR(45) DEFAULT "Sin tiempo estimado"
);

-- Insertar datos de prueba en citas
INSERT INTO citas (fecha_hora, método_pago, estado_pago, notas, duración)
	VALUES 
	("2024-07-18 08:23:45", "Tarjeta de crédito", "Pendiente", "Sin notas para la cita", "120 minutos"),
	("2025-02-03 17:42:19", "Efectivo", "Pendiente", "Sin notas para la cita", "90 minutos"),
	("2026-11-29 12:05:33", "Efectivo", "Pagado", "Realizar evaluación del paciente", "Sin tiempo estimado"),
	("2027-09-14 06:59:22", "Transferencia bancaria", "Pagado", "Paciente con condición de salud", "60 minutos"),
	("2028-04-20 23:37:51", "Paypal", "Rechazado", "Realizar protocolos de sanitización adicionales", "30 minutos");

-- Verificación de los datos de prueba en citas
SELECT *
FROM citas;

-- Creación de la tabla tratamientos
CREATE TABLE tratamientos (
	id_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
	id_dentista INT,
	nombre_tratamiento VARCHAR(45),
	descripción_tratamiento VARCHAR(255),
	precio VARCHAR(50),
	duración VARCHAR(45) DEFAULT "Sin tiempo estimado",
	FOREIGN KEY (id_dentista) REFERENCES dentistas(id_dentista)
);

-- Insertar datos de prueba en tratamientos
INSERT INTO tratamientos (id_dentista, nombre_tratamiento, descripción_tratamiento, precio,
	duración)
	VALUES
	(1, "Limpieza dental", "Procedimiento para remover placa y sarro de los dientes", "200.00 por sesión",
	"Sesión 30 minutos"),
	(1, "Obturaciones empastes", "Restauración de dientes con caries utilizando materiales como resina o amalgama", "250.00 por diente",
	"30 minutos por diente"),
	(1, "Exámenes y diagnósticos regulares", "Revisiones dentales para evaluar la salud bucal", "$150.00 por sesión",
	"Sesión 30 minutos"), 
	(1, "Tratamientos para dientes sensibles", "Aplicación de selladores o geles para reducir la sensibilidad dental", "300.00 por diente",
	"30 minutos por diente"),
	(2, "Brackets metálicos", "Colocación de dispositivos de metal para alinear los dientes", "6000.00 por tratamiento",
	"Tratamiento de 18 a 36 meses"),
	(2, "Brackets cerámicos", "Similares a los metálicos, pero del color del diente para ser menos visibles", "8000.00 por tratamiento",
	"Tratamiento de 18 a 36 meses"),
	(2, "Alineadores transparentes", "Bandejas de plástico removibles para alinear los dientes sin brackets", "3000.00 por tratamiento",
	"Tratamiento de 12 a 24 meses"),
	(2, "Aparatos linguales", "Brackets colocados en la parte posterior de los dientes para una apariencia más estética", "8000.00 por tratamiento",
	"Tratamiento de 18 a 36 meses"),
	(2, "Retenedores", "Dispositivos para mantener la alineación dental después del tratamiento", "800.00 por tratamiento", 
	"Sesión 30 minutos"),
	(3, "Limpieza profunda", "Eliminación de placa debajo de las encías", "400.00 por sesión",
	"Sesión 60 minutos"),
	(3, "Cirugía de injerto de encía", "Trasplante de tejido para tratar recesiones de las encías", "600.00 por área", 
	"30 minutos por área"),
	(3, "Tratamiento de bolsas periodontales", "Eliminación de bacterias en bolsas alrededor de los dientes", "500.00 por área",
	"30 minutos por área"),
	(3, "Mantenimiento periodontal", "Cuidados continuos para controlar la enfermedad periodontal", "300.00 por sesión",
	"Sesión 30 minutos"),
	(4, "Tratamiento de conducto", "Eliminación de nervios infectados y sellado del conducto radicular", "$800.00 por diente",
	"45 minutos por diente"),
	(4, "Retratamiento de conducto", "Tratamiento adicional al tratamiento", "1000.00 por diente",
	"30 minutos por diente"),
	(4, "Apicectomía", "Eliminación de la punta de la raíz del diente", "500.00 por diente", 
	"30 minutos por diente"),
	(5, "Extracciones dentales", "Remoción de dientes dañados o impactados", "75.00 por diente",
	"20 minutos por diente"),
	(5, "Cirugía de mandíbula y maxilar", "Corrección de problemas estructurales", "10000.00 por sesión",
	"Variabilidad significativa"),
	(5, "Cirugía reconstructiva facial", "Restauración de estructuras faciales", "15000.00",
	"Variabilidad significativa"),
	(5, "Implantes dentales", "Colocación de estructuras para reemplazar dientes perdidos", "6000.00 por implante",
	"Variabilidad significativa"),
	(6, "Selladores dentales", "Recubrimientos protectores para prevenir la caries en niños", "100.00 por diente",
	"15 minutos por diente"),
	(6, "Tratamientos de caries", "Restauraciones para dientes dañados por caries", "200.00 por diente",
	"30 minutos por diente"),
	(6, "Mantenedores de espacio", "Dispositivos para mantener el espacio de los dientes perdidos en niños", "200.00 por aparato",
	"Sesión 60 minutos"),
	(6, "Revisiones regulares", "Exámenes dentales preventivos para niños", "150.00 por sesión",
	"Sesión 30 minutos"),
	(7, "Blanqueamiento dental", "Procedimiento para aclarar el color de los dientes", "300.00",
	"Sesión 60 minutos"),
	(7, "Carillas de porcelana", "Cubiertas delgadas para mejorar la apariencia de los dientes", "800.00 por carilla",
	"60 minutos por carilla"),
	(7, "Restauraciones estéticas", "Reparación de dientes dañados con materiales estéticos", "100.00 por diente",
	"30 minutos por diente"),
	(7, "Contorneado de encías", "Redefinición estética de las encías", "500.00 por tratamiento",
	"Sesión 60 minutos"),
	(8, "Implantes dentales", "Reemplazo de dientes perdidos con estructuras de titanio", "2500.00 por implante",
	"45 minutos por implante"),
	(8, "Injertos óseos", "Aumento de hueso para mejorar la estructura para implantes", "600.00 por área",
	"60 minutos por área"),
	(8, "Elevación de seno maxilar", "Aumento de la altura del hueso maxilar para implantes", "5000.0 por tratamiento",
	"Tratamiento 120 minutos"),
	(8, "Cirugía de implante", "Preparación del sitio para colocar implantes dentales", "1000.00 por diente",
	"30 minutos por diente");
	
-- Verificación de los datos de prueba en tratamientos
SELECT *
FROM tratamientos;

-- Creación de la tabla citas_tratamientos
CREATE TABLE citas_tratamientos (
	id_cita_tratamiento INT AUTO_INCREMENT PRIMARY KEY,
	id_cita INT,
	id_tratamiento INT,
	FOREIGN KEY (id_cita) REFERENCES citas(id_cita),
	FOREIGN KEY (id_tratamiento) REFERENCES tratamientos(id_tratamiento)
);

-- Insertar datos de prueba en citas_tratamientos
INSERT INTO citas_tratamientos (id_cita, id_tratamiento)
	VALUES
	(1, 28),
	(1, 28),
	(2, 30),
	(2, 27),
	(3, 20),
	(4, 2),
	(4, 4),
	(5, 1);

-- Verificación de los datos de prueba en citas_tratamientos
SELECT *
FROM citas_tratamientos;

-- Consulta de una cita filtrando las columnas que se desean revisar
SELECT c.id_cita, c.fecha_hora, c.duración, ct.id_cita_tratamiento, t.nombre_tratamiento 
FROM citas AS c
INNER JOIN citas_tratamientos AS ct ON c.id_cita = ct.id_cita
INNER JOIN tratamientos AS t ON ct.id_tratamiento = t.id_tratamiento
WHERE c.id_cita = 1;

-- Consulta de una cita en base a una fecha, filtrando las columnas que se desean revisar
SELECT c.id_cita, c.fecha_hora, c.estado_pago, c.notas, ct.id_cita_tratamiento, t.descripción_tratamiento, t.precio 
FROM citas AS c
INNER JOIN citas_tratamientos AS ct ON c.id_cita = ct.id_cita
INNER JOIN tratamientos AS t ON ct.id_tratamiento = t.id_tratamiento
WHERE c.fecha_hora = "2028-04-20 23:37:51";

-- Consulta de un dentista en base a los tratamientos que realiza
SELECT d.nombre, d.especialidad, d.certificaciones, t.nombre_tratamiento, t.descripción_tratamiento, t.precio 
FROM dentistas AS d
INNER JOIN tratamientos AS t ON d.id_dentista = t.id_dentista
WHERE d.nombre = "Valeria Rosales Soler";
