import ItemModel from './ItemDataModel'

export class MainViewModel {

  /// 首页获取的数据
  getUIKitData(): Array<ItemModel> {

    let dataModel: ItemModel[] = [
      new ItemModel('基本语法', $r('app.media.storage')),
      new ItemModel('页面布局，容器', $r('app.media.menu')),
      new ItemModel('UI组件：Text', $r('app.media.about')),
      new ItemModel('UI组件：TextArea', $r('app.media.data')),
      new ItemModel('UI组件：Image', $r('app.media.favorite')),
      new ItemModel('UI组件：TextInput', $r('app.media.love')),
      new ItemModel('UI组件：Button', $r('app.media.message')),
      new ItemModel('UI组件：LoadingProgress', $r('app.media.news')),
      new ItemModel('UI组件：List', $r('app.media.privacy')),
      new ItemModel('UI组件：Grid', $r('app.media.record')),
      new ItemModel('UI组件：Swiper', $r('app.media.recycle')),
      new ItemModel('网络请求', $r('app.media.discover_selected')),
    ]
    return dataModel
  }
}

export default new MainViewModel()