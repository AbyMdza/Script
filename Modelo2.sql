CREATE TABLE Escuela(
    EscuelaId INTEGER,		
    NombreDeLaEscuela VARCHAR(70),
    Direccion VARCHAR(400),
    PRIMARY KEY (Escuela)
);
CREATE TABLE Tutor(
    TutorId	INTEGER,
    NombreCompleto VARCHAR(50),	
    FirmoCartaCompromiso BOOLEAN,
    PRIMARY KEY (Tutor)
);
CREATE TABLE Suscripcion(
    SuscripcionId INTEGER,	
    Nombre VARCHAR(50),	
    Costo DECIMAL,
    Periodo VARCHAR,
    PRIMARY KEY (Suscripcion)
);
CREATE TABLE Estudiante(
    EstudianteId INTEGER,	
    Nombre VARCHAR(100),		
    APaterno VARCHAR(50),	
    AMaterno VARCHAR(50),	
    FechaRegistro DATE,
    Genero	CHAR(1),	
    SuscripcionId INTEGER,	
    FechaNacimiento	DATE,	
    Curp VARCHAR(50),	
    EscuelaId INTEGER,
    PRIMARY KEY (Estudiante)
    CONSTRAINT fk_EstudianteSuscripcion
    FOREIGN KEY (SuscripcionId) REFERENCES Suscripcion(SuscripcionId)
    CONSTRAINT fk_EstudianteEscuela
    FOREIGN KEY (EscuelaId) REFERENCES Escuela(EscuelaId)
);
CREATE TABLE EstudianteTutor(
    EstudianteTutorId INTEGER,
    EstudianteId INTEGER,
    TutorId INTEGER,
    PRIMARY KEY (EstudianteTutor)
    CONSTRAINT fk_EstudianteTutorEstudiante
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId)
    CONSTRAINT fk_EstudianteTutorTutor
    FOREIGN KEY (TutorId) REFERENCES Tutor(TutorId)
);
CREATE TABLE Pago(
    PagoId INTEGER,	
    FechaDeAplicacion DATE,
    SuscripcionId INTEGER,
    EstudianteId INTEGER,
	Cantidad DECIMAL,
    PRIMARY KEY (Pago)
    CONSTRAINT fk_PagoEstudiante
    FOREIGN KEY (EstudianteId) REFERENCES Estudiante(EstudianteId)
);
CREATE TABLE Grado(
    GradoId INTEGER,
    Nombre VARCHAR,
    ColorDeCinta VARCHAR(50),
    PRIMARY KEY (Grado)
);
CREATE TABLE EstudianteGrado(
    EstudianteGradoId INTEGER,
    EstudianteId INTEGER,
    GradoId INTEGER,
    FechaObtencion DATE,
    PRIMARY KEY (EstudianteGrado)
    ONSTRAINT fk_EstudianteGradoGrado
    FOREIGN KEY (GradoId) REFERENCES Grado(GradoId)
);
