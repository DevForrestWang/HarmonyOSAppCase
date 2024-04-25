import CM from '../../common/CCommon'
import { ResponseResult, ParamsType } from '../../common/HttpUtil'
import BaseNaView from '../../view/BaseNavigationView'

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

    CM.HttpRequestGet(url, params).then((data: ResponseResult) => {
      if (data.retCode === CM.HttpConstant.HTTP_CODE_200) {
        CM.Logger.debug('data', JSON.stringify(data.data));
        CM.Utils.toast("网络请求结果：" + data.retCode)
      } else {
        CM.Logger.error('shops failed', JSON.stringify(data));
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