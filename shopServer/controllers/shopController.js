const shopData = require('../models/shopData')

exports.get_shop_list = (req, res) => {
    let pageNo = req.query.pageNo || 1
    let pageSize = req.query.pageSize || 3

    let from = (pageNo - 1) * pageSize
    let end = pageNo * pageSize
    let lisData = shopData.data.slice(from, end)
    res.send({
        retCode : 200,
        msg: 'success',
        data: lisData,
        curPage : from,
        totalPage : shopData.data.length
    })
}