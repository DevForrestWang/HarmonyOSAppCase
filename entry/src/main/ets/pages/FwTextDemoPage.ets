import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// UI组件：Text
@Entry
@Component
struct FwTextDemoPage {

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：Text'}){
        Text("UI组件：Text使用")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
    }

  }
}