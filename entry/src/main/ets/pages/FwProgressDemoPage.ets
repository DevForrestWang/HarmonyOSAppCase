import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

@Entry
@Component
struct FwProgressDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件Progress'}){
        Text("UI组件：LoadingProgress使用")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
    }

  }
}