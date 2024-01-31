import prompt from '@system.prompt'
import CC from './CConstants'

export default class FWUtils {

  /**
   * 吐司提示
   * @param name 提示内容
   */
  public static toast(name: string) {
    prompt.showToast({
      message: name,
      duration: 2000,
      bottom: CC.screenHeight() / 2 - 20
    })
  }

}