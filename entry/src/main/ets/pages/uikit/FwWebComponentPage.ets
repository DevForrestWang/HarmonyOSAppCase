import webView from '@ohos.web.webview'
import CM from '../../common/CCommon'
import BaseNaView from '../../view/BaseNavigationView'

@Entry
@Component
struct FwWebComponentPage {
  webviewVC: webView.WebviewController = new webView.WebviewController();

  build() {

    Column(){
      BaseNaView({title: 'UI组件：WebView'}){

        Web({ src: 'm.baidu.com', controller: this.webviewVC})
          .javaScriptAccess(true)
          .fileAccess(true)
          .domStorageAccess(true)
          .mediaPlayGestureAccess(true)
          .multiWindowAccess(true)
          .padding(CM.Utils.vp(20))
          .height(CM.Co.FULL_PARENT)
          .onConsole((event) => {
            CM.Logger.debug('getMessage:' + event.message.getMessage());
            CM.Logger.debug('getMessageLevel:' + event.message.getMessageLevel());
            return false;
          })

      }
    }

  }
}