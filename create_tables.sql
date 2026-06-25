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
