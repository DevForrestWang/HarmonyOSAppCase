import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// UI组件：List
@Entry
@Component
struct FwListDemoPage {
  @State arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  @State editFlag: boolean = false

  build() {

    Scroll(){

      BaseNaView({title: 'UI组件：List'}){

        Button('Edit list')
          .onClick(() => {
            this.editFlag = !this.editFlag
          }).margin({ top: 5, left: 20 })

        Column({ space: 10 }) {

          List({space:20, initialIndex:0}) {
            ForEach(this.arr, (item, index) => {
              ListItem() {
                Flex({direction: FlexDirection.Row, alignItems: ItemAlign.Center}) {
                  Text('' + item)
                    .width(CC.FULL_PARENT)
                    .height(80)
                    .fontSize(25)
                    .textAlign(TextAlign.Center)
                    .backgroundColor(0xF5DEB3)
                    .borderRadius(3)
                    .flexShrink(1)
                  if (this.editFlag) {
                    Button() {
                      Text("Delete").fontSize(16)
                    }.width(80)
                    .height(40)
                    .onClick(() => {
                      console.info(this.arr[index] + 'Delete')
                      this.arr.splice(index, 1)
                      console.info(JSON.stringify(this.arr))
                      this.editFlag = false
                    }).stateEffect(true)
                  }
                }
              }
              .border({ width: 1, color: Color.Green })
              .borderRadius(3)
              .backgroundColor(0xAFEEEE)
            }, item => item)
          }.width(CC.FULL_PARENT)

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })
      }
    }

  }
}