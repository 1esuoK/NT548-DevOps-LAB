const express = require('express');
const productController = require('../controllers/productController');
const router = express.Router();

router.get('/', productController.getProducts);

router.get('/:idOrName', productController.findProduct);

router.post('/', productController.createProduct);

router.get('/products', productController.getProducts)

module.exports = router;
