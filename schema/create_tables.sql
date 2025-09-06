--1. Farmers Table 
CREATE TABLE Farmers (
  FarmerID INT PRIMARY KEY,
  Username VARCHAR(100),
  Password VARCHAR(25),
  Name VARCHAR(100),
  Gender VARCHAR(10),
  PhoneNumber VARCHAR(20),
  Location VARCHAR(100),
  Email TEXT,
  RegistrationDate DATE
);



-- 2. Crops Table 
CREATE TABLE Crops (
  CropID INT PRIMARY KEY,
  FarmerID INT,
  CropName VARCHAR(50),
  QuantityKG FLOAT,
  PricePerKG DECIMAL(10, 2),
  AvailableFrom DATE,
  FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID)
);

--3. Marketplace Table (Fertilizer/Equipment) 
CREATE TABLE Supplies (
  SupplyID INT PRIMARY KEY,
  SupplyType VARCHAR(50),
  -- e.g., Fertilizer, Tractor, Seeds
  SupplyName VARCHAR(100),
  Price DECIMAL(10, 2),
  StockAvailable INT
);

--4. Purchase Orders Table 
CREATE TABLE PurchaseOrders (
  OrderID INT PRIMARY KEY,
  FarmerID INT,
  SupplyID INT,
  Quantity INT,
  OrderDate DATE,
  FOREIGN KEY (FarmerID) REFERENCES Farmers(FarmerID),
  FOREIGN KEY (SupplyID) REFERENCES Supplies(SupplyID)
);

--5. Crop Sales Table 
CREATE TABLE CropSales (
  SaleID INT PRIMARY KEY,
  CropID INT,
  BuyerName VARCHAR(100),
  QuantityBought FLOAT,
  TotalPrice DECIMAL(10, 2),
  SaleDate DATE,
  FOREIGN KEY (CropID) REFERENCES Crops(CropID)
);

