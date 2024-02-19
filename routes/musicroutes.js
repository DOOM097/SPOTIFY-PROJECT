  module.exports = (app) => {
  const express = require("express");
  const food = require("../controllers/musicController");
  const router = express.Router();
  const checkRole = require('../middleware/checkRole');




  router.post("/", checkRole.checkAdminRole, food.create);


  router.get("/", food.findAll);

  router.put('/:id', checkRole.checkAdminRole, food.update);

  router.delete("/:id",checkRole.checkAdminRole, food.delete);

  router.get("/search", food.searchByTitle);



    app.use("/api/music", router);
  };
