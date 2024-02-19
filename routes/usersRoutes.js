module.exports = (app) => {
    const express = require("express");
    const users = require("../controllers/userController.js");
    const router = express.Router();
    const checkRole = require('../middleware/checkRole.js');

    router.post("/", users.create);
    router.get("/", users.findAll);
    router.put("/:id", checkRole.checkAdminRole, users.update);
    router.delete("/:id", checkRole.checkAdminRole, users.delete);

    app.use("/api/users", router);
};
