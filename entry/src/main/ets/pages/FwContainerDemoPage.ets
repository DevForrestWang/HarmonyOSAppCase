import CC from '../common/CConstants'
import BaseNaView from '../view/BaseNavigationView'

/// 页面布局，容器
/// 参考资料：https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-flex-layout-0000001504525013-V3
@Entry
@Component
struct FwContainerDemoPage {

  build() {

    Column(){
      BaseNaView({title: '页面布局，容器'}){

        Text('Flex 布局:')
          .width('90%')
          .height(30)
        // Flex主轴方向元素等间距布局，相邻子组件之间的间距、第一个子组件与主轴起始端的间距、最后一个子组件到主轴终点端的间距均相等。
        Flex({ justifyContent: FlexAlign.SpaceEvenly  }) {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('20%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
          Text('3').width('20%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }
        .height(70)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
        .margin({top: CC.vp(10)})

        // 主轴为垂直方向，子组件从起始端沿着垂直方向开始排布。
        Flex({ direction: FlexDirection.Column }) {
          Text('1').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
          Text('2').width('100%').height(50).backgroundColor(0xD2B48C).textAlign(TextAlign.Center)
          Text('3').width('100%').height(50).backgroundColor(0xF5DEB3).textAlign(TextAlign.Center)
        }
        .height(210)
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
        .margin({top: CC.vp(20)})

        Text('Column 布局:')
          .width('90%')
          .height(30)
          .margin({top: CC.vp(30)})
        Column({ space: 20 }) {
          Row().width('90%').height(50).backgroundColor(0xF5DEB3)
          Row().width('90%').height(50).backgroundColor(0xD2B48C)
          Row().width('90%').height(50).backgroundColor(0xF5DEB3)
        }
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
        .margin({top: CC.vp(10)})

        Text('Row 布局:')
          .width('90%')
          .height(30)
          .margin({top: CC.vp(30)})
        Row({ space: 35 }) {
          Row().width('10%').height(150).backgroundColor(0xF5DEB3)
          Row().width('10%').height(150).backgroundColor(0xD2B48C)
          Row().width('10%').height(150).backgroundColor(0xF5DEB3)
        }
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
        .margin({top: CC.vp(10)})
      }

    }
  }
}