import CC from '../common/CConstants'
import TextCommonWidget from './TextCommonWidget'
import mainViewModel from '../viewmodel/MainViewModel'
import ItemModel from '../viewmodel/ItemDataModel'


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
                  console.log('xxxx')
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