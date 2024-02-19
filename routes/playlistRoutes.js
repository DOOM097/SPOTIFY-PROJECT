module.exports = (app) => {
    const express = require("express");
    const playlists = require("../controllers/playlistController.js");
    const router = express.Router();
    const checkRole = require('../middleware/checkRole');

    router.post("/", playlists.create);
    router.get("/", playlists.findAll);
    router.put("/:id", checkRole.checkAdminRole, playlists.update);
    router.delete("/:id", checkRole.checkAdminRole, playlists.delete);

    app.use("/api/playlists", router);
};
