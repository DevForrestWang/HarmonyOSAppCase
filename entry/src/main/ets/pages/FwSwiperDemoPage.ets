import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// UI组件：Swiper
@Entry
@Component
struct FwSwiperDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：Swiper'}){

        Column({ space: 10 }) {

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}