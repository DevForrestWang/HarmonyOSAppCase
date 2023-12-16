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
      Image(this.currentIndex == index ? selectImg : normalImg)
        .width('25vp')
        .height('25vp')
      Text(title)
        .margin({top: '4vp'})
        .fontSize('10fp')
        .fontColor(this.currentIndex == index ? "#1698CE" : "#6B6B6B")
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
    Row() {
      Column() {
        Text('Hello World22')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
      }
      .width('100%')
    }
    .height('100%')
  }

}


