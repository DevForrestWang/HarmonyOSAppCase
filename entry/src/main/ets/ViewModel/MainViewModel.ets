import ItemModel from './ItemDataModel'

export class MainViewModel {

	/// 首页获取的数据
	getUIKitData(): Array<ItemModel> {

		let dataModel: ItemModel[] = [
			new ItemModel('grammar', '基本语法', $r('app.media.storage')),
			new ItemModel('layout', '页面布局，容器', $r('app.media.menu')),
			new ItemModel('uiText', 'UI组件：Text', $r('app.media.about')),
			new ItemModel('uiTextArea', 'UI组件：TextArea', $r('app.media.data')),
			new ItemModel('uiImage', 'UI组件：Image', $r('app.media.favorite')),
			new ItemModel('uiTextInput', 'UI组件：TextInput', $r('app.media.love')),
			new ItemModel('uiButton', 'UI组件：Button', $r('app.media.message')),
			new ItemModel('uiProgress', 'UI组件：LoadingProgress', $r('app.media.news')),
			new ItemModel('uiList', 'UI组件：List', $r('app.media.privacy')),
			new ItemModel('uiGrid', 'UI组件：Grid', $r('app.media.record')),
			new ItemModel('uiSwiper', 'UI组件：Swiper', $r('app.media.recycle')),
			new ItemModel('uiWeb', 'Web组件', $r('app.media.down_arrow')),
			new ItemModel('lazyForEach', '数据懒加载', $r('app.media.ic_loading_bag')),
		]
		return dataModel
	}

	/// Case获取的数据
	getCaseData(): Array<ItemModel> {
		let dataModel: ItemModel[] = [
			new ItemModel('logger', '打印日志、Toast 测试', $r('app.media.ic_display_and_brightness')),
			new ItemModel('chat', '聊天页面', $r('app.media.ic_app_management')),
			new ItemModel('download', '下载页面', $r('app.media.down_arrow')),
			new ItemModel('lottie', '使用lottie库', $r('app.media.ic_loading_file')),
			new ItemModel('shopList', '店铺列表', $r('app.media.ic_storage')),
			new ItemModel('taskList', '任务列表', $r('app.media.menu')),
		]
		return dataModel
	}
}

export default new MainViewModel()