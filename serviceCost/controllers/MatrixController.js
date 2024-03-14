const ApiError = require('../errors/ApiError')
const db = require('../db')

class MatrixController {
    async getBaselineMatrix() {
        try {
            const response= await db.query(
                `SELECT name FROM baselines WHERE active=true`
            )
            const baselineName = response[0][0].name

            const baselineObj = (await db.query(
                `SELECT * FROM ${baselineName}`
            ))[0]
            const baseline = []
            baselineObj.forEach(obj => {
                if (!baseline[obj.microcategory_id]) {
                    baseline[obj.microcategory_id] = []
                }
                baseline[obj.microcategory_id][obj.location_id] = obj.price
            })
            return baseline
        } catch (e) {
            return []
        }
    }

    async getDiscountMatrix() {
        try {
            const response = await db.query(
                `SELECT name, segment FROM discounts WHERE active=true`
            )
            const namesAndSegments = response[0].map(obj => {
                return {
                    "name": obj.name,
                    "segment": obj.segment
                }
            })

            const discounts = {}

            for (let i in namesAndSegments) {
                const name = namesAndSegments[i].name
                const segment = namesAndSegments[i].segment
                const discountObj = (await db.query(`SELECT * FROM ${name}`))[0]
                discounts[segment] =  []
                discountObj.forEach(obj => {
                    if(!discounts[segment][obj.microcategory_id]) {
                        discounts[segment][obj.microcategory_id] = []
                    }
                    discounts[segment][obj.microcategory_id][obj.location_id] = obj.price
                })
            }
            return discounts
        } catch (e) {
            return {}
        }
    }
}

module.exports = new MatrixController()