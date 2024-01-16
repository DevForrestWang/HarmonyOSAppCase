import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// 网络请求
@Entry
@Component
struct FwNetWorkDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: '网络请求'}){
        Text("网络请求使用")
          .textAlign(TextAlign.Center)
          .fontSize(30)
          .size({ width: CC.FULL_PARENT, height: CC.FULL_PARENT })
          .backgroundColor('#ffd4e9ee')
      }
    }

  }
}