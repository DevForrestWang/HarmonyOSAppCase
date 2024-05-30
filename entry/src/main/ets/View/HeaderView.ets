import router from '@ohos.router';
import CM from '../Common/CCommon'

/// 页面导航栏
@Component
export struct HeaderView {
	private title: ResourceStr
	private rightBtnName: Resource
	rightAction: () => void
	@State params: any = router.getParams()

	build() {

		Column() {
			Row({ space: 5 }) {
				Image($r('app.media.ic_public_back'))
					.width(CM.Utils.vp(22))
					.height(CM.Utils.vp(22))
					.margin({ left: CM.Utils.vp(20) })
					.onClick(() => {
						router.back()
					})

				Text(this.title)
					.fontSize(CM.Utils.vp(24))
					.fontWeight(FontWeight.Medium)
					.textAlign(TextAlign.Center)
					.size({ width: '60%' })

				Image(this.rightBtnName)
					.width(CM.Utils.vp(22))
					.height(CM.Utils.vp(22))
					.margin({ right: CM.Utils.vp(20) })
					.onClick(() => {
						if (this.rightBtnName != null) {
							this.rightAction()
						}
					})

			}
			.justifyContent(FlexAlign.SpaceBetween)
			.height(CM.Co.BAR_HEIGHT)
			.width(CM.Co.FULL_PARENT)
			.backgroundColor('#F1F3F5')

			Divider()
		}

	}
}