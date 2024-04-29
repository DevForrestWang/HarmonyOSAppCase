import router from '@ohos.router';
import CM from '../Common/CCommon'
import TextCommonWidget from './TextCommonWidget'
import mainViewModel from '../ViewModel/MainViewModel'
import ItemModel from '../ViewModel/ItemDataModel'
import TitleBarComponent from './/TitleBarComponent'

@Preview
@Component
export default struct UIKitView {
	build() {
		Scroll() {

			Column({ space: CM.Co.SPACE }) {

				TitleBarComponent({ isBack: false, title: 'UIKit' })

				List() {

					ForEach(mainViewModel.getUIKitData(), (item: ItemModel) => {

						ListItem() {
							TextCommonWidget({
								textImage: item.img,
								title: item.title,
								onItemClick: () => {
									let url = this.getPageRoute(item)
									CM.Logger.debug('Push Page:' + url)
									if (url.length > 0) {
										router.pushUrl({
											url: url,
											params: {
												src: 'page params'
											}
										}).catch((error: Error) => {
											CM.Logger.error('IndexPage push error' + JSON.stringify(error) + ', URL:' + url);
										})
									}

								}
							})
						}

					}, (item: ItemModel) => JSON.stringify(item))

				}
				.backgroundColor('#F5F5F5')
				.width(CM.Co.FULL_PARENT)
				.padding({ top: CM.Utils.vp(5), bottom: CM.Utils.vp(5) })
				.margin({ bottom: CM.Co.BAR_HEIGHT })

			}
			.height(CM.Co.FULL_PARENT)

		}
	}

	/// 获取页面跳转地址
	getPageRoute(item: ItemModel): string {
		let url = ''
		if ('grammar' === item.key) {
			url = 'Pages/UiKit/FwBasicGrammarPage'
		} else if ('layout' == item.key) {
			url = 'Pages/UiKit/FwContainerDemoPage'
		} else if ('uiText' == item.key) {
			url = 'Pages/UiKit/FwTextDemoPage'
		} else if ('uiTextArea' == item.key) {
			url = 'Pages/UiKit/FwTextAreaDemoPage'
		} else if ('uiImage' == item.key) {
			url = 'Pages/UiKit/FwImageDemoPage'
		} else if ('uiTextInput' == item.key) {
			url = 'Pages/UiKit/FwTextInputDemoPage'
		} else if ('uiButton' == item.key) {
			url = 'Pages/UiKit/FwButtonDemoPage'
		} else if ('uiProgress' == item.key) {
			url = 'Pages/UiKit/FwProgressDemoPage'
		} else if ('uiList' == item.key) {
			url = 'Pages/UiKit/FwListDemoPage'
		} else if ('uiGrid' == item.key) {
			url = 'Pages/UiKit/FwGridDemoPage'
		} else if ('uiSwiper' == item.key) {
			url = 'Pages/UiKit/FwSwiperDemoPage'
		} else if ('uiWeb' == item.key) {
			url = 'Pages/UiKit/FwWebComponentPage'
		}

		return url
	}
}