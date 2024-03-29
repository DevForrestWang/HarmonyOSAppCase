import CM from '../../common/CCommon'
import BaseNaView from '../../view/BaseNavigationView'

/// 下载页面，验证通知使用
@Entry
@Component
struct DownloadPage {
  @State message: string = 'DownLoad Page'

  build() {

    Column() {
      BaseNaView({ title: '下载页面' }) {

        Text(this.message)
          .fontSize(25)
          .fontWeight(FontWeight.Bold)

      }
    }
  }

}