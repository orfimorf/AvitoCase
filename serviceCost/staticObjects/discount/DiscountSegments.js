const SegmentsMock = require('../mocks/SegmentsMock')

class DiscountSegments {
    static segments = SegmentsMock.mockSegments

    static getSegmentsByUserId(id) {
        let segment = this.segments[id]
        if (!segment) {
            return []
        }
        return segment
    }
}

module.exports = DiscountSegments