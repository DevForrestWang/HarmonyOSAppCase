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

import CM from '../../Common/CCommon'
import { RefreshState, RefreshConstants } from './RefreshConstants';
import type RefreshModel from './RefreshModel';

@Component
export default struct RefreshAnimHeader {
  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') refreshState: number;
  @State iconWidth: number = RefreshConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;

  private onStateCheck(): void {
    if (this.refreshState === RefreshState.REFRESHING) {
      this.iconWidth = RefreshConstants.REFRESH_HEADER_ITEM_SCALE_WIDTH;
    } else {
      this.iconWidth = RefreshConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH;
    }
  }

  @Builder AttrAnimIcons(iconItem: RefreshModel) {
    Image(iconItem.imgRes)
      .width(px2vp(CM.Utils.adaptDimension(this.iconWidth)))
      .position({ x: iconItem.posX })
      .objectFit(ImageFit.Contain)
      .animation({
        duration: RefreshConstants.REFRESH_HEADER_ITEM_ANIM_DURATION,
        tempo: RefreshConstants.REFRESH_HEADER_ITEM_ANIM_TEMPO,
        delay: iconItem.delay,
        curve: Curve.Linear,
        playMode: PlayMode.Alternate,
        iterations: RefreshConstants.REFRESH_HEADER_ITEM_ANIM_ITERATIONS
      })
  }

  build() {
    Row() {
      if (this.refreshState !== RefreshState.IDLE) { // stop animation when idle state.
        ForEach(RefreshConstants.REFRESH_HEADER_FEATURE, (iconItem: RefreshModel) => {
          this.AttrAnimIcons(iconItem)
        }, (item: RefreshModel) => JSON.stringify(item))
      }
    }
    .width(CM.Co.FULL_PARENT)
    .height(CM.Co.FULL_PARENT)
    .onAppear(() => {
      this.onStateCheck();
    })
  }
}