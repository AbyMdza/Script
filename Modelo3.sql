CREATE TABLE Category(
    CategoryId INTEGER,		
    Name VARCHAR(70),
    PRIMARY KEY (Category)
);
CREATE TABLE Test(
    TestId INTEGER,
    Name VARCHAR(50),	
    CategoryId INTEGER,
    PRIMARY KEY (Test)
    CONSTRAINT fk_TestCategory
    FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId)
);
CREATE TABLE Question(
    QuestionId INTEGER,	
    Text VARCHAR(600),	
    Active BOOLEAN,
    TestId INTEGER,
    PRIMARY KEY (Question)
    CONSTRAINT fk_QuestionTest
    FOREIGN KEY (TestId) REFERENCES Test(TestId)
);
CREATE TABLE Answer(
    AnswerId INTEGER,
    AnswerText VARCHAR(200),
    IsRight BOOLEAN,
    Active BOOLEAN,
    QuestionId INTEGER,
    PRIMARY KEY (Answer)
    CONSTRAINT fk_AnswerQuestion
    FOREIGN KEY (QuestionId) REFERENCES Question(QuestionId)
);
CREATE TABLE Student(
    StudentId INTEGER,
    Name INTEGER,
    PRIMARY KEY (Student)
);
CREATE TABLE TestStudent(
    TestStudentId INTEGER,
    TestId INTEGER,
    StudentId INTEGER,
    PRIMARY KEY (TestStudent)
    CONSTRAINT fk_TestStudentStudent
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
    CONSTRAINT fk_TestStudentTest
    FOREIGN KEY (TestId) REFERENCES Test(TestId)
);
CREATE TABLE AnswerTestStudent(
    AnswerTestStudentId INTEGER,
    AnswerId INTEGER,
    StudentResponse BOOLEAN,
    TestStudentId INTEGER,
    PRIMARY KEY (AnswerTestStudent)
    CONSTRAINT fk_AnswerTestStudentAnswer
    FOREIGN KEY (AnswerId) REFERENCES Answer(AnswerId)
    CONSTRAINT fk_AnswerTestStudentTestStudent
    FOREIGN KEY (TestStudentId) REFERENCES TestStudent(TestStudentId)
);
CREATE TABLE UserUC(
    UserUCId INTEGER,	
    Nickname VARCHAR(32),		
    Password VARCHAR(32),	
    LastAccess DATETIME,	
    CreatedDate DATETIME,
    Active BOOLEAN,
    PRIMARY KEY (UserUC)
);
CREATE TABLE UserucStudent(
    UserucStudentId INTEGER,	
    UserUCId INTEGER,
    StudentId INTEGER,
    PRIMARY KEY (UserucStudent)
    CONSTRAINT fk_UserucStudentUserUC
    FOREIGN KEY (UserUCId) REFERENCES UserUC(UserUCId)
    CONSTRAINT fk_UserucStudentStudent
    FOREIGN KEY (StudentId) REFERENCES Student(StudentId)
);
CREATE TABLE Supervisor(
    SupervisorId INTEGER,
    Name VARCHAR(50),
    Active BOOLEAN,
    PRIMARY KEY (Supervisor)
);
CREATE TABLE UserucSupervisor(
    UserucSupervisorId INTEGER,
    UserUCId INTEGER,
    SupervisorId VARCHAR(50),
    PRIMARY KEY (Grado)
    CONSTRAINT fk_UserucSupervisorUserUC
    FOREIGN KEY (UserUCId) REFERENCES UserUC(UserUCId)
    CONSTRAINT fk_UserucSupervisorSupervisor
    FOREIGN KEY (SupervisorId) REFERENCES Supervisor(SupervisorId)
);