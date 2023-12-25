import display from '@ohos.display';

/**
 * Common constants
 */
export  default class CConstants {

  // UIKet tab index
  static readonly UIKIT_TAB_INDEX = 0

  // Case tab index
  static readonly CASE_TAB_INDEX = 1

  // Common Spacing of Components
  static readonly SPACE = '12vp'

  // Table bar height
  static readonly BAR_HEIGHT = '56vp'

  // Navigation bar height
  static readonly NAV_BAR_HEIGHT = '140vp'

  // The width or height of the component is spread across the parent component.
  static readonly  FULL_PARENT = '100%'

  // 添加单位:vp
  public static vp(value: number): string {
    return `${value}vp`
  }

  // 添加单位:vp
  public static fp(value: number): string {
    return `${value}fp`
  }

  /**
   * 屏幕高度(像素比屏幕密度)
   * @returns
   */
  public static screenHeight(): number {
    let defaultDisplay = display.getDefaultDisplaySync()
    return defaultDisplay.height / defaultDisplay.scaledDensity
  }

  /**
   * 屏幕宽度(像素比屏幕密度)
   * @returns
   */
  public static screenWeight(): number {
    let defaultDisplay = display.getDefaultDisplaySync()
    return defaultDisplay.width / defaultDisplay.scaledDensity
  }

}