import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// UI组件：TextInput
@Entry
@Component
struct FwTextInputDemoPage {
  @State text: string = ''

  controller: TextInputController = new TextInputController()

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：TextInput'}){

        Column({ space: 10 }) {

          TextInput({ text: this.text, placeholder: 'Input your word...', controller: this.controller })
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .caretColor(Color.Blue)
            .width(CC.FULL_PARENT)
            .height(40)
            .margin(20)
            .fontSize(14)
            .fontColor(Color.Black)
            .borderRadius(8)
            .inputFilter('[a-z]', (e) => {
              console.log(JSON.stringify(e))
            })
            .onChange((value: string) => {
              this.text = value
            })

          Text('Input Value:' + this.text)
          Button('Set caretPosition 1')
            .margin(15)
            .onClick(() => {
              // 将光标移动至第一个字符后
              this.controller.caretPosition(1)
            })

          // 密码输入框
          TextInput({ placeholder: 'Input your password...' })
            .width(CC.FULL_PARENT)
            .height(40)
            .margin(20)
            .type(InputType.Password)
            .maxLength(8)
            .borderRadius(8)
            .showPasswordIcon(true)

          // 内联风格输入框
          TextInput({ placeholder: 'Inline style' })
            .width(CC.FULL_PARENT)
            .height(50)
            .margin(20)
            .borderRadius(0)
            .style(TextInputStyle.Inline)

        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}