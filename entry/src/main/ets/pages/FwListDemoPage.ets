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

        Column({ space: 10 }) {

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}