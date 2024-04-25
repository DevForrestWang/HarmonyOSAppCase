import http from '@ohos.net.http';
import Logger from './Logger'

export class HttpConstant {
  // The http timeout duration.
  static readonly HTTP_READ_TIMEOUT: number = 30000

  // Http request success status code.
  static readonly HTTP_CODE_200: number = 200

  // The request success status code.
  static readonly SERVER_CODE_SUCCESS: string = '200'

  static requestId: number = 0

  // 请求头定义
  static heads = {
    'Content-Type': 'application/json'
  }
}

export class HttpURL {
  // The host address of the server.
  static readonly BASE_SERVER: string = 'http://192.168.1.177:9588';

  // 接口：店铺列表
  static readonly shopsURL: string = 'shops';
}

// 返回的数据类型
export class ResponseResult {
  // 返回结果，200成功
  retCode: number | string;

  // 接口描述信息
  msg: string;

  // 返回的数据
  data: string | Object | ArrayBuffer;

  // 当前页码
  curPage: number;

  // 总页数
  totalPage: number;

  constructor() {
    this.retCode = 201;
    this.msg = '';
    this.data = '';
    this.curPage = 0;
    this.totalPage = 0;
  }
}

// 定义请求参数结构
export interface ParamsType {
  [key: string]: unknown
}

function _printRequest(url: string, reqId: number, params?: ParamsType): void {
  Logger.debug(`===========<request-id:${reqId} tag:>===========`)
  Logger.debug(`Request Url: ${url}`)
  Logger.debug("Request Params:" + JSON.stringify(params, null, 4))
  Logger.debug("Request Header:" + JSON.stringify(HttpConstant.heads, null, 4))
}

/**
 * 基础的网络请求
 * @param url
 * @param method
 * @param extraData
 * @returns
 */
function _baseRequest(url: string, method: http.RequestMethod, reqId: number, extraData?: string | Object | ArrayBuffer): Promise<ResponseResult> {
  let httpRequest = http.createHttp();

  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: HttpConstant.HTTP_READ_TIMEOUT,
    connectTimeout: HttpConstant.HTTP_READ_TIMEOUT,
    header: HttpConstant.heads,
    extraData: extraData
  });

  let serverData: ResponseResult = new ResponseResult();

  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {

    if (value.responseCode === HttpConstant.HTTP_CODE_200) {

      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      Logger.debug(`===========<response-idS:${reqId} tag:>===========`)
      Logger.debug(`Response Data:${JSON.stringify(resultJson, null, 4)} `)

      if (resultJson.retCode === HttpConstant.HTTP_CODE_200 ||
      resultJson.retCode === HttpConstant.SERVER_CODE_SUCCESS) {
        serverData.retCode = HttpConstant.HTTP_CODE_200;
        serverData.data = resultJson.data;
      }

      serverData.msg = resultJson.msg;
    } else {
      serverData.retCode = 201
      serverData.msg = `网络请求失败，请稍后尝试！&${value.responseCode}`;

      Logger.error(`===========<response-idS:${reqId} tag:>===========`)
      Logger.error(`Response Data:${JSON.stringify(serverData, null, 4)} `)
    }
    return serverData;
  }).catch(() => {
    serverData.retCode = 201
    serverData.msg = "网络请求失败，请稍后尝试！";

    Logger.error(`===========<response-idS:${reqId} tag:>===========`)
    Logger.error(`Response Data:${JSON.stringify(serverData, null, 4)} `)
    return serverData;
  })
}

/**
 * Get 类型的 HTTP 请求
 * @param url
 * @returns
 */
export function HttpRequestGet(url: string, params?: ParamsType): Promise<ResponseResult> {
  let strParams = ''
  for (let key in params) {
    strParams += key + "&" +  JSON.stringify(params[key])
  }

  let tmpUrl = url
  if (strParams.length > 0) {
    tmpUrl += "?" + strParams
  }

  HttpConstant.requestId += 1
  _printRequest(tmpUrl, HttpConstant.requestId, params)
  return _baseRequest(tmpUrl, http.RequestMethod.GET, HttpConstant.requestId)
}

/**
 * Post 类型的 HTTP 请求
 * @param url
 * @returns
 */
export function HttpRequestPost(url: string, params?:ParamsType): Promise<ResponseResult> {
  HttpConstant.requestId += 1
  _printRequest(url, HttpConstant.requestId, params)
  return _baseRequest(url, http.RequestMethod.POST, HttpConstant.requestId, params)
}
