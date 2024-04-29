/// 列表项资源定义
export default class ItemDataModel {

	// 页面跳转key值
	key: string
	title: string
	img: Resource

	constructor(key: string, title: string, img: Resource) {
		this.key = key
		this.title = title
		this.img = img
	}
}
