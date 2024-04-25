import CM from '../../../../common/CCommon'
import BaseNaView from '../../../../view/BaseNavigationView'
import ShopInfo from '../ViewModel/ShopInfo'
import ShopModel from '../ViewModel/ShopModel'
import ShopItem from '../View/ShopItem'

/// 店铺列表，网络请求使用
@Entry
@Component
struct ShopListPage {
  @State shops: ShopInfo[] = []
  isLoading: boolean = false
  isMore: boolean = true

  aboutToAppear() {
    // 加载商品数据
    ShopModel.pageNo = 1
    this.loadShopInfo()
  }

  build() {
    Column() {
      BaseNaView({title: '店铺列表'}) {

      }
    }
  }

  loadShopInfo(){
    // 加载数据
    ShopModel.getShopList()
      .then(shops => {
        // 给图片加上服务器地址前缀
        shops.forEach(s => {
          s.images.forEach((src, i) => {
            s.images[i] = 'http://192.168.1.177:9588' + src
          })
        })

        this.shops = this.shops.concat(shops)
        this.isLoading = false
        if(!shops || shops.length === 0){
          this.isMore = false
        }
      })
  }
}