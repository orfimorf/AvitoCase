const Router = require("express");
const costRouter = require('./CostRouter')
const mainRouter = require('./MainRouter')

const router = new Router()

router.use('/cost', costRouter)
router.use('/main', mainRouter)

module.exports = router