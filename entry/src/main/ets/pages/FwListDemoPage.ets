import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// UI组件：List
@Entry
@Component
struct FwListDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：List'}){
        Text("UI组件：List使用")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
    }

  }
}