-- 1️⃣ Identify the most profitable crop (highest avg price per KG)
SELECT CropName, AVG(PricePerKG) AS AvgPrice
FROM Crops
GROUP BY CropName
ORDER BY AvgPrice DESC
LIMIT 1;

-- 2️⃣ Determine peak supply order periods (monthly trends)
SELECT MONTH(OrderDate) AS Month, COUNT(*) AS TotalOrders
FROM PurchaseOrders
GROUP BY MONTH(OrderDate)
ORDER BY TotalOrders DESC;

-- 3️⃣ Rank farmers by total revenue from crop sales
SELECT f.FarmerID, f.Name, SUM(cs.TotalPrice) AS TotalRevenue
FROM Farmers f
JOIN Crops c ON f.FarmerID = c.FarmerID
JOIN CropSales cs ON c.CropID = cs.CropID
GROUP BY f.FarmerID, f.Name
ORDER BY TotalRevenue DESC;

-- 4️⃣ Detect crops with declining sales over time
SELECT c.CropName, YEAR(cs.SaleDate) AS Year, SUM(cs.QuantityBought) AS TotalSold
FROM Crops c
JOIN CropSales cs ON c.CropID = cs.CropID
GROUP BY c.CropName, YEAR(cs.SaleDate)
ORDER BY c.CropName, Year;

-- 5️⃣ Highlight supplies with inconsistent stock availability
SELECT SupplyID, SupplyName, MIN(StockAvailable) AS MinStock, MAX(StockAvailable) AS MaxStock
FROM Supplies
GROUP BY SupplyID, SupplyName
HAVING MinStock = 0 AND MaxStock > 0;

-- 6️⃣ Show average price fluctuation of crops over time
SELECT CropName, MONTH(AvailableFrom) AS Month, AVG(PricePerKG) AS AvgMonthlyPrice
FROM Crops
GROUP BY CropName, MONTH(AvailableFrom)
ORDER BY CropName, Month;

-- 7️⃣ Compare average crop prices across regions (assuming Location is farmer's region)
SELECT f.Location, AVG(c.PricePerKG) AS AvgPrice
FROM Farmers f
JOIN Crops c ON f.FarmerID = c.FarmerID
GROUP BY f.Location;

-- 8️⃣ Find top 3 supplies most frequently ordered by farmers
SELECT s.SupplyName, COUNT(po.OrderID) AS OrderCount
FROM Supplies s
JOIN PurchaseOrders po ON s.SupplyID = po.SupplyID
GROUP BY s.SupplyName
ORDER BY OrderCount DESC
LIMIT 3;

-- 9️⃣ Identify buyers who made multiple crop purchases
SELECT BuyerName, COUNT(*) AS PurchaseCount, SUM(TotalPrice) AS TotalSpent
FROM CropSales
GROUP BY BuyerName
HAVING COUNT(*) > 1
ORDER BY TotalSpent DESC;

-- 🔟 Forecast next month’s crop demand based on last 3 months' average
SELECT c.CropName, AVG(cs.QuantityBought) AS AvgMonthlyDemand
FROM Crops c
JOIN CropSales cs ON c.CropID = cs.CropID
WHERE cs.SaleDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY c.CropName
ORDER BY AvgMonthlyDemand DESC;
