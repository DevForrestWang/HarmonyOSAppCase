import CM from '../common/CCommon'
import UIKitView from  '../view/UIKitView'
import CaseView from '../view/CaseView'

@Entry
@Component
struct MainPage {

  @State currentIndex: number = CM.Co.UIKIT_TAB_INDEX;
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
        .width(CM.Utils.vp(25))
        .height(CM.Utils.vp(25))
        .objectFit(ImageFit.Contain)
      Text(title)
        .margin({top: CM.Utils.vp(4)})
        .fontSize(CM.Utils.vp(10))
        .fontColor(this.currentIndex === index ? "#1698CE" : "#6B6B6B")
        .opacity(this.currentIndex === index ? 1 : 0.6)
    }
    .justifyContent(FlexAlign.Center)
    .height(CM.Utils.vp(56))
    .width(CM.Co.FULL_PARENT)
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {

    Tabs({
      barPosition: BarPosition.End,
      index: this.currentIndex,
      controller: this.tabsController
    }) {
      TabContent() {
        UIKitView()
      }
      .backgroundColor('#F1F3F5')
      .tabBar(this.TabBuilder('UIKit', CM.Co.UIKIT_TAB_INDEX, $r('app.media.home_selected'), $r('app.media.home_normal')))

      TabContent() {
        CaseView()
      }
      .backgroundColor('#F1F3F5')
      .tabBar(this.TabBuilder('Case', CM.Co.CASE_TAB_INDEX, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .width(CM.Co.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight(CM.Co.BAR_HEIGHT)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })

  }

}


