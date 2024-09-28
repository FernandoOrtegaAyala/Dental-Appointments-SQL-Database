-- DB Verification
SHOW DATABASES;

-- DB creation
CREATE DATABASE dental_appointments;

-- Use of the current DB
USE dental_appointments;

-- Verification of tables in the DB
SHOW TABLES;

-- Creation of the roles table
CREATE TABLE roles(
	id_rol INT AUTO_INCREMENT PRIMARY KEY,
	rol ENUM ("Administrator", "Dentist", "Assistant", "Receptionist", "Patient"));

-- Insert test data into roles
INSERT INTO roles (rol)
	VALUES 
	("Administrator"),
	("Dentist"),
	("Assistant"),
	("Receptionist"),
	("Patient");

-- Verifying Test Data in Roles
SELECT *
FROM roles;

-- Creating the Permissions Table
CREATE TABLE permissions (
	id_permission INT AUTO_INCREMENT PRIMARY KEY,
	permission_name VARCHAR(45),
	permit_description VARCHAR(255)
);

-- Insert test data into permissions
INSERT INTO permissions (permission_name, permit_description)
	VALUES 
	("Administrator", "Manage users (create, edit, delete user accounts), 
	configure roles and permissions, access all the functionalities of the system."),
	("Dentist", "View and manage assigned appointments, access the medical history of the 
	Patients, register treatments and prescriptions for assigned Patients, access 
	specific tools to perform dental procedures."),
	("Assistant", "Manage appointment schedule (create, modify, cancel appointments), update 
	basic Patients information, send appointment reminders to Patients, access 
	to certain administrative functions under supervision."),
	("Receptionist", "Take calls and confirm appointments, register and manage the 
	information on Patients in the database, assist in the management of the agenda and 
	Dating."),
	("Patient", "View your medical and treatment history, schedule, view, and cancel your 
	own appointments, access and modify personal and basic profile information.");
	
-- Verifying Test Data in Permissions
SELECT *
FROM permissions;

-- Creating the roles_permissions Table
CREATE TABLE roles_permissions (
	id_rol_permission INT AUTO_INCREMENT PRIMARY KEY,
	id_rol INT,
	id_permission INT,
	FOREIGN KEY(id_rol) REFERENCES roles(id_rol),
	FOREIGN KEY(id_permission) REFERENCES permissions(id_permission)
);

-- Insert test data into roles_permissions
INSERT INTO roles_permissions (id_rol, id_permission)
	VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5);

-- Verification of test data in roles_permissions
SELECT *
FROM roles_permissions;

-- Creating the Users Table
CREATE TABLE users (
	id_user INT AUTO_INCREMENT PRIMARY KEY,
	user_name VARCHAR(30) UNIQUE NOT NULL,
	id_rol INT,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(45) NOT NULL,
	email VARCHAR(45) UNIQUE NOT NULL,
	password VARCHAR(45) NOT NULL,
	avatar VARCHAR(255),
	address VARCHAR(100) NOT NULL,
	zip_code VARCHAR(15) NOT NULL,
	home_phone VARCHAR(25) DEFAULT "No number",
	cellular_phone VARCHAR(25) DEFAULT "No number",
	birthdate  DATE,
	age INT NOT NULL,
	FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

-- Insert test data into users
INSERT INTO users (user_name, id_rol, first_name, last_name, email, password, avatar, 
	address, zip_code, home_phone, cellular_phone, birthdate , age)
	VALUES
	("admin_prueba", 1, "Juan", "Mir", "admin22@correo.com", "admin232411", "https://cdn-icons-png.flaticon.com/512/4140/4140077.png", 
	"address1212", "55410112", "55-14-14-25-41", "55-74-84-69-85", "1990-05-21", 33),
	("Dentist_prueba", 2, "Luis", "H", "Dentist@correo.com", "Dentist4512", "https://cdn-icons-png.flaticon.com/512/4140/4140071.png",
	"address2323", "12659845", "55-41-85-96-85", "55-74-85-96-25", "1985-09-08", 38),
	("Assistant_prueba", 3, "Federico", "V", "Assistant@correo.com", "Assistant9865", "https://cdn-icons-png.flaticon.com/512/4140/4140061.png",
	"address7485", "12457845", "55-41-58-96-85", "55-41-85-69-58", "1978-12-17", 44),
	("Receptionist_prueba", 4, "John", "C", "Receptionist@correo.com", "Receptionist8574", "https://cdn-icons-png.flaticon.com/512/4140/4140068.png",
	"address7414", "12568945", "55-95-25-74-47", "55-36-14-58-56", "1987-03-29", 35),
	("Patient_prueba", 5, "Regina", "G", "Patient@gmail.com", "Patient7474", "https://cdn-icons-png.flaticon.com/512/4140/4140052.png", 
	"Direcció1425", "32659845", "55-84-96-14-12", "55-14-96-25-15", "1995-11-02", 27);

-- Verifying test data in users
SELECT *
FROM users;

-- Creating the Dentists Table
CREATE TABLE Dentists (
	id_dentist INT AUTO_INCREMENT PRIMARY KEY,
	id_user INT,
	name VARCHAR(100) NOT NULL,
	professional_id VARCHAR(45) NOT NULL,
	specialty VARCHAR(45) NOT NULL,
	years_experience INT,
	certifications TEXT,
	FOREIGN KEY (id_user) REFERENCES users(id_user)
);

-- Creating More Users Dentists for the Dentists Table
INSERT INTO users (user_name, id_rol, first_name, last_name, email, password, avatar, 
	address, zip_code, home_phone, cellular_phone, birthdate , age)
	VALUES
	("Dentist_general", 2, "Eduardo", "H", "general@correo.com", "Dentist526385", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address4812", "021452", "55-65-84-20-41", "55-66-77-77-44", "1986-09-08", 37),
	("Dentist_ortodoncia", 2, "Marcos", "J", "ortodoncia@correo.com", "Dentist142512", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address1423", "418596", "55-14-58-76-65", "55-34-25-56-05", "1985-09-08", 38),
	("Dentist_periodoncia", 2, "Julian", "A", "periodoncia@correo.com", "Dentist560285", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address8956", "012584", "55-00-11-22-33", "55-44-55-66-77", "1984-09-08", 39),
	("Dentist_endodoncia", 2, "David", "D", "endodoncia@correo.com", "Dentist968574", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address2342", "987845", "55-41-86-67-56", "55-43-52-56-50", "1983-09-08", 40),
	("Dentist_cirugía", 2, "Luis", "S", "cirugia@correo.com", "Dentist258574", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address2415", "2489612", "55-44-47-36-52", "55-02-02-11-22", "1982-09-08", 41),
	("Dentist_odontopediatría", 2, "Victor", "M", "pediatria@correo.com", "Dentist986589", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address2574", "847589", "55-69-85-74-05", "55-14-25-36-74", "1981-09-08", 42),
	("Dentist_estética", 2, "Valeria", "R", "estetica@correo.com", "Dentist859674", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address3685", "748514", "55-96-58-47-45", "55-12-45-74-96", "1980-09-08", 43),
	("Dentist_implantología", 2, "Laura", "J", "implantologia@correo.com", "Dentist976431", "https://static.vecteezy.com/system/resources/previews/023/051/537/non_2x/line-icon-for-dental-vector.jpg",
	"address0022", "849562", "55-84-51-30-59", "55-48-15-02-03", "1979-09-08", 44);

-- Verifying test data in users
SELECT *
FROM users;

-- Insert Test Data in Dentists
INSERT INTO Dentists (id_user, name, professional_id, specialty, 
	years_experience, certifications)
	VALUES
	(6, "Eduardo Hernández Jiménez", 778899, "Odontología general", 14, "Miembro de la Asociación Dental Regional"),
	(7, "Marcos Javier Ortíz Soler", 123456, "Ortodoncia", 12, "Certificado en Invisalign"),
	(8, "Julian Aguilar Fuentes ", 987654, "Periodoncia", 8, "Miembro de la Sociage de Periodoncia"),
	(9, "David Domínguez Maya", 142536, "Endodoncia", 10, "Especialista en treatments de Conducto"),
	(10, "Luis Suárez Treviño", 475869, "Cirugía oral y maxilofacial", 15, "Diplomado en Cirugía Reconstructiva Facial"),
	(11, "Victor Martínez Rubio", 849562, "Odontopediatría", 7, "Certificado en Trato con Niños"),
	(12, "Valeria Rosales Soler", 849562, "Odontología estética", 9, "Especialista en Carillas Dentales"),
	(13, "Laura Robles Ayala", 794613, "Implantología dental", 11, "Certificación en Implantes Orales");

-- Verification of test data in Dentists
SELECT *
FROM Dentists;

-- Creating the appointments table
CREATE TABLE appointments (
	id_appointment INT AUTO_INCREMENT PRIMARY KEY,
	date DATETIME NOT NULL,
	payment_method ENUM ("Credit card", "Cash", "Bank transfer", "Paypal"),
	payment_status ENUM ("Pending payment", "Paid", "Refused"),
	notes VARCHAR(255) DEFAULT "No notes for appointment",
	duration VARCHAR(45) DEFAULT "No estimated time"
);

-- Insertar datos de prueba en appointments
INSERT INTO appointments (date, payment_method, payment_status, notes, duration)
	VALUES 
	("2024-07-18 08:23:45", "Credit card", "Pending payment", "No notes for appointment", "120 minutos"),
	("2025-02-03 17:42:19", "Cash", "Pending payment", "No notes for appointment", "90 minutos"),
	("2026-11-29 12:05:33", "Cash", "Paid", "Realizar evaluación del Patient", "No estimated time"),
	("2027-09-14 06:59:22", "Bank transfer", "Paid", "Patient con condición de salud", "60 minutos"),
	("2028-04-20 23:37:51", "Paypal", "Refused", "Realizar protocolos de sanitización adicionales", "30 minutos");

-- Verifying Test Data in Appointments
SELECT *
FROM appointments;

-- Creation of the treatment table
CREATE TABLE treatments (
	id_treatment INT AUTO_INCREMENT PRIMARY KEY,
	id_dentist INT,
	name_treatment VARCHAR(45),
	description_treatment VARCHAR(255),
	price VARCHAR(50),
	duration VARCHAR(45) DEFAULT "No estimated time",
	FOREIGN KEY (id_dentist) REFERENCES Dentists(id_dentist)
);

-- Insert test data into treatments
INSERT INTO treatments (id_dentist, name_treatment, description_treatment, price,
	duration)
	VALUES
	(1, "Limpieza dental", "Procedimiento para remover placa y sarro de los dientes", "200.00 por sesión",
	"Sesión 30 minutos"),
	(1, "Obturaciones empastes", "Restauración de dientes con caries utilizando materiales como resina o amalgama", "250.00 por diente",
	"30 minutos por diente"),
	(1, "Exámenes y diagnósticos regulares", "Revisiones dentales para evaluar la salud bucal", "$150.00 por sesión",
	"Sesión 30 minutos"), 
	(1, "treatments para dientes sensibles", "Aplicación de selladores o geles para reducir la sensibilidad dental", "300.00 por diente",
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
	(3, "Mantenimiento periodontal", "Cuidados continuos para controlar la enfermage periodontal", "300.00 por sesión",
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
	(6, "treatments de caries", "Restauraciones para dientes dañados por caries", "200.00 por diente",
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
	
-- Verification of test data in treatments
SELECT *
FROM treatments;

-- Creating the appointments_treatments Table
CREATE TABLE appointments_treatments (
	id_appointment_treatment INT AUTO_INCREMENT PRIMARY KEY,
	id_appointment INT,
	id_treatment INT,
	FOREIGN KEY (id_appointment) REFERENCES appointments(id_appointment),
	FOREIGN KEY (id_treatment) REFERENCES treatments(id_treatment)
);

-- Insert test data into appointments_treatments
INSERT INTO appointments_treatments (id_appointment, id_treatment)
	VALUES
	(1, 28),
	(1, 28),
	(2, 30),
	(2, 27),
	(3, 20),
	(4, 2),
	(4, 4),
	(5, 1);

-- Verification of test data in appointments_treatments
SELECT *
FROM appointments_treatments;

-- Querying an appointment by filtering the columns to review
SELECT c.id_appointment, c.date, c.duration, ct.id_appointment_treatment, t.name_treatment 
FROM appointments AS c
INNER JOIN appointments_treatments AS ct ON c.id_appointment = ct.id_appointment
INNER JOIN treatments AS t ON ct.id_treatment = t.id_treatment
WHERE c.id_appointment = 1;

-- Querying an appointment based on a date, filtering the columns you want to review
SELECT c.id_appointment, c.date, c.payment_status, c.notes, ct.id_appointment_treatment, t.description_treatment, t.price 
FROM appointments AS c
INNER JOIN appointments_treatments AS ct ON c.id_appointment = ct.id_appointment
INNER JOIN treatments AS t ON ct.id_treatment = t.id_treatment
WHERE c.date = "2028-04-20 23:37:51";

-- Consultation of a Dentist based on the treatments performed
SELECT d.name, d.specialty, d.certifications, t.name_treatment, t.description_treatment, t.price 
FROM Dentists AS d
INNER JOIN treatments AS t ON d.id_dentist = t.id_dentist
WHERE d.name = "Valeria Rosales Soler";
