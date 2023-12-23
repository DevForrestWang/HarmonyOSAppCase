import CC from '../common/CConstants'
import TextCommonWidget from './TextCommonWidget'
import Log from '../common/FWLog'
import Utils from  '../common/FWUtils'

@Component
export default struct CaseView {

  build() {

    Scroll(){

      Column({space: CC.SPACE}) {

        // 导航栏
        Column() {
          Text('Case')
            .fontWeight(FontWeight.Medium)
            .fontColor(CC.vp(24))
            .padding({top: CC.SPACE, bottom: CC.SPACE})
        }
        .width(CC.FULL_PARENT)
        .alignItems(HorizontalAlign.Center)

        Column(){

          TextCommonWidget({
            title: 'TestTitle',
            textImage: $r('app.media.storage'),
            onItemClick: () => {
              Log.debug("debug test log")
              Log.info("info test log")
              Log.error("error test log")

              Utils.toast("吐司测试")

              Log.debug(`heitht: ${CC.screenHeight()}`)
              Log.debug(`heitht/2: ${CC.screenHeight() / 2}`)
              Log.debug(`weight: ${CC.screenWeight()}`)
            }

          })

        }
        .width(CC.FULL_PARENT)
        .height(CC.FULL_PARENT)
        .margin({bottom: CC.BAR_HEIGHT})
        .padding({top: CC.vp(5), bottom: CC.vp(5)})
        .backgroundColor(Color.Orange)

      }
      .height(CC.FULL_PARENT)

    }

  }




}