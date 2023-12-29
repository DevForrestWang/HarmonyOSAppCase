import router from '@ohos.router';
import CC from '../common/CConstants'
import Log from '../common/FWLog'

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
    Row(){
      Column(){
        Button('Back')
          .fontSize(CC.vp(16))
          .width(CC.vp(80))
          .height(CC.vp(44))
          .backgroundColor('#007DFF')
          .onClick(()=> {
            Log.debug('Params: ' + this.params)
            router.back()
          })
      }
      .width(CC.FULL_PARENT)
      .height(CC.NAV_BAR_HEIGHT)
    }
    .height(CC.FULL_PARENT)
    .backgroundColor('$F1F3F5')
  }

}