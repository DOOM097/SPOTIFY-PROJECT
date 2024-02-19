const Category = require("../models/playlists");
const FoodCategory = require("../models/foodcategory");
const Sequelize = require("sequelize");

exports.create = (req, res) => {
    if (!req.body.name) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }

    const category = {
        name: req.body.name,
    };

    Category.create(category)
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred."
            });
        });
};

exports.findAll = (req, res) => {

    Category.findAll()
        .then(data => {
            res.send(data);
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred."
            });
        });
};
exports.update = (req, res) => {
    const categoryId = req.params.id;

    if (!categoryId) {
        res.status(400).send({
            message: "Category ID is required."
        });
        return;
    }

    Category.findByPk(categoryId)
        .then(category => {
            if (!category) {
                res.status(404).send({
                    message: `Category with ID ${categoryId} not found.`
                });
            } else {
                category.name = req.body.name;

                category.save()
                    .then(() => {
                        res.send({
                            message: `Category with ID ${categoryId} has been updated successfully.`
                        });
                    })
                    .catch(err => {
                        res.status(500).send({
                            message: err.message || "Some error occurred while updating the category."
                        });
                    });
            }
        })
        .catch(err => {
            res.status(500).send({
                message: err.message || "Some error occurred."
            });
        });
};
exports.delete = async (req, res) => {
    const categoryId = req.params.id;

    if (!categoryId) {
        return res.status(400).json({
            message: "Category ID is required."
        });
    }

    try {
        const category = await Category.findByPk(categoryId);

        if (!category) {
            return res.status(404).json({
                message: `Category with ID ${categoryId} not found.`
            });
        }

        await FoodCategory.destroy({ where: { CategoryId: categoryId } });

        await category.destroy();

        return res.json({
            message: `Category with ID ${categoryId} and its associations have been deleted successfully.`
        });
    } catch (error) {
        console.error(error);
        return res.status(500).json({
            message: error.message || "Some error occurred while deleting the category and its associations."
        });
    }
};
exports.getFoodCountByCategory = (req, res) => {
    Category.findAll()
    .then(categories => {
        const categoriesWithFoodCount = [];
        const promises = categories.map(category => {
            return FoodCategory.count({
                where: {
                    CategoryId: category.id
                }
            })
            .then(foodCount => {
                categoriesWithFoodCount.push({
                    category: category,
                    foodCount: foodCount
                });
            });
        });

        Promise.all(promises)
            .then(() => {
                res.send(categoriesWithFoodCount);
            })
            .catch(err => {
                res.status(500).send({
                    message: err.message || "Some error occurred."
                });
            });
    })
    .catch(err => {
        res.status(500).send({
            message: err.message || "Some error occurred."
        });
    });
};
