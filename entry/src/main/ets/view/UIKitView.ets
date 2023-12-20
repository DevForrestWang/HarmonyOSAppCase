import CC from '../common/constants/CConstants'
import TextCommonWidget from './TextCommonWidget'

@Component
export default struct UIKitView {

  build() {
    Column(){
      TextCommonWidget({
        textImage:$r('app.media.about'),
        title: 'Item',
        onItemClick: () => {
        }
      })
    }
      .width(CC.FULL_PARENT)
      .height(CC.FULL_PARENT)
      .backgroundColor('#F5F5F5')
  }
}