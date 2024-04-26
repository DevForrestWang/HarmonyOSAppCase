import CM from '../../common/CCommon'
import { ResponseResult, ParamsType } from '../../common/HttpUtil'
import BaseNaView from '../../view/BaseNavigationView'
import ShopInfo from '../Case/ShopList/ViewModel/ShopInfo'

/// 网络请求
@Entry
@Component
struct FwNetWorkDemoPage {

  aboutToAppear() {

    let url = `${CM.HttpURL.BASE_SERVER}/${CM.HttpURL.shopsURL}`
    let params:ParamsType = {
      pageNo: 1,
      pageSize: 2
    }

    CM.HttpRequestGet(url, params).then((resData: ResponseResult) => {
      if (resData.retCode === CM.HttpConstant.HTTP_CODE_200) {
        CM.Logger.debug('data', JSON.stringify(resData.data));
        let shopInfoAry = resData.data as ShopInfo[];
        CM.Utils.toast("网络状态：" + resData.retCode)
      } else {
        CM.Logger.error('shops failed', JSON.stringify(resData));
      }
    }).catch((err: Error) => {
      CM.Logger.error('shops failed', JSON.stringify(err));
    });

  }

  build() {

    Scroll(){
      BaseNaView({title: '网络请求'}){

        Column({ space: 10 }) {

        }
        .width(CM.Co.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}