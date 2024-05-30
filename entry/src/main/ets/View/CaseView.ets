import router from '@ohos.router'
import type window from '@ohos.window'
import CM from '../Common/CCommon'
import TextCommonWidget from './TextCommonWidget'
import RefreshComponent from '../Component/PullRefresh/RefreshComponent'
import { RefreshHeaderStyle, RefreshState, RefreshConstants } from '../Component/PullRefresh//RefreshConstants'
import mainViewModel from '../ViewModel/MainViewModel'
import type ItemModel from '../ViewModel/ItemDataModel'
import TitleBarComponent from './/TitleBarComponent'

@Component
export default struct CaseView {
	@Provide(RefreshConstants.REFRESH_STATE_TAG) refreshState: number = RefreshState.COMPLETE;

	@Builder
	ContentBody() {

		List() {

			ForEach(mainViewModel.getCaseData(), (item: ItemModel) => {

				ListItem() {
					TextCommonWidget({
						textImage: item.img,
						title: item.title,
						onItemClick: () => {

							let url = this.getPageRoute(item)
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

	build() {

		Column() {

			// 导航栏
			TitleBarComponent({ isBack: false, title: 'Case' })

			// 下拉刷新组件
			RefreshComponent({
				headerStyle: RefreshHeaderStyle.CLOUD,
				itemLayout: (): void => this.ContentBody(),
				displayHeight: (CM.Utils.screenHeight()),
				onRefresh: () => {
					setTimeout(() => {
						this.refreshState = RefreshState.COMPLETE;
					}, RefreshConstants.REFRESH_DEFAULT_TIMEOUT);
				}
			}).width(CM.Co.FULL_PARENT)

		}
		.height(CM.Co.FULL_PARENT)
	}

	/// 获取页面跳转地址
	getPageRoute(item: ItemModel): string {

		let url = ''
		if ('logger' === item.key) {
			CM.Logger.debug("debug test log")
			CM.Logger.info("info test log")
			CM.Logger.error("error test log")

			CM.Utils.toast("吐司测试")

			CM.Logger.debug(`heitht: ${CM.Utils.screenHeight()}`)
			CM.Logger.debug(`heitht/2: ${CM.Utils.screenHeight() / 2}`)
			CM.Logger.debug(`weight: ${CM.Utils.screenWeight()}`)

			let deviceSize = CM.Utils.getDeviceSize(getContext(this));
			deviceSize.then((data: window.Window) => {
				CM.Logger.debug(`window Object: ${data}`)
			});
		} else if ('chat' == item.key) {
			url = 'pages/Chat/Pages/SetFontSizePage'
		} else if ('download' == item.key) {
			url = 'pages/Case/DownloadPage'
		} else if ('lottie' == item.key) {
			url = 'pages/Case/LottieDemoPage'
		} else if ('shopList' == item.key) {
			url = 'pages/Case/ShopList/Pages/ShopListPage'
		} else if ('taskList' == item.key) {
			url = 'pages/Case/TaskList/Pages/TaskListPage'
		}

		return url
	}
}