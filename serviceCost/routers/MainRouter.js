const Router = require('express')
const mainController = require('../controllers/MainController')

const router = new Router()

router.get('/reConfig', mainController.reConfig)

module.exports = router