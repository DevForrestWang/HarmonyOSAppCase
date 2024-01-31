import router from '@ohos.router';
import CC from '../../common/CConstants'
import Log from '../../common/FWLog'
import BaseNaView from '../../view/BaseNavigationView'
import { pi, baseFunc, Person, Student } from '../../viewmodel/Person'
import Utils from  '../../common/FWUtils'

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
    Log.debug("aboutToAppear")

    Log.debug('pi:' + pi)
    baseFunc(5, 10)
    Log.debug("student: getPersonInfo" + this.student.getPersonInfo())
    this.student.tomObj.sayHello()
    this.student.sayHelloToTeacher(new Person("Tom", 30))
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

    Button(this.student.name, { type: ButtonType.Normal, stateEffect: true })
      .borderRadius(8)
      .backgroundColor(0x317aff)
      .width(90)
      .onClick(() => {
        Utils.toast("Person" + this.student.getPersonInfo())
      })

  }

  // UI组件，声明式的方式来描述UI的结构，类似与Web中Html页面，在内部key进行页面布局描述
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
