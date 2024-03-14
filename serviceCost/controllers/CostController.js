const ApiError = require('../errors/ApiError')
const sequelize = require('../db')
const User = require('../entities/User')

class CostController {
    async getCost(req, res, next) {
        try {
            const {location_id, microcategory_id, user_id} = req.query
            const user = new User(user_id, location_id, microcategory_id)
            return res.json(await user.findCost())
        } catch (e) {
            next(ApiError.badRequest(e.message))
        }
    }
}

module.exports = new CostController()