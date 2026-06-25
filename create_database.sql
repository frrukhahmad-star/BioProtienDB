use BioProtienDB;

CREATE TABLE Organism (
    Organism_ID INT AUTO_INCREMENT PRIMARY KEY,
    Scientific_Name VARCHAR(100) NOT NULL,
    Common_Name VARCHAR(100),
    Kingdom VARCHAR(50)
);

CREATE TABLE Gene (
    Gene_ID INT AUTO_INCREMENT PRIMARY KEY,
    Gene_Name VARCHAR(50) NOT NULL,
    Chromosome VARCHAR(20),
    Organism_ID INT,
    FOREIGN KEY (Organism_ID)
        REFERENCES Organism(Organism_ID)
);

CREATE TABLE Protein (
    Protein_ID INT AUTO_INCREMENT PRIMARY KEY,
    Protein_Name VARCHAR(100) NOT NULL,
    Protein_Length INT,
    Gene_ID INT,
    FOREIGN KEY (Gene_ID)
        REFERENCES Gene(Gene_ID)
);


CREATE TABLE Function_Table (
    Function_ID INT AUTO_INCREMENT PRIMARY KEY,
    Function_Name VARCHAR(100) NOT NULL,
    Description TEXT
);

CREATE TABLE Disease (
    Disease_ID INT AUTO_INCREMENT PRIMARY KEY,
    Disease_Name VARCHAR(100) NOT NULL,
    Disease_Type VARCHAR(100)
);

CREATE TABLE Protein_Function (
    Protein_ID INT,
    Function_ID INT,
    PRIMARY KEY (Protein_ID, Function_ID),
    FOREIGN KEY (Protein_ID)
        REFERENCES Protein(Protein_ID),
    FOREIGN KEY (Function_ID)
        REFERENCES Function_Table(Function_ID)
);

CREATE TABLE Protein_Disease (
    Protein_ID INT,
    Disease_ID INT,
    PRIMARY KEY (Protein_ID, Disease_ID),
    FOREIGN KEY (Protein_ID)
        REFERENCES Protein(Protein_ID),
    FOREIGN KEY (Disease_ID)
        REFERENCES Disease(Disease_ID)
);


INSERT INTO Organism (Scientific_Name, Common_Name, Kingdom)
VALUES
('Homo sapiens', 'Human', 'Animalia'),
('Mus musculus', 'Mouse', 'Animalia'),
('Escherichia coli', 'E. coli', 'Bacteria');


INSERT INTO Gene (Gene_Name, Chromosome, Organism_ID)
VALUES
('TP53', '17', 1),
('BRCA1', '17', 1),
('INS', '11', 1),
('HBB', '11', 1),
('CFTR', '7', 1);

INSERT INTO Protein (Protein_Name, Protein_Length, Gene_ID)
VALUES
('Cellular Tumor Antigen p53', 393, 1),
('Breast Cancer Type 1 Susceptibility Protein', 1863, 2),
('Insulin', 110, 3),
('Hemoglobin Beta', 147, 4),
('CFTR Protein', 1480, 5);

INSERT INTO Function_Table (Function_Name, Description)
VALUES
('DNA Repair', 'Repairs damaged DNA'),
('Tumor Suppression', 'Prevents uncontrolled cell growth'),
('Blood Glucose Regulation', 'Controls blood sugar levels'),
('Oxygen Transport', 'Carries oxygen in red blood cells'),
('Ion Transport', 'Moves chloride ions across cell membranes');


INSERT INTO Disease (Disease_Name, Disease_Type)
VALUES
('Cancer', 'Genetic Disease'),
('Breast Cancer', 'Cancer'),
('Diabetes Mellitus', 'Metabolic Disease'),
('Sickle Cell Disease', 'Blood Disorder'),
('Cystic Fibrosis', 'Genetic Disease');

INSERT INTO Protein_Function (Protein_ID, Function_ID)
VALUES
(1,1),
(1,2),
(2,1),
(3,3),
(4,4),
(5,5);

INSERT INTO Protein_Disease (Protein_ID, Disease_ID)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);

SELECT * FROM Organism;
SELECT * FROM Gene;
SELECT * FROM Protein;
SELECT * FROM Function_Table;
SELECT * FROM Disease;
SELECT * FROM Protein_Function;
SELECT * FROM Protein_Disease;