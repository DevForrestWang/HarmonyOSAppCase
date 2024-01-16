import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// 页面布局，容器
@Entry
@Component
struct FwContainerDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: '页面布局，容器'}){
        Text("页面布局，容器使用")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
    }

  }
}