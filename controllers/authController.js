const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')
const initializeDB = require('../db/database')

const registerUser = async (req, res) => {
  const { username, password, name, gender } = req.body
  const db = await initializeDB()
  const userExists = await db.get(`SELECT * FROM user WHERE username = ?`, [username])

  if (userExists) {
    return res.status(400).send('User already exists')
  }

  if (password.length < 6) {
    return res.status(400).send('Password is too short')
  }

  const hashedPassword = await bcrypt.hash(password, 10)
  await db.run(
    `INSERT INTO user (username, password, name, gender) VALUES (?, ?, ?, ?)`,
    [username, hashedPassword, name, gender]
  )

  res.status(200).send('User created successfully')
}

const loginUser = async (req, res) => {
  const { username, password } = req.body
  const db = await initializeDB()
  const user = await db.get(`SELECT * FROM user WHERE username = ?`, [username])

  if (!user) {
    return res.status(400).send('Invalid user')
  }

  const isValid = await bcrypt.compare(password, user.password)
  if (!isValid) {
    return res.status(400).send('Invalid password')
  }

  const token = jwt.sign({ username }, process.env.JWT_SECRET || 'default_secret')
  res.send({ jwtToken: token })
}

module.exports = { registerUser, loginUser }
