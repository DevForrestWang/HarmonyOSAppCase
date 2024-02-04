import router from '@ohos.router'
import window from '@ohos.window'
import CM from '../common/CCommon'
import TextCommonWidget from './TextCommonWidget'
import TitleBarComponent from '../view/TitleBarComponent'

@Component
export default struct CaseView {

  build() {

    Column(){

      // 导航栏
      TitleBarComponent({ isBack: false, title: 'Case' })

      Scroll() {

        Column(){

          TextCommonWidget({
            title: '打印日志、Toast 测试',
            textImage: $r('app.media.ic_display_and_brightness'),
            onItemClick: () => {
              CM.Logger.debug("debug test log")
              CM.Logger.info("info test log")
              CM.Logger.error("error test log")

              CM.Utils.toast("吐司测试")

              CM.Logger.debug(`heitht: ${CM.Utils.screenHeight()}`)
              CM.Logger.debug(`heitht/2: ${CM.Utils.screenHeight() / 2}`)
              CM.Logger.debug(`weight: ${CM.Utils.screenWeight()}`)

              let deviceSize = CM.Utils.getDeviceSize(getContext(this));
              deviceSize.then((data: window.Window) => {
                CM.Logger.debug(`window Object: ${data}`)
              });

            }
          })

          TextCommonWidget({
            title: '聊天页面',
            textImage: $r('app.media.ic_app_management'),
            onItemClick: () => {

              router.pushUrl({
                url: 'pages/chat/pages/SetFontSizePage'
              }).catch((error: Error) => {
                CM.Logger.info('CasePage push error' + JSON.stringify(error));
              })

            }
          })

        }
        .width(CM.Co.FULL_PARENT)
        .backgroundColor('#F5F5F5')

      }
    }
    .height(CM.Co.FULL_PARENT)
  }
}