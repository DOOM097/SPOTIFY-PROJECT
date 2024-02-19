const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController'); 

module.exports = (app) => {
  /**
   * @swagger
   * tags:
   *   name: Authentication
   *   description: User authentication endpoints
   */

  /**
   * @swagger
   * /api/auth/register:
   *   post:
   *     summary: Register a new user
   *     tags: [Authentication]
   *     requestBody:
   *       required: true
   *       content:
   *         application/json:
   *           schema:
   *             type: object
   *             properties:
   *               username:
   *                 type: string
   *               email:
   *                 type: string
   *               password:
   *                 type: string
   *     responses:
   *       '201':
   *         description: User registered successfully
   *       '400':
   *         description: Bad request. Missing or invalid data.
   *       '500':
   *         description: Internal server error
   */

  router.post('/register', authController.register);

  /**
   * @swagger
   * /api/auth/signin:
   *   post:
   *     summary: Sign in (authenticate) a user
   *     tags: [Authentication]
   *     requestBody:
   *       required: true
   *       content:
   *         application/json:
   *           schema:
   *             type: object
   *             properties:
   *               email:
   *                 type: string
   *               password:
   *                 type: string
   *     responses:
   *       '200':
   *         description: User authenticated successfully
   *       '401':
   *         description: Unauthorized. Invalid credentials.
   *       '500':
   *         description: Internal server error
   */

  router.post('/signin', authController.signin);

  app.use('/api/auth', router);
};
