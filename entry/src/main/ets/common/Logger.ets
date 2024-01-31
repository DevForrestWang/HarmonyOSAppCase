import hilog from '@ohos.hilog'

/**
 * 日志打印模块
 */
export class Logger {
  private readonly domainDebug = 0xFF00
  private readonly domainInfo = 0xFF01
  private readonly domainError = 0xFF02

  private prefix: string
  private format: string = `%{public}s, %{public}s`

  constructor(prefix: string = '[FWLogTag]') {
    this.prefix = prefix;
  }

  /**
   * Debug级别日志
   * @param name 打印内容
   */
  public debug(...args: string[]) {
    hilog.debug(this.domainDebug,  this.prefix, this.format, args)
  }

  /**
   * Info级别日志
   * @param name 打印内容
   */
  public info(...args: string[]) {
    hilog.info(this.domainInfo,  this.prefix, this.format, args)
  }

  /**
   * Error级别日志
   * @param name 打印内容
   */
  public error(...args: string[]) {
    hilog.error(this.domainError,  this.prefix, this.format, args)
  }
}

export default new Logger('[FWLogTag]')