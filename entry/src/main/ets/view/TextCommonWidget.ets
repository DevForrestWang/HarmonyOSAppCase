import CC from '../common/constants/CConstants'

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
        .width(CC.vp(24))
        .height(CC.vp(24))
        .margin({left: CC.vp(12)})

      Text(this.title)
        .fontSize(CC.vp(16))
        .margin({left: CC.vp(12)})
        .height(CC.FULL_PARENT)

      Image(CC.img('right_grey'))
        .width(CC.vp(12))
        .height(CC.vp(24))
        .margin(CC.vp(14))
    }
    .margin({top:CC.vp(24)})
    .borderRadius(CC.vp(24))
    .backgroundColor(Color.White)
    .width('93.3%')
    .height(CC.vp(64))
    .onClick(this.onItemClick)
  }
}