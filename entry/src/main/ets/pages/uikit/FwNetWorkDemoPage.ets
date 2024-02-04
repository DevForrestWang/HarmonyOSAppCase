import CM from '../../common/CCommon'
import { ResponseResult } from '../../common/HttpUtil'
import BaseNaView from '../../view/BaseNavigationView'

/// 网络请求
@Entry
@Component
struct FwNetWorkDemoPage {

  aboutToAppear() {

    let url = `http://192.168.1.177:9588/news/getNewsType`;
    url += '?currentPage=' + 1 + '&pageSize=' + 10;
    CM.HttpRequestGet(url).then((data: ResponseResult) => {
      if (data.code === CM.HttpConstant.SERVER_CODE_SUCCESS) {
        CM.Logger.debug('getNewsList data', JSON.stringify(data.data));
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