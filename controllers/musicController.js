const Food = require("../models/music");
const { Sequelize } = require('sequelize');
const FoodProduct = require("../models/recipe");
const Product = require("../models/products");
const Category = require("../models/playlists");
const FoodCategory = require("../models/foodcategory");
const Comment = require('../models/comments');


exports.create = async (req, res) => {
    
    if (!req.body.title) {
        res.status(400).send({
            message: "Title and ISBN are required fields!"
        });
        return;
    }
    

    const foodData = {
        title: req.body.title,
        publishedDate: req.body.publishedDate,
        musicURL: req.body.thumbnailUrl,
        shortDescription: req.body.shortDescription,
    };

    try {
        const createdFood = await Food.create(foodData);

        if (req.body.products && req.body.products.length > 0) {
            for (const productInfo of req.body.products) {
                const productName = productInfo.name;
                const productQuantity = productInfo.quantity || 1; 
                const productUnit = productInfo.unit; 

                const [product, created] = await Product.findOrCreate({
                    where: { name: productName }
                });

                await FoodProduct.create({
                    FoodId: createdFood.id,
                    ProductId: product.id,
                    quantity: productQuantity,
                    unit: productUnit
                });
            }
        }

        if (req.body.categories && req.body.categories.length > 0) {
            for (const categoryName of req.body.categories) {
                const [category, created] = await Category.findOrCreate({
                    where: { name: categoryName }
                });

                await FoodCategory.create({
                    FoodId: createdFood.id,
                    CategoryId: category.id
                });
            }
        }

        res.send(createdFood);
    } catch (err) {
        console.error(err);
        res.status(500).send({
            message: err.message || "Some error occurred."
        });
    }
};
exports.findAll = async (req, res) => {
    try {
        const foods = await Food.findAll();
        const foodsWithAllData = [];

        for (const food of foods) {
            const foodCategoryData = await FoodCategory.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const categoryIds = foodCategoryData.map(item => item.CategoryId);

            const categories = await Category.findAll({
                where: {
                    id: categoryIds
                }
            });
            const categoryNames = categories.map(category => category.name);

            const foodProductData = await FoodProduct.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const productIds = foodProductData.map(item => item.ProductId);

            const products = await Product.findAll({
                where: {
                    id: productIds
                }
            });
            const productInfo = products.map(product => ({
                name: product.name,
                quantity: foodProductData.find(item => item.ProductId === product.id).quantity,
                unit: foodProductData.find(item => item.ProductId === product.id).unit
            }));

            foodsWithAllData.push({
                _id: food.id,
                title: food.title,
                publishedDate: food.publishedDate,
                musicURL: food.thumbnailUrl,
                playlists: categoryNames
            });
        }

        res.send(foodsWithAllData);
    } catch (err) {
        res.status(500).send({
            message: err.message || "Some error occurred."
        });
    }
};

exports.update = async (req, res) => {
    const foodId = req.params.id;

    if (!foodId) {
        res.status(400).send({
            message: "Music ID is required."
        });
        return;
    }

    try {
        const food = await Food.findByPk(foodId);

        if (!food) {
            res.status(404).send({
                message: `Music with ID ${foodId} not found.`
            });
            return;
        }

        food.title = req.body.title || food.title;
        food.publishedDate = req.body.publishedDate || food.publishedDate;
        food.thumbnailUrl = req.body.thumbnailUrl || food.thumbnailUrl;
        await food.save();

        if (req.body.products && req.body.products.length > 0) {
            const productUpdates = [];
            for (const productInfo of req.body.products) {
                const productName = productInfo.name;
                const productQuantity = productInfo.quantity || 1;
                const productUnit = productInfo.unit;

                const [product, created] = await Product.findOrCreate({
                    where: { name: productName }
                });

                await FoodProduct.upsert({
                    FoodId: food.id,
                    ProductId: product.id,
                    quantity: productQuantity,
                    unit: productUnit
                });


                productUpdates.push(product.id);
            }

            await FoodProduct.destroy({
                where: {
                    FoodId: food.id,
                    ProductId: { [Sequelize.Op.notIn]: productUpdates }
                }
            });
        }

        if (req.body.categories && req.body.categories.length > 0) {
            const categoryUpdates = [];
            for (const categoryName of req.body.categories) {
                const [category, created] = await Category.findOrCreate({
                    where: { name: categoryName }
                });

                await FoodCategory.upsert({
                    FoodId: food.id,
                    CategoryId: category.id
                });

                categoryUpdates.push(category.id);
            }

            await FoodCategory.destroy({
                where: {
                    FoodId: food.id,
                    CategoryId: { [Sequelize.Op.notIn]: categoryUpdates }
                }
            });
        }

        res.send({
            message: `Music with ID ${foodId} has been updated successfully.`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send({
            message: err.message || "Some error occurred while updating the Music."
        });
    }
};

exports.delete = async (req, res) => {
    const foodId = req.params.id;

    if (!foodId) {
        res.status(400).send({
            message: "Music ID is required."
        });
        return;
    }

    try {
        await Comment.destroy({
            where: {
                foodId: foodId
            }
        });

        await FoodCategory.destroy({
            where: {
                FoodId: foodId
            }
        });
        await FoodProduct.destroy({
            where: {
                FoodId: foodId
            }
        });

        await Food.destroy({
            where: {
                id: foodId
            }
        });

        res.send({
            message: `Music with ID ${foodId} has been deleted successfully.`
        });
    } catch (err) {
        console.error(err);
        res.status(500).send({
            message: err.message || "Some error occurred while deleting the Music."
        });
    }
};


exports.searchByTitle = async (req, res) => {
    const searchTerm = req.query.searchTerm;

    if (!searchTerm) {
        return res.status(400).send({
            message: "Search term is required."
        });
    }

    try {
        const foods = await Food.findAll({
            where: {
                title: {
                    [Sequelize.Op.like]: `%${searchTerm}%`
                }
            }
        });

        const foodsWithAllData = [];

        for (const food of foods) {
            const foodCategoryData = await FoodCategory.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const categoryIds = foodCategoryData.map(item => item.CategoryId);

            const categories = await Category.findAll({
                where: {
                    id: categoryIds
                }
            });
            const categoryNames = categories.map(category => category.name);

            const foodProductData = await FoodProduct.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const productIds = foodProductData.map(item => item.ProductId);

            const products = await Product.findAll({
                where: {
                    id: productIds
                }
            });
            const productInfo = products.map(product => ({
                name: product.name,
                quantity: foodProductData.find(item => item.ProductId === product.id).quantity,
                unit: foodProductData.find(item => item.ProductId === product.id).unit
            }));

            
            

            foodsWithAllData.push({
                _id: food.id,
                title: food.title,
                publishedDate: food.publishedDate,
                musicURL: food.thumbnailUrl,                
                playlists: categoryNames
            });
        }

        res.send(foodsWithAllData);
    } catch (err) {
        res.status(500).send({
            message: err.message || "Some error occurred."
        });
    }
};

exports.findByProductName = async (req, res) => {
    try {
        const productName = req.params.name;

        if (!productName) {
            res.status(400).send({
                message: "Product name is required."
            });
            return;
        }

        const productData = await Product.findOne({
            where: {
                name: productName
            }
        });

        if (!productData) {
            res.status(404).send({
                message: `Product with name '${productName}' not found.`
            });
            return;
        }

        const foodProductData = await FoodProduct.findAll({
            where: {
                ProductId: productData.id
            }
        });

        const foodIds = foodProductData.map(item => item.FoodId);

        const foodsData = await Food.findAll({
            where: {
                id: foodIds
            }
        });

        const foodsWithAllData = [];
        for (const food of foodsData) {
            const foodProductData = await FoodProduct.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const productInfo = [];
            for (const item of foodProductData) {
                const product = await Product.findByPk(item.ProductId);
                productInfo.push({
                    name: product.name,
                    quantity: item.quantity,
                    unit: item.unit
                });
            }

            const categoryData = await FoodCategory.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const categoryIds = categoryData.map(item => item.CategoryId);

            const categories = await Category.findAll({
                where: {
                    id: categoryIds
                }
            });

            const categoryNames = categories.map(category => category.name);

            foodsWithAllData.push({
                _id: food.id,
                title: food.title,
                publishedDate: food.publishedDate,
                musicURL: food.thumbnailUrl,                
                playlists: categoryNames
            });
        }

        res.send(foodsWithAllData);
    } catch (err) {
        console.error(err);
        res.status(500).send({
            message: err.message || "Some error occurred."
        });
    }
};

    exports.findByCategory = async (req, res) => {
        try {
            const categoryName = req.params.name;

            if (!categoryName) {
                res.status(400).send({
                    message: "Plailist name is required."
                });
                return;
            }

            const categoryData = await Category.findOne({
                where: {
                    name: categoryName
                }
            });

            if (!categoryData) {
                res.status(404).send({
                    message: `Plailist with name '${categoryName}' not found.`
                });
                return;
            }

            const foodCategoryData = await FoodCategory.findAll({
                where: {
                    CategoryId: categoryData.id
                }
            });

        const foodIds = foodCategoryData.map(item => item.FoodId);

        const foodsData = await Food.findAll({
            where: {
                id: foodIds
            }
        });

        const foodsWithAllData = [];
        for (const food of foodsData) {
            const foodProductData = await FoodProduct.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const productInfo = [];
            for (const item of foodProductData) {
                const product = await Product.findByPk(item.ProductId);
                productInfo.push({
                    name: product.name,
                    quantity: item.quantity,
                    unit: item.unit
                });
            }

            const categoryData = await FoodCategory.findAll({
                where: {
                    FoodId: food.id
                }
            });

            const categoryIds = categoryData.map(item => item.CategoryId);

            const categories = await Category.findAll({
                where: {
                    id: categoryIds
                }
            });

            const categoryNames = categories.map(category => category.name);

            foodsWithAllData.push({
                _id: food.id,
                title: food.title,
                publishedDate: food.publishedDate,
                musicURL: food.thumbnailUrl,                
                playlists: categoryNames
            });
        }

        res.send(foodsWithAllData);
    } catch (err) {
        console.error(err);
        res.status(500).send({
            message: err.message || "Some error occurred."
        });
    }
};
