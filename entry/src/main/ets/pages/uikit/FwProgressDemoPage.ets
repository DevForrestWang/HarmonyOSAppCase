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
            .width(50)
            .height(50)

          Text('进度条').fontSize(14).fontColor(Color.Black)
          // 创建一个进度总长为100，初始进度值为24的线性进度条
          Progress({ value: 24, total: 100, type: ProgressType.Linear })
          Progress({ value: 24, total: 100, type: ProgressType.Ring })

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}