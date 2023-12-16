import CommonConstants from '../common/constants/CommonConstants';

@Entry
@Component
struct MainPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
      }
      .width('100%')
    }
    .height('100%')
  }

}


