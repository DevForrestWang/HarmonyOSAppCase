import Co from './CConstants'
import Utils from './CCUtils'
import CCPreference from './CCPreference'
import Logger from './Logger'
import WindowBarManager from './/WindowBar'
import GlobalData from './GlobalData'
import {HttpConstant, HttpURL, HttpRequestGet, HttpRequestPost} from './HttpUtil'
import {createWantAgent, publishNotification, openNotificationPermission} from './CCNotificationUtil'
import { getStringByRes } from './CCResourseUtil'

// common模块导出类
export class CM  {
   public Co = Co
   public Utils = Utils
   //属性或全局变量，无法获取到当前 this，因此getContext(this)，也就获取失败
   public CCPreference = CCPreference
   public Logger = Logger
   public WindowBarManager = WindowBarManager
   public GlobalData = GlobalData
   public HttpConstant = HttpConstant
   public HttpURL = HttpURL
   public HttpRequestGet = HttpRequestGet
   public HttpRequestPost = HttpRequestPost
   public createWantAgent = createWantAgent
   public publishNotification = publishNotification
   public openNotificationPermission = openNotificationPermission
   public getStringByRes = getStringByRes
}
export default new CM
