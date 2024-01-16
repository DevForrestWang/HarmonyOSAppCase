import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// UI组件：TextInput
@Entry
@Component
struct FwTextInputDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：TextInput'}){
        Text("UI组件：TextInput使用")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
    }

  }
}