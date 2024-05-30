import router from '@ohos.router';
import CM from '../../Common/CCommon'
import BaseNaView from '../../View/BaseNavigationView'
import { pi, runAllMethod, Person, Student } from '../../ViewModel/Person'

/**
 * 语法基本页面
 */
@Entry
@Component
struct FwBasicGrammarPage {

  // 获取前一个页面的参数
  @State params: string = (router.getParams() as Record<string, string>)['src']

  // 类、方法，类似Web中JavaScript，只允许在属性、生命周期方法、事件、循环容器中使用
  private student:Student = new Student('Jack')

  aboutToAppear() {
    CM.Logger.debug("aboutToAppear")

    CM.Logger.debug('pi:' + pi)
    runAllMethod()
    CM.Logger.debug("student: getPersonInfo" + this.student.getPersonInfo())
    this.student.tomObj.sayHello()
    this.student.sayHelloToTeacher(new Person("Tom", 30))
  }

  aboutToDisappear() {
    CM.Logger.debug("aboutToDisappear")
  }

  onPageShow(){
    CM.Logger.debug("onPageShow")
  }

  onPageHide() {
    CM.Logger.debug("onPageHide")
  }

  onBackPress() {
    CM.Logger.debug("onBackPress")
  }

  @Builder componentBuilder() {

    Button(this.student.name, { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .width(90)
      .onClick(() => {
        CM.Utils.toast("Person" + this.student.getPersonInfo())
      })

  }

  // UI组件，声明式的方式来描述UI的结构，类似与Web中Html页面，在内部key进行页面布局描述
  build() {
    Scroll(){
      BaseNaView({title: '基本语法'}){

        Column({ space: 10 }) {
          this.componentBuilder()
        }
        .width(CM.Co.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })
      }
    }

  }
}
