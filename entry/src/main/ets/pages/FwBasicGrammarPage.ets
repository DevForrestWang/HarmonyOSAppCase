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

  // CustomBuilder类型的菜单栏
  @Builder NavigationMenus() {
    Row() {
      Image($r('app.media.ic_birthdate'))
        .size({ width: 24, height: 24 })
      Image($r('app.media.ic_signature'))
        .size({ width: 24, height: 24 })
        .margin({ left: 5 })
    }.justifyContent(FlexAlign.End)
  }

  // 导航栏标题居中
  @Builder NavigationTitle() {
    Row() {
      Text('ArkUI')
        .fontSize(CC.vp(24))
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .size({ width: '65%'})
    }
  }

  build() {

    Column() {
      Navigation() {
        Text("首页内容")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
      .title(this.NavigationTitle())
      .mode(NavigationMode.Stack)
      .titleMode(NavigationTitleMode.Mini)
      .hideBackButton(false)
      .menus(this.NavigationMenus())
      //.toolBar(this.NavigationToolbar())
      .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
    }
    .width(CC.FULL_PARENT)
    .height(CC.FULL_PARENT)
  }

}