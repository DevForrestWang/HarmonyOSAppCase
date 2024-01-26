import CC from '../../common/CConstants'
import BaseNaView from '../../view/BaseNavigationView'

/// 网络请求
@Entry
@Component
struct FwNetWorkDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: '网络请求'}){

        Column({ space: 10 }) {

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}