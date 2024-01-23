import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'
import MyDataSource from '../viewmodel/MyDataSource'

/// UI组件：Swiper
@Entry
@Component
struct FwSwiperDemoPage {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list = []
    for (var i = 1; i <= 10; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
  }

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：Swiper'}){

        Column({ space: 10 }) {

          Swiper(this.swiperController) {
            LazyForEach(this.data, (item: string) => {
              Text(item).width('90%')
                .height(160)
                .backgroundColor(0xAFEEEE)
                .textAlign(TextAlign.Center)
                .fontSize(30)
            }, item => item)
          }
          .cachedCount(2)
          .index(1)
          .autoPlay(true)
          .interval(4000)
          .indicator(true)
          .loop(true)
          .duration(1000)
          .itemSpace(0)
          .curve(Curve.Linear)
          .onChange((index: number) => {
            console.info(index.toString())
          })

          Row({ space: 12 }) {
            Button('ShowNext')
              .onClick(() => {
                this.swiperController.showNext()
              })
            Button('ShowPrevious')
              .onClick(() => {
                this.swiperController.showPrevious()
              })
          }.margin(5)

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}