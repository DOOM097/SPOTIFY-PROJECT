const express = require('express');
const commentController = require('../controllers/commentController');
const router = express.Router();
const authMiddleware = require('../middleware/checkRole');

/**
 * @swagger
 * tags:
 *   name: Comments
 *   description: Операции с комментариями
 */

router.post('/', authMiddleware.checkAuthentication, commentController.create);

module.exports = (app) => {
  app.use('/api/comments', router);
};
