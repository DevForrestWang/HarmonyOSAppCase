import CC from '../common/CConstants'
import Log from '../common/FWLog'

/// 导航栏基本页面
@Component
export default  struct BaseNavigationView {

  // CustomBuilder类型的菜单栏
  @Builder NavigationMenus() {
    Row() {
      Image($r('app.media.ic_birthdate'))
        .size({ width: 24, height: 24 })
        .onClick(() =>{
          Log.debug('birthdate')
        })

      Image($r('app.media.ic_signature'))
        .size({ width: 24, height: 24 })
        .margin({ left: 5 })
        .onClick(()=> {
          Log.debug("signature")
        })
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

    Scroll(){

      Column() {
        Navigation() {
          Text("页面内容")
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
        .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
      }
      .width(CC.FULL_PARENT)
      .height(CC.FULL_PARENT)

    }

  }

}