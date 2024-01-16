import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// UI组件：TextArea
@Entry
@Component
struct FwTextAreaDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：TextArea'}){
        Text("UI组件：TextArea")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
    }

  }
}