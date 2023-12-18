import CConstants from '../common/constants/CConstants';

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
        .width('25vp')
        .height('25vp')
      Text(title)
        .margin({top: '4vp'})
        .fontSize('10fp')
        .fontColor(this.currentIndex === index ? "#1698CE" : "#6B6B6B")
    }
    .justifyContent(FlexAlign.Center)
    .height('56vp')
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
        Column().width('100%').height('100%').backgroundColor(Color.Green)
      }
      .padding({ left: '0vp', right: '0vp'})
      .backgroundColor('#F1F3F5')
      .tabBar(this.TabBuilder('UIKit', CConstants.UIKIT_TAB_INDEX, $r('app.media.home_selected'), $r('app.media.home_normal')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Red)
      }
      .padding({ left: '0vp', right: '0vp'})
      .backgroundColor('#F1F3F5')
      .tabBar(this.TabBuilder('Case', CConstants.CASE_TAB_INDEX, $r('app.media.mine_selected'), $r('app.media.mine_normal')))
    }
    .width(CConstants.FULL_PARENT)
    .backgroundColor(Color.White)
    .barHeight('56vp')
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })

  }

}


