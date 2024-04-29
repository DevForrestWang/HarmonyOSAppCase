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
      new ItemModel('Web组件', $r('app.media.down_arrow')),
    ]
    return dataModel
  }

  /// Case获取的数据
  getCaseData(): Array<ItemModel> {
    let dataModel: ItemModel[] = [
      new ItemModel('打印日志、Toast 测试', $r('app.media.ic_display_and_brightness')),
      new ItemModel('聊天页面', $r('app.media.ic_app_management')),
      new ItemModel('下载页面', $r('app.media.down_arrow')),
      new ItemModel('使用lottie库', $r('app.media.ic_loading_file')),
      new ItemModel('店铺列表', $r('app.media.ic_storage')),
      new ItemModel('任务列表', $r('app.media.menu')),
    ]
    return dataModel
  }

}

export default new MainViewModel()