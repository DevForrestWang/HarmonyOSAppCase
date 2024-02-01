import prompt from '@system.prompt'
import CC from './CConstants'

export default class CCUtils {

  /**
   * 吐司提示
   * @param name 提示内容
   */
  public static toast(name: string, duration: number = 2000) {
    prompt.showToast({
      message: name,
      duration: duration,
      bottom: CC.screenHeight() / 2 - 20
    })
  }

  /**
   * 空字符串检查
   * @param value 检查的值
   * @returns true 为空
   */
  public static isEmpty(value?: string): boolean {
    if (value === undefined || value === null || value === '' || value.length <= 0) {
      return true
    }
    return false
  }

  /**
   * 数组检查
   * @param value 检查的值
   * @returns true 为空
   */
  public static isEmptyArray(value?: Array<any>): boolean {
    if (value === undefined || value === null || value.length <= 0) {
      return true
    }

    return false
  }

}