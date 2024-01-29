import router from '@ohos.router';
import CC from '../../common/CConstants'
import Log from '../../common/FWLog'
import BaseNaView from '../../view/BaseNavigationView'
import Person from '../../viewmodel/Person'

/**
 * 语法基本页面
 */
@Entry
@Component
struct FwBasicGrammarPage {

  // 获取前一个页面的参数
  @State params: string = (router.getParams() as Record<string, string>)['src']

  // 类、方法，类似Web中JavaScript，只允许在属性、生命周期方法、事件、循环容器中使用
  private personInfo:string = Person.getPersonInfo()

  aboutToAppear() {
    Log.debug("aboutToAppear" + this.personInfo)
  }

  aboutToDisappear() {
    Log.debug("aboutToDisappear")
  }

  onPageShow(){
    Log.debug("onPageShow")
  }

  onPageHide() {
    Log.debug("onPageHide")
  }

  onBackPress() {
    Log.debug("onBackPress")
  }

  @Builder componentBuilder() {

    Button('OK', { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .width(90)
      .onClick(() => {
        Log.debug("Person" + this.personInfo)
      })

  }

  // UI组件，类似与Web中Html页面，
  build() {
    Scroll(){
      BaseNaView({title: '基本语法'}){

        Column({ space: 10 }) {
          this.componentBuilder()
        }
        .width(CC.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })
      }
    }

  }
}
