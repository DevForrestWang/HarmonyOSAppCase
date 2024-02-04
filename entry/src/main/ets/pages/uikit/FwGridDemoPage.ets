import CM from '../../common/CCommon'
import BaseNaView from '../../view/BaseNavigationView'

/// UI组件：Grid
@Entry
@Component
struct FwGridDemoPage {
  @State Number: String[] = ['0', '1', '2', '3', '4']
  scroller: Scroller = new Scroller()

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：Grid'}){
        Column({ space: 10 }) {

          Grid() {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width(CM.Co.FULL_PARENT)
                    .height(CM.Co.FULL_PARENT)
                    .textAlign(TextAlign.Center)
                }
              }, day => day)
            }, day => day)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .height(300)

          Text('Scroll').fontColor(Color.Black).fontSize(14).width(CM.Co.FULL_PARENT)
          Grid(this.scroller) {
            ForEach(this.Number, (day: string) => {
              ForEach(this.Number, (day: string) => {
                GridItem() {
                  Text(day)
                    .fontSize(16)
                    .backgroundColor(0xF9CF93)
                    .width(CM.Co.FULL_PARENT)
                    .height(80)
                    .textAlign(TextAlign.Center)
                }
              }, day => day)
            }, day => day)
          }
          .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
          .onScrollIndex((first: number) => {
            console.info(first.toString())
          })
          .width('90%')
          .backgroundColor(0xFAEEE0)
          .height(300)
          Button('Next page')
            .onClick(() => { // 点击后滑到下一页
              // this.scroller.scrollPage({ next: true })
              this.scroller.scrollEdge(Edge.Bottom)
            })

        }
        .width(CM.Co.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}