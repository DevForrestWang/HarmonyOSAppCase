import prompt from '@system.prompt'
import display from '@ohos.display'
import window from '@ohos.window'

export default class CCUtils {

  // 添加单位:vp
  public static vp(value: number): string {
    return `${value}vp`
  }

  // 添加单位:vp
  public static fp(value: number): string {
    return `${value}fp`
  }

  public static percent(value: number): string {
    return `${value}%`
  }

  /**
   * 吐司提示
   * @param name 提示内容
   */
  public static toast(name: string, duration: number = 2000) {
    prompt.showToast({
      message: name,
      duration: duration,
      bottom: this.screenHeight() / 2 - 20
    })
  }

  /**
   * 去掉浮点的小数
   */
  public static float2Int (value?: number) {
    if (value === undefined || value === null) {
      return 0
    }

    if (value < 0) {
      return Math.ceil(value);
    }
    return Math.floor(value);
  }

  /**
   * Get the device size.
   *
   * @returns promise of window.
   */
  public static getDeviceSize(context: Context): Promise<window.Window> {
    return window.getLastWindow(context);
  }

  /**
   * 屏幕高度(像素比屏幕密度)
   * @returns
   */
  public static screenHeight(): number {
    let defaultDisplay = display.getDefaultDisplaySync()
    let height = defaultDisplay.height / defaultDisplay.scaledDensity

    if (isNaN(height)) {
      return 0
    }
    return this.float2Int(height)
  }

  static adaptDimension(value: number): number {
    const DESIGN_WIDTH = 360;
    const DESIGN_HEIGHT = 780;

    let deviceDisplay: display.Display = display.getDefaultDisplaySync()
    let widthScale = deviceDisplay.width / DESIGN_WIDTH;
    let virtualHeight = widthScale * DESIGN_HEIGHT;
    let designDim = Math.sqrt(DESIGN_WIDTH * DESIGN_WIDTH + DESIGN_HEIGHT * DESIGN_HEIGHT);
    let virtualDim = Math.sqrt(deviceDisplay.width * deviceDisplay.width + virtualHeight * virtualHeight);
    return virtualDim * value / designDim;
  }

  /**
   * 屏幕宽度(像素比屏幕密度)
   * @returns
   */
  public static screenWeight(): number {
    let defaultDisplay = display.getDefaultDisplaySync()
    let width = defaultDisplay.width / defaultDisplay.scaledDensity

    if (isNaN(width)) {
      return 0
    }
    return this.float2Int(width)
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