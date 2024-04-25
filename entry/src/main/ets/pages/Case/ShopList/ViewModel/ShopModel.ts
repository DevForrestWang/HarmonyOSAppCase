import axios from '@ohos/axios'
import ShopInfo from './ShopInfo';

class ShopModel{
  baseURL: string = ''
  pageNo: number = 1

  getShopList(): Promise<ShopInfo[]>{
    return new Promise((resolve, reject) => {
      axios.get(
        `${this.baseURL}/shops`,
        {
          params: {pageNo: this.pageNo, pageSize: 4}
        }
      )
        .then(resp => {
          if(resp.status === 200){
            // 查询成功
            console.log('查询商铺成功！', JSON.stringify(resp.data))
            resolve(resp.data)
          }else{
            console.log('查询商铺信息失败！error:', JSON.stringify(resp))
            reject('查询商铺失败')
          }
        })
        .catch(error => {
          console.log('查询商铺信息失败！error:', JSON.stringify(error))
          reject('查询商铺失败')
        })
    })
  }

}

const shopModel = new ShopModel();
export default shopModel as ShopModel;