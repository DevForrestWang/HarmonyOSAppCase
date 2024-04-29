import CM from '../../Common/CCommon'
import BaseNaView from '../../View/BaseNavigationView'

/// UI组件：Button
@Entry
@Component
struct FwButtonDemoPage {
  @State message: string = 'Hello World'

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：Button'}){

        Column({ space: 20 }) {

          Text('Normal button').fontSize(14).fontColor(Color.Black)
          Button('OK', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(90)
            .onClick(() => {
              CM.Utils.toast('ButtonType.Normal')
            })

          Button({ type: ButtonType.Normal, stateEffect: true }) {
            Row() {
              LoadingProgress()
                .width(20)
                .height(20)
                .margin({ left: 12 })
                .color(0xFFFFFF)
              Text('loading')
                .fontSize(12)
                .fontColor(0xffffff)
                .margin({ left: 5, right: 12 })
            }.alignItems(VerticalAlign.Center)
          }
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(90)
          .height(40)
          .onClick(() => {
            CM.Utils.toast('ButtonType.Normal with row')
          })

          Button('Disable', { type: ButtonType.Normal, /* stateEffect: false */ })
            //.opacity(0.4)
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(90)
            .enabled(false) //
            .onClick(() => {
              CM.Utils.toast('ButtonType.Normal Disable')
            })


          Text('Capsule button').fontSize(14).fontColor(Color.Black)
          Button('OK', { type: ButtonType.Capsule, stateEffect: true })
            .backgroundColor(0x317aff)
            .width(90)


          Text('Circle button').fontSize(14).fontColor(Color.Black)
          Button({ type: ButtonType.Circle, stateEffect: true }) {
            LoadingProgress()
              .width(20)
              .height(20)
              .color(0xFFFFFF)
          }
          .width(55)
          .height(55)
          .margin({ left: 20 })
          .backgroundColor(0xF55A42)

          Text('单选框').fontSize(14).fontColor(Color.Black)
          Row() {
            Radio({ value: 'Radio1', group: 'radioGroup' })
              .checked(false)
              .width(CM.Utils.vp(30))
              .height(CM.Utils.vp(30))
            Radio({ value: 'Radio2', group: 'radioGroup' })
              .checked(true)
              .width(CM.Utils.vp(30))
              .height(CM.Utils.vp(30))
          }.alignItems(VerticalAlign.Center)


          Text('切换按钮').fontSize(14).fontColor(Color.Black)
          Row() {
            Toggle({ type: ToggleType.Checkbox, isOn: false })
              .width(CM.Utils.vp(30))
              .height(CM.Utils.vp(30))
            Toggle({ type: ToggleType.Checkbox, isOn: true })
              .width(CM.Utils.vp(30))
              .height(CM.Utils.vp(30))
          }.alignItems(VerticalAlign.Center)


        }
        .width(CM.Co.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}