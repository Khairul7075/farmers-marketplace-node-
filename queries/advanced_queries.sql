-- 1️⃣ List all farmers along with the number of crops they are selling
SELECT f.FarmerID, f.Name, COUNT(c.CropID) AS TotalCrops
FROM Farmers f
LEFT JOIN Crops c ON f.FarmerID = c.FarmerID
GROUP BY f.FarmerID, f.Name;

-- 2️⃣ Find the top 5 highest earning crop sales
SELECT CropID, BuyerName, TotalPrice, SaleDate
FROM CropSales
ORDER BY TotalPrice DESC
LIMIT 5;

-- 3️⃣ Show all crops and their total quantity sold
SELECT c.CropName, SUM(cs.QuantityBought) AS TotalSold
FROM Crops c
JOIN CropSales cs ON c.CropID = cs.CropID
GROUP BY c.CropName;

-- 4️⃣ List supplies with total quantity ordered by farmers
SELECT s.SupplyName, SUM(po.Quantity) AS TotalOrdered
FROM Supplies s
JOIN PurchaseOrders po ON s.SupplyID = po.SupplyID
GROUP BY s.SupplyName;

-- 5️⃣ Retrieve farmers who haven’t listed any crops
SELECT f.FarmerID, f.Name
FROM Farmers f
LEFT JOIN Crops c ON f.FarmerID = c.FarmerID
WHERE c.CropID IS NULL;

-- 6️⃣ View all crop sales made in the last 30 days
SELECT * 
FROM CropSales
WHERE SaleDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

-- 7️⃣ Get the average price per KG of crops per farmer
SELECT f.Name, AVG(c.PricePerKG) AS AvgPrice
FROM Farmers f
JOIN Crops c ON f.FarmerID = c.FarmerID
GROUP BY f.Name;

-- 8️⃣ Find farmers who have made at least one purchase order and sold crops
SELECT DISTINCT f.FarmerID, f.Name
FROM Farmers f
JOIN PurchaseOrders po ON f.FarmerID = po.FarmerID
JOIN Crops c ON f.FarmerID = c.FarmerID
JOIN CropSales cs ON c.CropID = cs.CropID;

-- 9️⃣ Identify the most popular crop by sales quantity
SELECT c.CropName, SUM(cs.QuantityBought) AS TotalSold
FROM Crops c
JOIN CropSales cs ON c.CropID = cs.CropID
GROUP BY c.CropName
ORDER BY TotalSold DESC
LIMIT 1;

-- 🔟 List supplies ordered more than 100 units in total
SELECT s.SupplyName, SUM(po.Quantity) AS TotalOrdered
FROM Supplies s
JOIN PurchaseOrders po ON s.SupplyID = po.SupplyID
GROUP BY s.SupplyName
HAVING SUM(po.Quantity) > 100;

-- List all available crops by location: 
SELECT
  f.Name,
  f.Location,
  c.CropName,
  c.QuantityKG,
  c.PricePerKG
FROM
  Farmers f
  JOIN Crops c ON f.FarmerID = c.FarmerID
WHERE
  c.QuantityKG > 0; 


---Get total revenue earned by a farmer from crop sales: 
SELECT
  f.Name,
  SUM(cs.TotalPrice) AS Revenue
FROM
  Farmers f
  JOIN Crops c ON f.FarmerID = c.FarmerID
  JOIN CropSales cs ON c.CropID = cs.CropID
GROUP BY
  f.Name;
