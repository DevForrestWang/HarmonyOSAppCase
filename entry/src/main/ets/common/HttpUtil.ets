import http from '@ohos.net.http';

export class HttpConstant {
  // The http timeout duration.
  static readonly HTTP_READ_TIMEOUT: number = 30000

  // Http request success status code.
  static readonly HTTP_CODE_200: number = 200

  // The request success status code.
  static readonly SERVER_CODE_SUCCESS: string = 'success'
}

// 返回的数据结构
export class ResponseResult {
  // Code returned by the network request: success, fail.
  code: string;

  // Message returned by the network request.
  msg: string | Resource;

  // Data returned by the network request.
  data: string | Object | ArrayBuffer;

  constructor() {
    this.code = '';
    this.msg = '';
    this.data = '';
  }
}

/**
 * 基础的网络请求
 * @param url
 * @param method
 * @param extraData
 * @returns
 */
function _baseRequest(url: string, method: http.RequestMethod, extraData?: string | Object | ArrayBuffer) {
  let httpRequest = http.createHttp();

  let responseResult = httpRequest.request(url, {
    method: method,
    readTimeout: HttpConstant.HTTP_READ_TIMEOUT,
    connectTimeout: HttpConstant.HTTP_READ_TIMEOUT,
    header: {
      'Content-Type': 'application/json'
    },
    extraData: extraData
  });

  let serverData: ResponseResult = new ResponseResult();

  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {

    if (value.responseCode === HttpConstant.HTTP_CODE_200) {

      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);

      if (resultJson.code === HttpConstant.SERVER_CODE_SUCCESS) {
        serverData.data = resultJson.data;
      }
      serverData.code = resultJson.code;
      serverData.msg = resultJson.msg;
    } else {
      serverData.msg = `网络请求失败，请稍后尝试！&${value.responseCode}`;
    }
    return serverData;
  }).catch(() => {
    serverData.msg = "网络请求失败，请稍后尝试！";
    return serverData;
  })
}

/**
 * Get 类型的 HTTP 请求
 * @param url
 * @returns
 */
export function HttpRequestGet(url: string): Promise<ResponseResult> {
  return _baseRequest(url, http.RequestMethod.GET)
}

/**
 * Post 类型的 HTTP 请求
 * @param url
 * @returns
 */
export function HttpRequestPost(url: string, extraData?: string | Object | ArrayBuffer): Promise<ResponseResult> {
  return _baseRequest(url, http.RequestMethod.POST, extraData)
}
