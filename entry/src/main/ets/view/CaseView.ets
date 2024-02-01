import router from '@ohos.router'
import window from '@ohos.window'
import CC from '../common/CConstants'
import TextCommonWidget from './TextCommonWidget'
import Log from '../common/Logger'
import Utils from '../common/CCUtils'
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
              Log.debug("debug test log")
              Log.info("info test log")
              Log.error("error test log")

              Utils.toast("吐司测试")

              Log.debug(`heitht: ${Utils.screenHeight()}`)
              Log.debug(`heitht/2: ${Utils.screenHeight() / 2}`)
              Log.debug(`weight: ${Utils.screenWeight()}`)

              let deviceSize = Utils.getDeviceSize(getContext(this));
              deviceSize.then((data: window.Window) => {
                Log.debug(`window Object: ${data}`)
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
                Log.info('CasePage push error' + JSON.stringify(error));
              })

            }
          })

        }
        .width(CC.FULL_PARENT)
        .backgroundColor('#F5F5F5')

      }
    }
    .height(CC.FULL_PARENT)
  }
}