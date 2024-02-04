/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import window from '@ohos.window';
import Logger from './Logger'
import CC from './CConstants'

export default class WindowBarManager {
  private static instance: WindowBarManager;
  currentBarColor: string | Resource = '';
  cacheWindowStage?: window.WindowStage;

  constructor() {
    if (!WindowBarManager.instance) {
      WindowBarManager.instance = this;
    }
    return WindowBarManager.instance;
  }

  immersiveWindow(windowStage: window.WindowStage, color: string, isLayoutFullScreen: boolean) {
    if (this.currentBarColor && this.currentBarColor === color) return;

    if (windowStage) {
      this.cacheWindowStage = windowStage;
    } else if (this.cacheWindowStage) {
      windowStage = this.cacheWindowStage;
    }

    let windowClass: window.Window | null = null;
    windowStage.getMainWindow((err, data: window.Window) => {
      if (err.code) {
        Logger.error(`Failed to obtain the main window. Cause: ${JSON.stringify(err)}`);
        return;
      }

      windowClass = data;
      Logger.info(`Succeeded in obtaining the main window. Data:  ${JSON.stringify(data)}`);
      windowClass.setWindowLayoutFullScreen(isLayoutFullScreen, (err) => {
        if (err.code) {
          Logger.error(`Failed to set the window layout to full-screen mode. Cause: ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('Succeeded in setting the window layout to full-screen mode.');
      });

      let sysBarProps = {
        statusBarColor: color,
        navigationBarColor: CC.NAVIGATION_BAR_COLOR,
        statusBarContentColor: CC.STATUS_BAR_CONTENT_COLOR,
        navigationBarContentColor: CC.NAVIGATION_BAR_CONTENT_COLOR
      } as window.SystemBarProperties;
      windowClass.setWindowSystemBarProperties(sysBarProps, (err) => {
        if (err.code) {
          Logger.error(`Failed to set the system bar properties. Cause: ${JSON.stringify(err)}`)
          return;
        }
        this.currentBarColor = color;
        Logger.info('Succeeded in setting the system bar properties.')
      });
    });
  }
}