import router from '@ohos.router';
import CC from '../../common/CConstants'
import Log from '../../common/FWLog'
import BaseNaView from '../../view/BaseNavigationView'

/**
 * 语法基本页面
 */
@Entry
@Component
struct FwBasicGrammarPage {

  // 获取前一个页面的参数
  @State params: string = (router.getParams() as Record<string, string>)['src']

  aboutToAppear() {
    Log.debug("aboutToAppear")
  }

  aboutToDisappear() {
    Log.debug("aboutToDisappear")
  }

  onPageShow(){
    Log.debug("onPageShow")
  }

  onPageHide() {
    Log.debug("onPageHide")
  }

  onBackPress() {
    Log.debug("onBackPress")
  }

  build() {
    Scroll(){
      BaseNaView({title: '基本语法'}){

        Column({ space: 10 }) {

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}