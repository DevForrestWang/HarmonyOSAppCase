import CC from '../../common/CConstants'
import BaseNaView from '../../view/BaseNavigationView'

@Entry
@Component
struct FwProgressDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件Progress'}){

        Column({ space: 10 }) {

          Text('Orbital LoadingProgress ').fontSize(14).fontColor(Color.Black)
          LoadingProgress()
            .color(Color.Blue)
            .width(200)
            .height(200)

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}