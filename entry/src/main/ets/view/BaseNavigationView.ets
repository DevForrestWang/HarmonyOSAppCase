import CC from '../common/CConstants'
import Utils from '../common/CCUtils'

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
        .fontSize(Utils.vp(24))
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .size({ width: '65%'})
    }
  }

  build() {

    Navigation() {
      Scroll(){ // 内容过多时支持滚动
        Column(){
          this.contentCloser()
        }
      }
      .scrollable(ScrollDirection.Vertical) // 滚动方向纵向
      .scrollBar(BarState.Off) // 滚动条常驻显示
      .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
    }
    .title(this.NavigationTitle())
    .mode(NavigationMode.Stack)
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(false)
    //.menus(this.NavigationMenus())
    .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
    .backgroundColor('0xf4f4f7') // 显示不全时，背景颜色便于查看容器大小

  }

}