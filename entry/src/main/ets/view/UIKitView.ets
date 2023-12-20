import CConstants from '../common/constants/CConstants'

@Component
export default struct UIKitView {

  build() {
    Column()
      .width(CConstants.FULL_PARENT)
      .height(CConstants.FULL_PARENT)
      .backgroundColor(Color.Orange)
  }
}