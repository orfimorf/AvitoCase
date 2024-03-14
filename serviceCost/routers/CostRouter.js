const Router = require('express')
const costController = require('../controllers/CostController')

const router = new Router()

router.get('/getCost', costController.getCost)

module.exports = router