import router from '@ohos.router';
import CM from '../common/CCommon'
import TextCommonWidget from './TextCommonWidget'
import mainViewModel from '../viewmodel/MainViewModel'
import ItemModel from '../viewmodel/ItemDataModel'
import TitleBarComponent from '../view/TitleBarComponent';

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
                    url = 'pages/uikit/FwBasicGrammarPage'
                  } else if ('页面布局，容器' == item.title) {
                    url = 'pages/uikit/FwContainerDemoPage'
                  } else if ('UI组件：Text' == item.title) {
                    url = 'pages/uikit/FwTextDemoPage'
                  } else if ('UI组件：TextArea' == item.title) {
                    url = 'pages/uikit/FwTextAreaDemoPage'
                  } else if ('UI组件：Image' == item.title) {
                    url = 'pages/uikit/FwImageDemoPage'
                  } else if ('UI组件：TextInput' == item.title) {
                    url = 'pages/uikit/FwTextInputDemoPage'
                  } else if ('UI组件：Button' == item.title) {
                    url = 'pages/uikit/FwButtonDemoPage'
                  } else if ('UI组件：LoadingProgress' == item.title) {
                    url = 'pages/uikit/FwProgressDemoPage'
                  } else if ('UI组件：List' == item.title) {
                    url = 'pages/uikit/FwListDemoPage'
                  } else if ('UI组件：Grid' == item.title) {
                    url = 'pages/uikit/FwGridDemoPage'
                  } else if ('UI组件：Swiper' == item.title) {
                    url = 'pages/uikit/FwSwiperDemoPage'
                  } else if ('Web组件' == item.title) {
                    url = 'pages/uikit/FwWebComponentPage'
                  } else if ('网络请求' == item.title) {
                    url = 'pages/uikit/FwNetWorkDemoPage'
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