import ItemModel from './ItemDataModel'

export class MainViewModel {

  /// 首页获取的数据
  getUIKitData(): Array<ItemModel> {

    let dataModel: ItemModel[] = [
      new ItemModel('基本语法', $r('app.media.storage')),
      new ItemModel('页面布局，容器', $r('app.media.menu')),
      new ItemModel('网络请求', $r('app.media.discover_selected')),

      new ItemModel('基本语法2', $r('app.media.storage')),
      new ItemModel('页面布局2，容器', $r('app.media.menu')),
      new ItemModel('网络请求3', $r('app.media.discover_selected')),

      new ItemModel('基本语法3', $r('app.media.storage')),
      new ItemModel('页面布局3，容器', $r('app.media.menu')),
      new ItemModel('网络请求3', $r('app.media.discover_selected')),

      new ItemModel('基本语法4', $r('app.media.storage')),
      new ItemModel('页面布局，容器4', $r('app.media.menu')),
      new ItemModel('网络请求4', $r('app.media.discover_selected')),

      new ItemModel('基本语法5', $r('app.media.storage')),
      new ItemModel('页面布局，容器5', $r('app.media.menu')),
      new ItemModel('网络请求5', $r('app.media.discover_selected')),

      new ItemModel('基本语法6', $r('app.media.storage')),
      new ItemModel('页面布局，容器6', $r('app.media.menu')),
      new ItemModel('网络请求6', $r('app.media.discover_selected')),
    ]
    return dataModel
  }
}

export default new MainViewModel()