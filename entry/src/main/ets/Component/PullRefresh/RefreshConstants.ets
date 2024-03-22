/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License,Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import display from '@ohos.display';
import RefreshModel from './RefreshModel'
import CM from '../../common/CCommon'

let deviceDisplay: display.Display = CM.GlobalData.getContext().getObject('display') as display.Display;

/**
 * constant about refresh feature
 */
export class RefreshConstants {

  /**
   * refresh state tag
   */
  static readonly REFRESH_STATE_TAG = 'refresh_state_tag';

  /**
   * refresh default header height
   */
  static readonly REFRESH_HEADER_HEIGHT = 50;

  /**
   * refresh effective height
   */
  static readonly REFRESH_EFFECTIVE_HEIGHT = 1.2 * RefreshConstants.REFRESH_HEADER_HEIGHT;

  /**
   * refresh layout extra height
   */
  static readonly REFRESH_LAYOUT_EXTRA_HEIGHT = 0.1;

  /**
   * refresh header animation duration
   */
  static readonly REFRESH_HEADER_ANIM_DURATION = 440;



  /**
   * refresh header item width
   */
  static readonly REFRESH_HEADER_ITEM_DEFAULT_WIDTH = 30;

  /**
   * refresh header item scale width
   */
  static readonly REFRESH_HEADER_ITEM_SCALE_WIDTH = 80;

  /**
   * refresh default time out
   */
  static readonly REFRESH_DEFAULT_TIMEOUT = 6000;

  /**
   * refresh header item animation duration
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_DURATION = 2000;

  /**
   * refresh header item animation temp
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_TEMPO = 3.0;

  /**
   * refresh header item animation ITERATIONS
   */
  static readonly REFRESH_HEADER_ITEM_ANIM_ITERATIONS = -1;

  /**
   * refresh header item feature
   */
  static readonly REFRESH_HEADER_FEATURE: RefreshModel[] = [
    new RefreshModel($r('app.media.ic_loading_game'), (px2vp(deviceDisplay.width) / 2 - RefreshConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 100, 400),
    new RefreshModel($r('app.media.ic_loading_heart'), (px2vp(deviceDisplay.width) / 2 - RefreshConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) - 50, 800),
    new RefreshModel($r('app.media.ic_loading_louder'), px2vp(deviceDisplay.width) / 2 - RefreshConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2, 1200),
    new RefreshModel($r('app.media.ic_loading_bag'), (px2vp(deviceDisplay.width) / 2 - RefreshConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 50, 1600),
    new RefreshModel($r('app.media.ic_loading_file'), (px2vp(deviceDisplay.width) / 2 - RefreshConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH / 2) + 100, 2000)
  ];
}

/**
 * refresh state enum
 */
export enum RefreshState {
  IDLE = 0,
  DRAGGING = 1,
  DRAGGING_REFRESHABLE = 2,
  REFRESHING = 3,
  COMPLETE = 4
}

/**
 * refresh header style enum
 */
export enum RefreshHeaderStyle {
  DEFAULT,
  CLOUD
}

