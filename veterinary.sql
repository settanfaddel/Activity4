CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
animalid INT PRIMARY KEY,
name VARCHAR(50),
species VARCHAR(50),
breed VARCHAR(50),
dateofbirth DATE,
gender VARCHAR(50),
color VARCHAR(50),
ownerid INT,
FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors(
doctorid INT PRIMARY KEY,
dfirstname VARCHAR(50),
dlastname VARCHAR(50),
speciality VARCHAR(100),
phone VARCHAR(15),
email VARCHAR(100)
);

CREATE TABLE invoices(
invoiceid INT PRIMARY KEY,
appointid INT,
totalamount DECIMAL(10, 2),
paymentdate TIME
);

CREATE TABLE medicalrecords(
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATETIME,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);
INSERT INTO owners(
    ownerid, ofirstname, olastname, address, phone, email
)
VALUES
(1, 'Astra', 'Moonfield', 'Crystal Ridge, Northstar Valley', '09194561234', 'astra.moonfield@stargaze.com'),
(2, 'Rico', 'Driftwood', 'Shoreline Avenue, Coral Bay', '09287654321', 'ricodriftwood@seabreeze.net'),
(3, 'Elara', 'Solstice', 'Sunhaven District, Lumina City', '09375649821', 'elara.solstice@lumina.co'),
(4, 'Jaxon', 'Blackwell', 'Ironforge Street, Emberfall', '09451234987', 'jax.blackwell@forgeworks.io'),
(5, 'Talia', 'Evergreen', 'Whisperwind Road, Evergreen Forest', '09562347986', 'talia@evergreenforest.org'),
(6, 'Orion', 'Skylark', 'Cloudcrest Heights, Skyreach', '09178453629', 'orion.skylark@celesteair.com'),
(7, 'Mira', 'Lockhart', 'Silverwood Lane, Frostholm', '09286753145', 'mira.lockhart@silvermail.net'),
(8, 'Kael', 'Stormborn', 'Thunderpeak Ridge, Stormhold', '09399887722', 'kael.stormborn@thunderhub.gg'),
(9, 'Selene', 'Riversong', 'Moonwater Village, Azure Plains', '09467788990', 'selene.riversong@ripplemail.org'),
(10, 'Finn', 'Brightspark', 'Gadget Row, Clockwork District', '09574561278', 'finn.brightspark@mechtech.io');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Cleo', 'Cat', 'Ragdoll', '2020-08-12', 'Female', 'Blue Point', 3),
(2, 'Bolt', 'Dog', 'Husky', '2019-10-03', 'Male', 'Black & White', 5),
(3, 'Nori', 'Cat', 'Munchkin', '2021-06-22', 'Female', 'Brown Tabby', 2),
(4, 'Bruno', 'Dog', 'Beagle', '2018-04-18', 'Male', 'Tricolor', 7),
(5, 'Pumpkin', 'Cat', 'Maine Coon', '2022-02-10', 'Male', 'Orange Tabby', 1),
(6, 'Roxy', 'Dog', 'Golden Retriever', '2017-12-01', 'Female', 'Golden', 4),
(7, 'Kira', 'Dog', 'Pomeranian', '2023-03-05', 'Female', 'Cream', 10),
(8, 'Frost', 'Cat', 'Russian Blue', '2021-11-30', 'Male', 'Gray', 6),
(9, 'Mocha', 'Dog', 'Pug', '2016-07-14', 'Male', 'Fawn', 9),
(10, 'Star', 'Cat', 'Bengal', '2024-01-28', 'Female', 'Spotted Brown', 8);

INSERT INTO appointments(appointid, animalid, appointdate, reason)
VALUES
(1, 4, '2025-11-01', 'Lunar energy check-up'),
(2, 1, '2025-11-01', 'Crystal-infused grooming'),
(3, 8, '2025-11-02', 'Wing polishing and feather care'),
(4, 3, '2025-11-03', 'Forest pollen allergy treatment'),
(5, 6, '2025-11-03', 'Hydration therapy'),
(6, 2, '2025-11-04', 'Glow enhancement procedure'),
(7, 9, '2025-11-05', 'Routine healing aura scan'),
(8, 7, '2025-11-06', 'Mystic vaccination'),
(9, 5, '2025-11-06', 'Rune energy stabilization'),
(10, 10, '2025-11-07', 'Dream-state behavior evaluation');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com'),
(7, 'Dr.Rafael', 'Castillo', 'Avian Specialist', '222-333-4444', 'rafael@example.com'),
(8, 'Dr.Elena', 'Navarro', 'Orthopedic Specialist', '444-555-6666', 'elena@example.com'),
(9, 'Dr.Paolo', 'Mercado', 'Surgery Specialist', '777-888-9999', 'paolo@example.com'),
(10, 'Dr.Luz', 'Salazar', 'Internal Medicine', '666-777-8888', 'luz@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:35:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 150.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
(1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
(2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
(3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
(4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
(5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
(6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
(7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
(8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
(9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
(10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');  

ALTER TABLE owners
ADD REGISTEREDDATE DATE;