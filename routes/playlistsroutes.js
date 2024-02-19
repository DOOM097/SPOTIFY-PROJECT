
module.exports = (app) => {
    const express = require("express");
    const categories = require("../controllers/playlistsController.js");
    const router = express.Router();
    const checkRole = require('../middleware/checkRole.js');

   
    router.post("/",checkRole.checkAdminRole, categories.create);

    router.get("/", categories.findAll);

    router.put("/:id", checkRole.checkAdminRole, categories.update);

    router.delete("/:id", checkRole.checkAdminRole, categories.delete); 

    app.use("/api/playlists", router);
};
