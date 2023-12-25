import hilog from '@ohos.hilog';

/**
 * 日志打印模块
 */
export class FWLog {
  private readonly domainDebug = 0xFF00
  private readonly domainInfo = 0xFF01
  private readonly domainError = 0xFF02

  // tag标识
  private readonly myTag = 'FWLogTag'
  private format: string = `%{public}s, %{public}s`;

  /**
   * Debug级别日志
   * @param name 打印内容
   */
  public debug(...args: string[]) {
    hilog.debug(this.domainDebug,  this.myTag, this.format, args);
  }

  /**
   * Info级别日志
   * @param name 打印内容
   */
  public info(...args: string[]) {
    hilog.info(this.domainInfo,  this.myTag, this.format, args);
  }

  /**
   * Error级别日志
   * @param name 打印内容
   */
  public error(...args: string[]) {
    hilog.error(this.domainInfo,  this.myTag, this.format, args);
  }

  public isLoggable(level: number) {
    hilog.isLoggable(this.domainInfo, this.myTag, level);
  }
}

export default new FWLog()