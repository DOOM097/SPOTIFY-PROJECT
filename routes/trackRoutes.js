module.exports = (app) => {
    const express = require("express");
    const tracks = require("../controllers/trackController.js");
    const router = express.Router();
    const checkRole = require('../middleware/checkRole');

    router.post("/", tracks.create);
    router.get("/", tracks.findAll);
    router.put("/:id", checkRole.checkAdminRole, tracks.update);
    router.delete("/:id", checkRole.checkAdminRole, tracks.delete);

    app.use("/api/tracks", router);
};
