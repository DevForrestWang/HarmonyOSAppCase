import lottie, { AnimationItem } from '@ohos/lottie'
import CM from '../../common/CCommon'
import BaseNaView from '../../view/BaseNavigationView'

@Entry
@Component
struct LottieDemoPage {
  private renderingSettings: RenderingContextSettings = new RenderingContextSettings(true)
  private renderingContext: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.renderingSettings)
  private animateName: string = 'data'
  private animateItem: AnimationItem | null = null
  @State canvasTitle: string | undefined = undefined


  aboutToAppear(): void {
    CM.Logger.info('aboutToDisappear')
    lottie.destroy()
  }

  onPageShow(): void {
    CM.Logger.info('onPageShow')
    lottie.play()
  }

  onPageHide(): void {
    CM.Logger.info('onPageHide')
    lottie.pause()
  }

  build() {

    Column() {
      BaseNaView({ title: '使用lottie库' }) {

        Flex({direction: FlexDirection.Column, justifyContent: FlexAlign.SpaceBetween}){

          // Canvas area
          Column() {
            Canvas(this.renderingContext)
              .width(CM.Co.FULL_PARENT)
              .aspectRatio(1.76)
              .backgroundImage($r('app.media.canvasBg'))
              .backgroundImageSize(ImageSize.Cover)
              .onDisAppear(() => {
                lottie.destroy(this.animateName);
              })

            Text(this.canvasTitle)
              .width(CM.Co.FULL_PARENT)
              .fontSize(CM.Utils.vp(14))
              .textAlign(TextAlign.Center)
              .fontWeight(FontWeight.Bold)
              .fontColor('#182431')
              .margin({ top: CM.Utils.vp(12)})
              .opacity(0.4)
          }
          .margin({
            top: CM.Utils.vp(10),
            left: CM.Utils.vp(10),
            right: CM.Utils.vp(10)
          })

          // Buttons area
          Column({ space: 12 }) {
            Button() {
              Text('加载动画')
                .fontSize(CM.Utils.vp(16))
                .fontColor('#007DFF')
                .fontWeight(FontWeight.Bold)
            }
            .width(CM.Co.FULL_PARENT)
            .height(CM.Utils.vp(40))
            .backgroundColor('#dedbdb')
            .onClick(() => {
              if (this.animateItem !== null) {
                this.animateItem.destroy()
                this.animateItem = null
              }
              this.canvasTitle = '加载动画'
              this.animateItem = lottie.loadAnimation({
                container: this.renderingContext,
                renderer: 'canvas',
                loop: true,
                autoplay: true,
                name: this.animateName,
                path: 'pages/Case/lottie/startData.json'
              })
            })

            Button() {
              Text('结束并回到第0帧')
                .fontSize(CM.Utils.vp(16))
                .fontColor('#007DFF')
                .fontWeight(FontWeight.Bold)
            }
            .width(CM.Co.FULL_PARENT)
            .height(CM.Utils.vp(40))
            .backgroundColor('#dedbdb')
            .onClick(() => {
              if (this.animateItem === null) return
              this.canvasTitle = '结束并回到第0帧'
              this.animateItem.goToAndPlay(0, true)
            })

            Flex({ justifyContent: FlexAlign.SpaceBetween }) {
              Button() {
                Text('播放')
                  .fontSize(CM.Utils.vp(16))
                  .fontColor('#007DFF')
                  .fontWeight(FontWeight.Bold)
              }
              .width(CM.Co.FULL_PARENT)
              .height(CM.Utils.vp(40))
              .backgroundColor('#dedbdb')
              .onClick(() => {
                if (this.animateItem === null) return
                this.canvasTitle = '播放'
                lottie.play()
              })

              Button() {
                Text('暂停')
                  .fontSize(CM.Utils.vp(16))
                  .fontColor('#007DFF')
                  .fontWeight(FontWeight.Bold)
              }
              .width('49%')
              .height(CM.Utils.vp(40))
              .backgroundColor('#dedbdb')
              .onClick(() => {
                if (this.animateItem === null) return
                this.canvasTitle = '暂停'
                lottie.pause()
              })
            }
          }
          .padding({
            left: CM.Utils.vp(23),
            right: CM.Utils.vp(23),
            bottom: CM.Utils.vp(40)
          })

        }
        .height(CM.Co.FULL_PARENT)
      }
    }
    .height(CM.Co.FULL_PARENT)
    .layoutWeight(CM.Co.FULL_PARENT)
    .backgroundColor('#F1F3F5')

  }
}