
CREATE TABLE Customer (
    CustomerID            INT           NOT NULL,
    Name                  VARCHAR(100)  NOT NULL,
    Address               VARCHAR(150),
    Phone                 VARCHAR(15),
    Email                 VARCHAR(100),
    PrimeMembershipStatus CHAR(1)
    CHECK (PrimeMembershipStatus IN ('Y', 'N')),
    EmployeeID           INT,  

    CONSTRAINT Customer_PK PRIMARY KEY (CustomerID),
    CONSTRAINT Customer_FK_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE CustomerServiceAgents (
    EmployeeID        INT         NOT NULL,
    ServiceChannels   VARCHAR(50),
    Inquiries         CHAR(1)     CHECK (Inquiries IN ('Y', 'N')),
    Returns           CHAR(1)     CHECK (Returns IN ('Y', 'N')),
    IssueResolution   CHAR(1)     CHECK (IssueResolution IN ('Y', 'N')),

    CONSTRAINT CSA_PK PRIMARY KEY (EmployeeID),
    CONSTRAINT CSA_FK_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);



CREATE TABLE DeliveryDrivers (
    EmployeeID   INT   NOT NULL,

    CONSTRAINT DD_PK PRIMARY KEY (EmployeeID),
    CONSTRAINT DD_FK_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE WarehouseStaff (
    EmployeeID   INT           NOT NULL,
    Inventory    VARCHAR(100),

    CONSTRAINT WS_PK PRIMARY KEY (EmployeeID),
    CONSTRAINT WS_FK_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE ThirdPartySellers (
    SellerID                INT            NOT NULL,
    Name                    VARCHAR(100)   NOT NULL,
    Email                   VARCHAR(100),
    Phone                   VARCHAR(15),
    Address                 VARCHAR(150),
    RegistrationDate        DATE,
    CustomerRating          DECIMAL(2,1),
    AmazonFBAProgramStatus  CHAR(1) CHECK (AmazonFBAProgramStatus IN ('Y', 'N')),

    CONSTRAINT Seller_PK PRIMARY KEY (SellerID)
);



CREATE TABLE Orders (
    OrderID       INT           NOT NULL,
    CustomerID    INT           NOT NULL,
    OrderDate     DATE,
    ShipAddress   VARCHAR(150),
    TotalAmount   DECIMAL(10,2),
    PaymentMethod VARCHAR(50),  

    CONSTRAINT Orders_PK PRIMARY KEY (OrderID),
    CONSTRAINT Orders_FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE Payments (
    PaymentID             INT         NOT NULL,
    CreditCards           CHAR(1)     CHECK (CreditCards IN ('Y', 'N')),
    AmazonPay             CHAR(1)     CHECK (AmazonPay IN ('Y', 'N')),
    ThirdPartyProcessor   CHAR(1)     CHECK (ThirdPartyProcessor IN ('Y', 'N')),
    OrderID               INT         NOT NULL,

    CONSTRAINT Payments_PK PRIMARY KEY (PaymentID),
    CONSTRAINT Payments_FK_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


CREATE TABLE Products (
    ProductID     INT            NOT NULL,
    Name   VARCHAR(100)   NOT NULL,
    Category      VARCHAR(50),
    Price         DECIMAL(10,2),
    StockQuantity INT,

    CONSTRAINT Products_PK PRIMARY KEY (ProductID)
);


CREATE TABLE Employee (
    EmployeeID     INT            NOT NULL,
    Name           VARCHAR(100)   NOT NULL,
    Address        VARCHAR(150),
    Email          VARCHAR(100),
    Phone          VARCHAR(15),
    DateOfHire     DATE,
    EmployeeType   VARCHAR(50),     
    ManagerID      INT,             

    CONSTRAINT Employee_PK PRIMARY KEY (EmployeeID),
    CONSTRAINT Employee_FK_Manager FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);


CREATE TABLE Shipments (
    ShipmentID      INT            NOT NULL,
    Carrier         VARCHAR(100),
    ShipDate        DATE,
    TrackingNumber  VARCHAR(50),
    CustomerID      INT,

    CONSTRAINT Shipments_PK PRIMARY KEY (ShipmentID),
    CONSTRAINT Shipments_FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);


CREATE TABLE ThirdPartySellers_Products (
    SellerID         INT           NOT NULL,
    ProductID        INT           NOT NULL,
    SalesPerformance VARCHAR(50),

    CONSTRAINT SellerProduct_PK PRIMARY KEY (SellerID, ProductID),
    CONSTRAINT SellerProduct_FK_Seller FOREIGN KEY (SellerID) REFERENCES ThirdPartySellers(SellerID),
    CONSTRAINT SellerProduct_FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



CREATE TABLE Products_Orders (
    OrderID    INT           NOT NULL,
    ProductID  INT           NOT NULL,

    CONSTRAINT OrderProduct_PK PRIMARY KEY (OrderID, ProductID),
    CONSTRAINT OrderProduct_FK_Order FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT OrderProduct_FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Products_Shipments (
    ShipmentID   INT           NOT NULL,
    ProductID    INT           NOT NULL,

    CONSTRAINT ShipmentProduct_PK PRIMARY KEY (ShipmentID, ProductID),
    CONSTRAINT ShipmentProduct_FK_Shipment FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    CONSTRAINT ShipmentProduct_FK_Product FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


CREATE TABLE Shipments_WarehouseStaff (
    ShipmentID     INT           NOT NULL,
    W_EmployeeID   INT           NOT NULL,
    Inventory      VARCHAR(100),

    CONSTRAINT ShipmentWS_PK PRIMARY KEY (ShipmentID, W_EmployeeID),
    CONSTRAINT ShipmentWS_FK_Shipment FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
    CONSTRAINT ShipmentWS_FK_Employee FOREIGN KEY (W_EmployeeID) REFERENCES WarehouseStaff(EmployeeID)
);

CREATE TABLE EmployeeResponsibilities (
    EmployeeID     INT           NOT NULL,
    Responsibility VARCHAR(100) NOT NULL,

    CONSTRAINT EmpResp_PK PRIMARY KEY (EmployeeID, Responsibility),
    CONSTRAINT EmpResp_FK_Employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
