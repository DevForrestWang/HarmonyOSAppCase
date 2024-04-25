var express = require('express');
var router = express.Router();
const shop_controller = require('../controllers/shopController')

/* GET users listing. */
router.get('/', shop_controller.get_shop_list);

module.exports = router;
