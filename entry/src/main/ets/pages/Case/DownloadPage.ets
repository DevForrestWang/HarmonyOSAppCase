import common from '@ohos.app.ability.common';
import notification from '@ohos.notificationManager';
import { WantAgent } from '@ohos.app.ability.wantAgent';

import CM from '../../common/CCommon'
import BaseNaView from '../../view/BaseNavigationView'

/**
 * Download status.
 */
export enum DOWNLOAD_STATUS {
  INITIAL,
  DOWNLOADING,
  PAUSE,
  FINISHED
}

@Extend(Button)
function buttonStyle() {
  .constraintSize({ minWidth: CM.Utils.vp(72) })
  .height(CM.Utils.vp(28))
  .borderRadius(CM.Utils.vp(14))
  .fontSize(CM.Utils.vp(12))
}

/// 下载页面，验证通知使用
@Entry
@Component
struct DownloadPage {
  @State downloadStatus: number = DOWNLOAD_STATUS.INITIAL;
  @State downloadProgress: number = 0;
  private context = getContext(this) as common.UIAbilityContext;
  private isSupport: boolean = true;
  private notificationTitle: string = '';
  private wantAgentObj: WantAgent = new Object();
  private interval: number = -1;

  private NOTIFICATION_ID: number = 1000
  private UPDATE_FREQUENCY: number = 1000
  private PROGRESS_SPEED: number = 2
  private PROGRESS_TOTAL: number = 100
  private FONT_OPACITY: number = 0.6

  aboutToAppear() {
    CM.openNotificationPermission();
    let bundleName = this.context.abilityInfo.bundleName;
    let abilityName = this.context.abilityInfo.name;
    CM.createWantAgent(bundleName, abilityName).then(want => {
      this.wantAgentObj = want;
    }).catch((err: Error) => {
      CM.Logger.error(`getWantAgent fail, err: ${JSON.stringify(err)}`);
    });
    notification.isSupportTemplate('downloadTemplate').then(isSupport => {
      if (!isSupport) {
        CM.Utils.toast('The function is not implemented')
      }
      this.isSupport = isSupport;
    });
  }

  onBackPress() {
    this.cancel();
  }

  build() {

    Column() {
      BaseNaView({ title: '下载页面' }) {


        Row() {
          Column() {
            Image($r('app.media.ic_image'))
              .objectFit(ImageFit.Fill)
              .width(CM.Utils.vp(48))
              .height(CM.Utils.vp(48))
          }
          .layoutWeight(1)
          .height(CM.Co.FULL_PARENT)
          .alignItems(HorizontalAlign.Start)

          Column() {
            Row() {
              Text('1653067.mp4')
                .fontSize(CM.Utils.vp(16))
                .textAlign(TextAlign.Center)
                .fontWeight(500)
                .lineHeight(CM.Utils.vp(16))
              Text(`${this.downloadProgress}%`)
                .fontSize(CM.Utils.vp(14))
                .lineHeight(CM.Utils.vp(16))
                .opacity(this.FONT_OPACITY)
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .width(CM.Co.FULL_PARENT)

            Progress({
              value: this.downloadProgress,
              total: this.PROGRESS_TOTAL
            })
              .width(CM.Co.FULL_PARENT)
            Row() {
              Text('25.01MB')
                .fontSize(CM.Utils.vp(14))
                .lineHeight(CM.Utils.vp(16))
                .opacity(this.FONT_OPACITY)
              if (this.downloadStatus === DOWNLOAD_STATUS.INITIAL) {
              this.customButton('DownLoad', ()=> this.start())
            } else if (this.downloadStatus === DOWNLOAD_STATUS.DOWNLOADING) {
                Row() {
                this.cancelButton()
                this.customButton('Pause', ()=> this.pause())
              }
              } else if (this.downloadStatus === DOWNLOAD_STATUS.PAUSE) {
                Row() {
                this.cancelButton()
                this.customButton('Resume', ()=> this.resume())
              }
              } else {
              this.customButton('Open', ()=> this.open())
            }
            }
            .width(CM.Co.FULL_PARENT)
            .justifyContent(FlexAlign.SpaceBetween)
          }
          .layoutWeight(5)
          .height(CM.Co.FULL_PARENT)
          .justifyContent(FlexAlign.SpaceBetween)
        }
        .width('93.3%')
        .height(CM.Utils.vp(108))
        .backgroundColor(Color.White)
        .borderRadius(CM.Utils.vp(16))
        .justifyContent(FlexAlign.SpaceBetween)
        .padding(CM.Utils.vp(16))


      }
    }
    .height(CM.Co.FULL_PARENT)
    .layoutWeight(CM.Co.FULL_PARENT)
    .backgroundColor('#F1F3F5')

  }

  /**
   * Start the timer and send notification.
   */
  download() {
    this.interval = setInterval(async () => {
      if (this.downloadProgress === this.PROGRESS_TOTAL) {
        this.notificationTitle = await CM.getStringByRes($r('app.string.notification_title_finish'), this);
        this.downloadStatus = DOWNLOAD_STATUS.FINISHED;
        clearInterval(this.interval);
      } else {
        this.downloadProgress += this.PROGRESS_SPEED;
      }
      if (this.isSupport) {
        CM.publishNotification(this.downloadProgress, this.notificationTitle, this.wantAgentObj);
      }
    }, this.UPDATE_FREQUENCY);
  }

  /**
   * Click to download.
   */
  async start() {
    this.notificationTitle = await CM.getStringByRes($r('app.string.notification_title_download'), this);
    this.downloadStatus = DOWNLOAD_STATUS.DOWNLOADING;
    this.downloadProgress = 0;
    this.download();
  }

  /**
   * Click pause.
   */
  async pause() {
    this.notificationTitle = await CM.getStringByRes($r('app.string.notification_title_pause'), this);
    clearInterval(this.interval);
    this.downloadStatus = DOWNLOAD_STATUS.PAUSE;
    if (this.isSupport) {
      CM.publishNotification(this.downloadProgress, this.notificationTitle, this.wantAgentObj);
    }
  }

  /**
   * Click resume.
   */
  async resume() {
    this.notificationTitle = await CM.getStringByRes($r('app.string.notification_title_download'), this);
    this.download();
    this.downloadStatus = DOWNLOAD_STATUS.DOWNLOADING;
  }


  /**
   * Click cancel.
   */
  async cancel() {
    this.downloadProgress = 0;
    clearInterval(this.interval);
    this.downloadStatus = DOWNLOAD_STATUS.INITIAL;
    notification.cancel(this.NOTIFICATION_ID);
  }

  /**
   * Open file
   */
  open() {
    CM.Utils.toast('The function is not implemented')
  }

  @Builder
  customButton(textResource: Resource | string, click: Function = () => {
  }) {
    Button(textResource)
      .backgroundColor('#0A59F7')
      .buttonStyle()
      .onClick(() => {
        click();
      })
  }

  @Builder
  cancelButton() {
    Button('Cancel')
      .buttonStyle()
      .backgroundColor('#0D000000')
      .fontColor('#0A59F7')
      .margin({ right: CM.Utils.vp(8) })
      .onClick(() => {
        this.cancel();
      })
  }

}