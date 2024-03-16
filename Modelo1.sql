CREATE TABLE UserUC(
    UserUCId INTEGER,
    CreatedDate Data time,
    UpdatedBy INTEGER,
    Username VARCHAR(100),
    Password VARCHAR(100),
    LastAccess Data time,
    Active BOOLEAN,
    CreatedBy INTEGER,
    UpdatedBy data time,
    PRIMARY KEY (UserUCId)
);
CREATE TABLE Client(
    ClientId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy Data time,
    Name VARCHAR(50),
    LastName VARCHAR(50),
    Cell VARCHAR(10),
    Email VARCHAR(50),
    Observations(300),
    Active BOOLEAN,
    CreatedDate Data time,
    UpdatedDate Data time,
    PRIMARY KEY (ClientId)
);
CREATE TABLE Raffle(
    Raffleld INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Description VARCHAR(300),
    StartDate data time,
    RaffleDate data time,
    Active BOOLEAN,
    CreatedDate Data time,
    UpdatedDate Data time,
    PRIMARY KEY (Raffleld)
);
CREATE TABLE Ticket(
    TicketId INTEGER,
    Raffleld INTEGER,
    ClientId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BOOLEAN,
    CreatedDate Data time,
    UpdatedDate Data time,
    PRIMARY KEY (TicketId)
    CONSTRAINT fk_TicketRaffle
    FOREIGN KEY (Raffleld) REFERENCES Raffle(Raffleld)
    CONSTRAINT fk_TicketClient
    FOREIGN KEY (ClientId) REFERENCES Client(ClientId)
);
CREATE TABLE Prize(
    PrizeId INTEGER,
    RaffleId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Product VARCHAR(100),
    Active BOOLEAN,
    CreatedDate Data time,
    UpdatedDate Data time,
    PRIMARY KEY (PrizeId)
    CONSTRAINT fk_PrizeRaffle
    FOREIGN KEY (RaffleId) REFERENCES Raffle(RaffleId)
);
CREATE TABLE Winner(
    WinnerId INTEGER,
    TicketId INTEGER,
    PrizeId INTEGER,
    CreatedBy INTEGER,
    UpdatedBy INTEGER,
    Active BOOLEAN,
    CreatedDate Data time,
    UpdatedDate Data time,
    PRIMARY KEY (WinnerId)
    CONSTRAINT fk_WinnerTicket
    FOREIGN KEY (TicketId) REFERENCES Ticket(TicketId)
    CONSTRAINT fk_WinnerPrize
    FOREIGN KEY (PrizeId) REFERENCES Prize(PrizeId)
);