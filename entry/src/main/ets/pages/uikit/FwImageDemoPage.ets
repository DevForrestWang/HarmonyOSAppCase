import CM from '../../common/CCommon'
import BaseNaView from '../../view/BaseNavigationView'

/// UI组件：Image
@Entry
@Component
struct FwImageDemoPage {
  @State rotateAngle: number = 0
  @State iconSize: number = 20

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：Image'}){

        Column({ space: 10 }) {

          Row() {
            // 加载png格式图片, 图片缩放
            Image($r('app.media.leaf'))
              .width(this.iconSize).height(this.iconSize).margin(15)
              .overlay('', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
              .animation({
                duration: 2000,
                tempo: 3.0,
                delay:0,
                curve: Curve.Linear,
                playMode: PlayMode.Alternate,
                iterations: -1
              })
              .onAppear(() => { this.iconSize = 110})


            // 加载gif格式图片
            Image($r('app.media.cow'))
              .width(110).height(110).margin(15)
              .overlay('gif', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          }

          Row() {
            // 加载svg格式图片，图片旋转动画
            Image($r('app.media.down_arrow'))
              .width(110).height(110).margin(15)
              .overlay('', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
              .rotate({ angle: this.rotateAngle })
              .animation({
                duration: 1000,
                iterations: -1,
                curve: Curve.EaseInOut,
                playMode: PlayMode.Normal
              })
              .onAppear(() => { this.rotateAngle = 360 })

            // 加载jpg格式图片
            Image($r('app.media.favor_filled'))
              .width(110).height(110).margin(15)
              .overlay('jpg', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
          }

          //加载网络图片，使用alt，在网络图片加载成功前使用占位图
          Image("https://developer.huawei.com/allianceCmsResource/resource/HUAWEI_Developer_VUE/images/HW-LOGO.svg")
            .alt($r('app.media.icon'))
            .width(CM.Co.FULL_PARENT)
            .height(80)


        }
        .width(CM.Co.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}