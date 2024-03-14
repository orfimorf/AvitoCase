const microcategoryTree = require('./staticObjects/microcategory/MicrocategoryTree')
const locationTree = require('./staticObjects/location/LocationTree')
const SegmentsMock = require('./staticObjects/mocks/SegmentsMock')
const matrixController = require('./controllers/MatrixController')

class Configuration {
    constructor() {
        this._baseline = {}
        this._discounts = []
        this._userSegments = []
        this._microcategoryTree = microcategoryTree
        this._locationTree = locationTree
        this._initializeServer()
    }

    get baseline() {
        return this._baseline
    }

    get discounts() {
        return this._discounts
    }

    get userSegments() {
        return this._userSegments
    }

    get microcategoryTree() {
        return this._microcategoryTree
    }

    get locationTree() {
        return this._locationTree
    }

    async _initializeServer() {
        const baseline = await this._getBaselineMatrix()
        const discounts = await this._getDiscountMatrix()
        const userSegments = this._getUserSegments()

        this._baseline = baseline
        this._discounts = discounts
        this._userSegments = userSegments
    }

    async reInitializeServer() {
        this._initializeServer()
    }

    _getUserSegments() {
        return SegmentsMock.mockSegments
    }

    async _getBaselineMatrix() {
        return (await matrixController.getBaselineMatrix())
    }

    async _getDiscountMatrix() {
        return (await matrixController.getDiscountMatrix())
    }
}

module.exports = new Configuration()