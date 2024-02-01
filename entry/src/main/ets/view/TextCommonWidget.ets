import CC from '../common/CConstants'
import Utils from '../common/CCUtils'

/*
定义组件的没一项
 */
@Component
export default struct TextCommonWidget {

  private textImage?: Resource
  private title?:string
  onItemClick = () => {}

  build() {
    Row(){
      Image(this.textImage !== undefined ? this.textImage : '')
        .width(Utils.vp(24))
        .height(Utils.vp(24))
        .margin({left: Utils.vp(12)})

      Text(this.title)
        .fontSize(Utils.vp(16))
        .margin({left: Utils.vp(12)})
        .height(CC.FULL_PARENT)
        .maxLines(1)
          //父容器尺寸确定时，设置了layoutWeight属性的子元素与兄弟元素占主轴尺寸按照权重进行分配,
          // 权重1，占主轴剩余空间1/3
        .layoutWeight(1)

      Image($r('app.media.right_grey'))
        .width(Utils.vp(12))
        .height(Utils.vp(24))
        .margin({right: Utils.vp(14)})
    }
    .margin({top:Utils.vp(12), left: CC.SPACE, right: CC.SPACE})
    .borderRadius(Utils.vp(8))
    .backgroundColor(Color.White)
    .height(Utils.vp(64))
    .onClick(this.onItemClick)
  }
}