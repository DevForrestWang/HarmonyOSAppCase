
/// 每一项资源定义
export default class ItemDataModel {

  title: string

  img: Resource

  constructor(title: string, img: Resource) {
    this.title = title
    this.img = img
  }
}
