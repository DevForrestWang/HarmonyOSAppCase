import router from '@ohos.router'
import window from '@ohos.window'
import CM from '../common/CCommon'
import TextCommonWidget from './TextCommonWidget'
import TitleBarComponent from '../view/TitleBarComponent'
import RefreshComponent from '../Component/PullRefresh/RefreshComponent'
import { RefreshHeaderStyle, RefreshState, RefreshConstants } from '../Component/PullRefresh//RefreshConstants'

@Component
export default struct CaseView {

  @Provide(RefreshConstants.REFRESH_STATE_TAG) refreshState: number = RefreshState.COMPLETE;

  @Builder
  ContentBody() {
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

  build() {

    Column(){

      // 导航栏
      TitleBarComponent({ isBack: false, title: 'Case' })

      // 下拉刷新组件
      RefreshComponent({
        headerStyle: RefreshHeaderStyle.CLOUD,
        itemLayout: (): void => this.ContentBody(),
        displayHeight: (CM.Utils.screenHeight()),
        onRefresh: () => {
          setTimeout(() => {
            this.refreshState = RefreshState.COMPLETE;
          }, RefreshConstants.REFRESH_DEFAULT_TIMEOUT);
        }
      }).width(CM.Co.FULL_PARENT)

    }
    .height(CM.Co.FULL_PARENT)
  }
}