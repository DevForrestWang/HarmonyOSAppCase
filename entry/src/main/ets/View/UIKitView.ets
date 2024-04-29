import router from '@ohos.router';
import CM from '../Common/CCommon'
import TextCommonWidget from './TextCommonWidget'
import mainViewModel from '../ViewModel/MainViewModel'
import ItemModel from '../ViewModel/ItemDataModel'
import TitleBarComponent from './/TitleBarComponent'

@Preview
@Component
export default struct UIKitView {

  build() {
    Scroll() {

      Column({space: CM.Co.SPACE}){

        TitleBarComponent({ isBack: false, title: 'UIKit' })

        List() {

          ForEach(mainViewModel.getUIKitData(), (item: ItemModel) => {

            ListItem(){
              TextCommonWidget({
                textImage:item.img,
                title: item.title,
                onItemClick: () => {

                  let url = ''
                  if ('基本语法' === item.title) {
                    url = 'Pages/UiKit/FwBasicGrammarPage'
                  } else if ('页面布局，容器' == item.title) {
                    url = 'Pages/UiKit/FwContainerDemoPage'
                  } else if ('UI组件：Text' == item.title) {
                    url = 'Pages/UiKit/FwTextDemoPage'
                  } else if ('UI组件：TextArea' == item.title) {
                    url = 'Pages/UiKit/FwTextAreaDemoPage'
                  } else if ('UI组件：Image' == item.title) {
                    url = 'Pages/UiKit/FwImageDemoPage'
                  } else if ('UI组件：TextInput' == item.title) {
                    url = 'Pages/UiKit/FwTextInputDemoPage'
                  } else if ('UI组件：Button' == item.title) {
                    url = 'Pages/UiKit/FwButtonDemoPage'
                  } else if ('UI组件：LoadingProgress' == item.title) {
                    url = 'Pages/UiKit/FwProgressDemoPage'
                  } else if ('UI组件：List' == item.title) {
                    url = 'Pages/UiKit/FwListDemoPage'
                  } else if ('UI组件：Grid' == item.title) {
                    url = 'Pages/UiKit/FwGridDemoPage'
                  } else if ('UI组件：Swiper' == item.title) {
                    url = 'Pages/UiKit/FwSwiperDemoPage'
                  } else if ('Web组件' == item.title) {
                    url = 'Pages/UiKit/FwWebComponentPage'
                  }

                  CM.Logger.debug('Push Page:' + url)

                  if (url.length > 0) {
                    router.pushUrl({
                      url: url,
                      params: {
                        src: 'page params'
                      }
                    }).catch((error: Error) => {
                      CM.Logger.error('IndexPage push error' + JSON.stringify(error) + ', URL:' + url);
                    })
                  }

                }
              })
            }

          }, (item: ItemModel) => JSON.stringify(item))

        }
        .backgroundColor('#F5F5F5')
        .width(CM.Co.FULL_PARENT)
        .padding({top: CM.Utils.vp(5), bottom: CM.Utils.vp(5)})
        .margin({ bottom: CM.Co.BAR_HEIGHT })

      }
      .height(CM.Co.FULL_PARENT)

    }

  }
}