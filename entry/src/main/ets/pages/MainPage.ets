import CConstants from '../common/constants/CConstants'
import UIKitView from  '../view/UIKitView'
import CaseView from '../view/CaseView'

@Entry
@Component
struct MainPage {

  @State currentIndex: number = CConstants.UIKIT_TAB_INDEX;
  private tabsController: TabsController = new TabsController();

  /**
   * TabBar 样式
   * @param title
   * @param index
   * @param selectImg
   * @param normalImg
   */
  @Builder TabBuilder(title: string, index: number, selectImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectImg : normalImg)
        .width(CConstants.vp(25))
        .height(CConstants.vp(25))
      Text(title)
        .margin({top: CConstants.vp(4)})
        .fontSize(CConstants.vp(10))
        .fontColor(this.currentIndex === index ? "#1698CE" : "#6B6B6B")
    }
    .justifyContent(FlexAlign.Center)
    .height(CConstants.vp(56))
    .width(CConstants.FULL_PARENT)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {

    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      TabContent() {
        UIKitView()
      }
      .backgroundColor('#F1F3F5')
      .tabBar(this.TabBuilder('UIKit', CConstants.UIKIT_TAB_INDEX, $r('app.media.home_selected'), $r('app.media.home_normal')))

      TabContent() {
        CaseView()
      }
      .backgroundColor('#F1F3F5')
      .tabBar(this.TabBuilder('Case', CConstants.CASE_TAB_INDEX, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .width(CConstants.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight(CConstants.vp(56))
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })

  }

}


