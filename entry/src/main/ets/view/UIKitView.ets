import CC from '../common/CConstants'
import TextCommonWidget from './TextCommonWidget'
import mainViewModel from '../viewmodel/MainViewModel'
import ItemModel from '../viewmodel/ItemDataModel'
import Utils from  '../common/FWUtils'
import router from '@ohos.router';
import Log from '../common/FWLog'

@Component
export default struct UIKitView {

  build() {
    Scroll() {

      Column({space: CC.SPACE}){

        Column(){
          Text("UIKit")
            .fontWeight(FontWeight.Medium)
            .fontSize(CC.vp(24))
            .padding({ top: CC.SPACE, bottom: CC.SPACE })
        }
        .width(CC.FULL_PARENT)
        .alignItems(HorizontalAlign.Center)

        List() {

          ForEach(mainViewModel.getUIKitData(), (item: ItemModel) => {

            ListItem(){
              TextCommonWidget({
                textImage:item.img,
                title: item.title,
                onItemClick: () => {

                  let url = ''
                  if ('基本语法' === item.title) {
                    url = 'pages/FwBasicGrammarPage'
                  }

                  Log.debug('Push Page:' + url)

                  if (url.length > 0) {
                    router.pushUrl({
                      url: url,
                      params: {
                        src: 'page params'
                      }
                    }).catch((error: Error) => {
                      Log.error('IndexPage push error' + JSON.stringify(error) + ', URL:' + url);
                    })
                  }

                }
              })
            }

          }, (item: ItemModel) => JSON.stringify(item))

        }
        .backgroundColor('#F5F5F5')
        .width(CC.FULL_PARENT)
        .padding({top: CC.vp(5), bottom: CC.vp(5)})
        .margin({ bottom: CC.BAR_HEIGHT })

      }
      .height(CC.FULL_PARENT)

    }

  }
}