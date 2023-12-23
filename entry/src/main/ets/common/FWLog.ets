import hilog from '@ohos.hilog';

/**
 * 日志打印模块
 */
export default class FWLog {

  private static readonly domainDebug = 0xFF00
  private static readonly domainInfo = 0xFF01
  private static readonly domainError = 0xFF02

  // tag标识
  private static readonly myTag = 'FWLogTag'

  /**
   * Debug级别日志
   * @param name 打印内容
   */
  public static debug(name: string) {
    hilog.isLoggable(FWLog.domainDebug, FWLog.myTag, hilog.LogLevel.DEBUG);
    hilog.debug(FWLog.domainDebug,  FWLog.myTag, "%{public}s", name);
  }

  /**
   * Info级别日志
   * @param name 打印内容
   */
  public static info(name: string) {
    hilog.isLoggable(FWLog.domainInfo, FWLog.myTag, hilog.LogLevel.INFO);
    hilog.info(FWLog.domainInfo,  FWLog.myTag, "%{public}s", name);
  }

  /**
   * Error级别日志
   * @param name 打印内容
   */
  public static error(name: string) {
    hilog.isLoggable(FWLog.domainError, FWLog.myTag, hilog.LogLevel.ERROR);
    hilog.error(FWLog.domainError,  FWLog.myTag, "%{public}s", name);
  }
}