const express = require('express');
const router = express.Router();
const userController = require('../controllers/userController'); 
const checkRole = require('../middleware/checkRole');

module.exports = (app) => {
    

    router.get('/', userController.getAllUsers);



   

    router.delete('/:userId', checkRole.checkAdminRole, userController.deleteUser);
  
    app.use('/api/users', router);
};

