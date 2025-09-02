// 
const path = require('path')
const { open } = require('sqlite')
const sqlite3 = require('sqlite3')

const dbPath = path.join(__dirname, '../farmersMarketplace.db')

const initializeDB = async () => {
  return open({
    filename: dbPath,
    driver: sqlite3.Database,
  })
}

module.exports = initializeDB
