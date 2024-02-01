import webView from '@ohos.web.webview'
import CC from '../../common/CConstants'
import BaseNaView from '../../view/BaseNavigationView'

@Entry
@Component
struct FwWebComponentPage {
  webviewVC: webView.WebviewController = new webView.WebviewController();

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：TextInput'}){

        Column({ space: 10 }) {
          Web({ src: 'https://developer.huawei.com/consumer/cn/app', controller: this.webviewVC})
            .javaScriptAccess(true)
        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}