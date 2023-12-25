import CC from '../common/CConstants'
import UIKitView from  '../view/UIKitView'
import CaseView from '../view/CaseView'
import router from '@ohos.router';

@Entry
@Component
struct MainPage {

  @State currentIndex: number = CC.UIKIT_TAB_INDEX;
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
        .width(CC.vp(25))
        .height(CC.vp(25))
      Text(title)
        .margin({top: CC.vp(4)})
        .fontSize(CC.vp(10))
        .fontColor(this.currentIndex === index ? "#1698CE" : "#6B6B6B")
    }
    .justifyContent(FlexAlign.Center)
    .height(CC.vp(56))
    .width(CC.FULL_PARENT)
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
      .tabBar(this.TabBuilder('UIKit', CC.UIKIT_TAB_INDEX, $r('app.media.home_selected'), $r('app.media.home_normal')))

      TabContent() {
        CaseView()
      }
      .backgroundColor('#F1F3F5')
      .tabBar(this.TabBuilder('Case', CC.CASE_TAB_INDEX, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .width(CC.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight(CC.BAR_HEIGHT)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })

  }

}


