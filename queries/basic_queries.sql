-- 1️⃣ List all farmers
SELECT FarmerID, Name, PhoneNumber, Location
FROM Farmers;

-- 2️⃣ View all crops with details
SELECT CropID, CropName, QuantityKG, PricePerKG, AvailableFrom
FROM Crops;

-- 3️⃣ Show all supplies available in the marketplace
SELECT SupplyID, SupplyType, SupplyName, Price, StockAvailable
FROM Supplies;

-- 4️⃣ Retrieve all purchase orders
SELECT OrderID, FarmerID, SupplyID, Quantity, OrderDate
FROM PurchaseOrders;

-- 5️⃣ View all crop sales records
SELECT SaleID, CropID, BuyerName, QuantityBought, TotalPrice, SaleDate
FROM CropSales;

-- 6️⃣ Get all crops available from a specific farmer (e.g., FarmerID = 101)
SELECT CropName, QuantityKG, PricePerKG
FROM Crops
WHERE FarmerID = 101;

-- 7️⃣ List supplies that are out of stock
SELECT SupplyID, SupplyName
FROM Supplies
WHERE StockAvailable = 0;

-- 8️⃣ Sort farmers by name alphabetically
SELECT FarmerID, Name
FROM Farmers
ORDER BY Name;

-- 9️⃣ Find crops priced above ₹50 per KG
SELECT CropName, PricePerKG
FROM Crops
WHERE PricePerKG > 50;

-- 🔟 Count total number of crops listed
SELECT COUNT(*) AS TotalCrops
FROM Crops;
