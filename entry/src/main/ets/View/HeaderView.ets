import router from '@ohos.router';
import CM from '../Common/CCommon'

/// 页面导航栏
@Component
export struct HeaderView {
	private title: ResourceStr
	@State params: any = router.getParams()

	build() {

		Row({space: 5}) {
			Image($r('app.media.ic_public_back'))
			.width(CM.Utils.vp(44))
				.height(CM.Utils.vp(44))
				.onClick(() => {
					router.back()
				})

			Text(this.title)
				.fontSize(CM.Utils.vp(28))
				.fontWeight(FontWeight.Bold)
		}
		.height(CM.Co.BAR_HEIGHT)
		.width(CM.Co.FULL_PARENT)
		.backgroundColor(Color.Green)

	}

}