import webView from '@ohos.web.webview'
import Utils from '../../common/CCUtils'
import CC from '../../common/CConstants'
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
          .padding(Utils.vp(20))
          .height(CC.FULL_PARENT)
          .onConsole((event) => {
            console.log('getMessage:' + event.message.getMessage());
            console.log('getMessageLevel:' + event.message.getMessageLevel());
            return false;
          })

      }
    }

  }
}