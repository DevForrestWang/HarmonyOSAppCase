const shopData = require('../models/shopData')

exports.get_shop_list = (req, res) => {
    let pageNo = req.query.pageNo || 1
    let pageSize = req.query.pageSize || 3

    let from = (pageNo - 1) * pageSize
    let end = pageNo * pageSize
    res.send(shopData.data.slice(from, end))
}