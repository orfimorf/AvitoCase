const ApiError = require('../errors/ApiError')
const configuration = require('../Configuration')

class MainController {
    async reConfig(req, res, next) {
        try {
            configuration.reInitializeServer()
        } catch (e) {
            next(ApiError.badRequest(e.message))
        }
    }
}

module.exports = new MainController()