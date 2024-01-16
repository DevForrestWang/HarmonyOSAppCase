import CC from '../common/CConstants'
import Utils from '../common/FWUtils'

/// 导航栏基本页面
@Component
export default struct BaseNavigationView {
  @Prop title: string;
  @BuilderParam contentCloser: () => void

  // CustomBuilder类型的菜单栏
  @Builder NavigationMenus() {
    Row() {
      Image($r('app.media.ic_signature'))
        .size({ width: 24, height: 24 })
        .margin({ left: 5 })
        .onClick(()=> {
          Utils.toast('signature')
        })
    }.justifyContent(FlexAlign.End)
  }

  // 导航栏标题居中
  @Builder NavigationTitle() {
    Row() {
      Text(this.title)
        .fontSize(CC.vp(24))
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .size({ width: '65%'})
    }
  }

  build() {
    Column() {
      Navigation() {
        this.contentCloser()
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