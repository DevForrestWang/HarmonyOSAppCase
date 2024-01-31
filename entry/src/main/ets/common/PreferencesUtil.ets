/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import dataPreferences from '@ohos.data.preferences'
import { GlobalContext } from './GlobalContext'
import Logger from './Logger'

const FS_PREFERENCES_NAME = 'FwPreferences'

/**
 * 持久化工具类：提供创建、保存、查询、删除数据工具类
 */
export class PreferencesUtil {

  /**
   * 初始化保存空间
   * @param context
   */
  createFontPreferences(context: Context): void {
    let fontPreferences: Function = (() => {
      let preferences: Promise<dataPreferences.Preferences> = dataPreferences.getPreferences(context, FS_PREFERENCES_NAME)
      return preferences
    });
    GlobalContext.getContext().setObject(FS_PREFERENCES_NAME, fontPreferences)
  }

  /**
   * 保存数据
   * @param key
   * @param value
   */
  saveObject(key: string, value: string): void {
    let preferencesFun: Function = GlobalContext.getContext().getObject(FS_PREFERENCES_NAME) as Function
    preferencesFun().then((preferences: dataPreferences.Preferences) => {
      preferences.has(key).then(async (isExist: boolean) => {
        Logger.info('preferences has changeFontSize is ' + isExist)
        await preferences.put(key, value);
        await preferences.flush();
        Logger.info('Save data key: ' + key + ', value: ' + value)
      }).catch((err: Error) => {
        Logger.error('Has the value failed with err: ' + err)
      });
    }).catch((err: Error) => {
      Logger.error('Get the preferences failed, err: ' + err)
    });
  }

  /**
   * 获取保存数据
   * @param key
   * @returns
   */
  async getObject(key: string): Promise<string> {
    let fontSize: string = '';
    let getFontPreferences: Function = GlobalContext.getContext().getObject(FS_PREFERENCES_NAME) as Function
    fontSize = await (await getFontPreferences()).get(key, fontSize)
    return fontSize
  }

  /**
   * 删除保存数据
   * @param key
   */
  async deleteObject(key: string) {
    let preferencesFunc: Function = GlobalContext.getContext().getObject(FS_PREFERENCES_NAME) as Function
    const preferences: dataPreferences.Preferences = await preferencesFunc()

    let deleteValue = preferences.delete(key)
    deleteValue.then(() => {
      Logger.info('Succeeded in deleting the key appFontSize.')
    }).catch((err: Error) => {
      Logger.error('Failed to delete the key appFontSize. Cause: ' + err)
    });
  }
}

export default new PreferencesUtil()