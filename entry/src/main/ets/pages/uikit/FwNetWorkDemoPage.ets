import CM from '../../common/CCommon'
import { ResponseResult, ParamsType } from '../../common/HttpUtil'
import BaseNaView from '../../view/BaseNavigationView'

/// 网络请求
@Entry
@Component
struct FwNetWorkDemoPage {

  aboutToAppear() {

    let url = `${CM.HttpURL.BASE_SERVER}/${CM.HttpURL.GET_NEWS_TYPE}`
    let params:ParamsType = {
      currentPage: 1,
      pageSize: 10
    }

    CM.HttpRequestGet(url, params).then((data: ResponseResult) => {
      if (data.code === CM.HttpConstant.SERVER_CODE_SUCCESS) {
        CM.Logger.debug('getNewsList data', JSON.stringify(data.data));
        CM.Utils.toast("网络请求结果：" + data.code)
      } else {
        CM.Logger.error('getNewsList failed', JSON.stringify(data));
      }
    }).catch((err: Error) => {
      CM.Logger.error('getNewsList failed', JSON.stringify(err));
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