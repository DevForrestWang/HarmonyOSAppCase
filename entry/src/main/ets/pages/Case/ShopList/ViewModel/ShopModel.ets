import ShopInfo from './ShopInfo';
import CM from '../../../../Common/CCommon'
import { ResponseResult, ParamsType } from '../../../../Common/HttpUtil'

class ShopModel {
	pageNo: number = 1

	getShopList(): Promise<ShopInfo[]> {
		return new Promise((resolve, reject) => {
			let url = `${CM.HttpURL.BASE_SERVER}/${CM.HttpURL.shopsURL}`
			let params: ParamsType = {
				pageNo: 1,
				pageSize: 4
			}

			CM.HttpRequestGet(url, params).then((resData: ResponseResult) => {
				if (resData.retCode === CM.HttpConstant.HTTP_CODE_200) {
					CM.Logger.debug('resData', JSON.stringify(resData));
					let shopInfoAry = resData.data as ShopInfo[];

					// 给图片加上服务器地址前缀
					shopInfoAry.forEach(s => {
						s.images.forEach((src, i) => {
							s.images[i] = CM.HttpURL.BASE_SERVER + src
						})
					})
					resolve(shopInfoAry)
				} else {
					CM.Logger.error('shops failed', JSON.stringify(resData));
					reject(JSON.stringify(resData))
				}
			}).catch((err: Error) => {
				CM.Logger.error('shops failed', JSON.stringify(err));
				reject(JSON.stringify(err))
			});
		})
	}
}

const shopModel = new ShopModel();

export default shopModel as ShopModel;