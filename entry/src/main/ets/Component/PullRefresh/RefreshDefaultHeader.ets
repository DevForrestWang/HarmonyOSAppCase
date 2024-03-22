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

import CM from '../../common/CCommon'
import { RefreshConstants, RefreshState } from './RefreshConstants';

@Component
export default struct RefreshDefaultHeader {
  @State refreshTitle: Resource = $r('app.string.refresh_default_header_hint');
  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number;

  private onStateCheck() {
    switch (this.state) {
      case RefreshState.IDLE:
        this.refreshTitle = $r('app.string.refresh_default_header_hint');
        break;
      case RefreshState.DRAGGING_REFRESHABLE:
        this.refreshTitle = $r('app.string.refresh_default_header_load');
        break;
      case RefreshState.REFRESHING:
        this.refreshTitle = $r('app.string.refresh_default_header_loading');
        break;
    }
  }

  build() {
    if (this.state !== RefreshState.IDLE) {
      Text(this.refreshTitle)
        .height(CM.Co.FULL_PARENT)
        .width(CM.Co.FULL_PARENT)
        .textAlign(TextAlign.Center)
        .fontSize(CM.Utils.vp(16))
        .onAppear(() => {
          this.onStateCheck();
        })
    }
  }
}