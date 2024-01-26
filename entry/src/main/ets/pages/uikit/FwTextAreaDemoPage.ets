import CC from '../../common/CConstants'
import BaseNaView from '../../view/BaseNavigationView'

/// UI组件：TextArea
@Entry
@Component
struct FwTextAreaDemoPage {
  @State text: string = ''

  // 通过它设置TextArea组件的光标位置。
  controller: TextAreaController = new TextAreaController()

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：TextArea'}){

        Column({ space: 10 }) {

          Text('Please enter content:')
            .textAlign(TextAlign.Start)
            .width(CC.FULL_PARENT)

          // 问题：文本过长时,无法滚动
          TextArea({
            placeholder: 'The text area can hold an unlimited amount of text. input your word...',
            controller: this.controller,
            //text: ''
          })
            .placeholderFont({ size: 16, weight: 400 })
            .width(CC.FULL_PARENT)
            .height(100)
            .margin({bottom: 10})
            .fontSize(16)
            .fontColor('#182431')
            .backgroundColor('#FFFFFF')
            .borderRadius(8)
            .onChange((value: string) => {
              this.text = value
            })

          Text('Input: ' + this.text)
            .textAlign(TextAlign.Start)
            .width(CC.FULL_PARENT)

          Button('Set caretPosition 1')
            .backgroundColor('#007DFF')
            .margin(15)
            .onClick(() => {
              // 设置光标位置到第一个字符后
              this.controller.caretPosition(1)
            })

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 20, right: 20, top: 20 })
        .backgroundColor('#F1F3F5')

      }
    }

  }
}