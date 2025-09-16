const db = require('../db/database');

// Get all supplies
const getAllSupplies = (req, res) => {
  const query = 'SELECT * FROM supplies';
  db.all(query, [], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows);
  });
};

// Get supply by ID
const getSupplyById = (req, res) => {
  const { id } = req.params;
  const query = 'SELECT * FROM supplies WHERE id = ?';
  db.get(query, [id], (err, row) => {
    if (err) return res.status(500).json({ error: err.message });
    if (!row) return res.status(404).json({ error: 'Supply not found' });
    res.json(row);
  });
};

// Create new supply
const createSupply = (req, res) => {
  const { name, category, quantity, unit, farmer_id } = req.body;
  const query = `
    INSERT INTO supplies (name, category, quantity, unit, farmer_id)
    VALUES (?, ?, ?, ?, ?)
  `;
  db.run(query, [name, category, quantity, unit, farmer_id], function (err) {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ id: this.lastID });
  });
};

// Update supply
const updateSupply = (req, res) => {
  const { id } = req.params;
  const { name, category, quantity, unit } = req.body;
  const query = `
    UPDATE supplies
    SET name = ?, category = ?, quantity = ?, unit = ?
    WHERE id = ?
  `;
  db.run(query, [name, category, quantity, unit, id], function (err) {
    if (err) return res.status(500).json({ error: err.message });
    if (this.changes === 0) return res.status(404).json({ error: 'Supply not found' });
    res.json({ message: 'Supply updated successfully' });
  });
};

// Delete supply
const deleteSupply = (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM supplies WHERE id = ?';
  db.run(query, [id], function (err) {
    if (err) return res.status(500).json({ error: err.message });
    if (this.changes === 0) return res.status(404).json({ error: 'Supply not found' });
    res.json({ message: 'Supply deleted successfully' });
  });
};

module.exports = {
  getAllSupplies,
  getSupplyById,
  createSupply,
  updateSupply,
  deleteSupply
};

