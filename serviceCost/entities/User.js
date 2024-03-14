const configuration = require('../Configuration')
const DiscountSegments = require('../staticObjects/discount/DiscountSegments')

class User {
    constructor(id, location_id, microcategory_id) {
        this._id = id
        this._location_id = location_id
        this._microcategory_id = microcategory_id
    }

    findCost() {
        const segments = DiscountSegments.getSegmentsByUserId(this._id).sort(function (a, b) {
            return b - a
        })

        for (let i in segments) {
            const segment = segments[i]
            const potCost = this._tryGetCostFromMatrix(
                this._microcategory_id, this._location_id, this._getMatrixBySegment(segment)
            )
            if (potCost) {
                return potCost
            }
        }
        return this._tryGetCostFromMatrix(this._microcategory_id, this._location_id, configuration.baseline)
    }

    _getMatrixBySegment(segment) {
        const discount = configuration.discounts[segment]
        if (!discount) {
            return undefined
        }
        return discount
    }

    _tryGetCostFromMatrix(microcategoryId, locationId, matrix) {
        if (!matrix) {
            return undefined
        }
        let location = configuration.locationTree.getLocation(locationId)
        while (location) {
            let microcategory = configuration.microcategoryTree.getMicrocategory(microcategoryId)
            while (microcategory) {
                const potCost = this._tryGetCostFromMatrixByIds(
                    microcategory.id, location.id, matrix
                )
                if (potCost) {
                    return potCost
                }
                microcategory = microcategory.parent
            }
            location = location.parent
        }
        return undefined
    }

    _tryGetCostFromMatrixByIds(microcategoryId, locationId, matrix) {
        if (!matrix[microcategoryId]) {
            return undefined
        }
        const cost = matrix[microcategoryId][locationId]
        if (cost) {
            return cost
        }
        return undefined
    }
}

module.exports = User