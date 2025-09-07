// controllers/cropsController.js
const db = require('../db/database');

exports.createCrop = (req, res) => {
  const { name, quantity, farmer_id } = req.body;
  const query = `INSERT INTO crops (name, quantity, farmer_id) VALUES (?, ?, ?)`;
  db.run(query, [name, quantity, farmer_id], function (err) {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ id: this.lastID, name, quantity, farmer_id });
  });
};

// Add updateCrop, getAllCrops, getCropById, deleteCrop similarly
