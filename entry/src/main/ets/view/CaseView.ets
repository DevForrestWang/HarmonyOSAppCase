import CConstants from '../common/constants/CConstants'

@Component
export default struct CaseView {

  build() {
    Column()
      .width(CConstants.FULL_PARENT)
      .height(CConstants.FULL_PARENT)
      .backgroundColor(Color.Red)
  }
}