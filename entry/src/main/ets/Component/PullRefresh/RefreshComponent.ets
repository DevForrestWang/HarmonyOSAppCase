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
import RefreshDefaultHeader from './RefreshDefaultHeader'
import RefreshAnimHeader from './RefreshAnimHeader'
import { RefreshConstants, RefreshState, RefreshHeaderStyle } from './RefreshConstants';

@Component
export default struct RefreshComponent {
  private headerStyle: RefreshHeaderStyle = RefreshHeaderStyle.DEFAULT;
  private displayHeight: number = 0;
  private listController: Scroller = new Scroller();
  private onRefresh?: () => void;
  @State headerOffset: number = 0;
  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateChanged') refreshState: number;
  @BuilderParam itemLayout?: () => void;

  private onStateChanged(): void {
    switch (this.refreshState) {
      case RefreshState.REFRESHING:
        if (this.onRefresh !== undefined) {
          this.onRefresh();
        }
        break;
      case RefreshState.COMPLETE:
        this.headerOffset = -RefreshConstants.REFRESH_HEADER_HEIGHT;
        break;
    }
  }

  aboutToAppear() {
    if (this.refreshState === RefreshState.REFRESHING) {
      this.headerOffset = 0;
      this.onStateChanged();
    } else {
      this.refreshState = RefreshState.IDLE;
      this.headerOffset = -RefreshConstants.REFRESH_HEADER_HEIGHT;
    }
    this.displayHeight = RefreshConstants.REFRESH_HEADER_HEIGHT + Number(this.displayHeight);
  }

  build() {
    List({ scroller: this.listController }) {
      ListItem() {
        Column() {
          if (this.headerStyle === RefreshHeaderStyle.DEFAULT) {
            RefreshDefaultHeader().height(RefreshConstants.REFRESH_HEADER_HEIGHT)
          } else if (this.headerStyle === RefreshHeaderStyle.CLOUD) {
            RefreshAnimHeader().height(RefreshConstants.REFRESH_HEADER_HEIGHT)
          }
          if (this.itemLayout !== undefined) {
            this.itemLayout()
          }
        }
        .width(CM.Co.FULL_PARENT)
        .height(Number(this.displayHeight) + RefreshConstants.REFRESH_LAYOUT_EXTRA_HEIGHT)
      }
    }
    .edgeEffect(EdgeEffect.Spring)
    .width(CM.Co.FULL_PARENT)
    .height(this.displayHeight)
    .listDirection(Axis.Vertical)
    .offset({ y: this.headerOffset })
    .animation({
      curve: Curve.Smooth,
      duration: RefreshConstants.REFRESH_HEADER_ANIM_DURATION,
      playMode: PlayMode.Normal,
      onFinish: () => {
        if (this.headerOffset === -RefreshConstants.REFRESH_HEADER_HEIGHT) {
          this.refreshState = RefreshState.IDLE;
        }
      }
    })
    .onTouch((event?: TouchEvent) => {
      if (!event) {
        return;
      }
      switch (event.type) {
        case TouchType.Down:
          if (this.refreshState === RefreshState.IDLE) {
            this.refreshState = RefreshState.DRAGGING;
          }
          break;
        case TouchType.Move:
          if (this.refreshState === RefreshState.DRAGGING
          && this.listController.currentOffset().yOffset <= -RefreshConstants.REFRESH_EFFECTIVE_HEIGHT) {
            this.refreshState = RefreshState.DRAGGING_REFRESHABLE;
          }
          break;
        case TouchType.Up:
          if (this.refreshState === RefreshState.DRAGGING_REFRESHABLE) {
            this.headerOffset = 0;
            this.refreshState = RefreshState.REFRESHING;
          }
          break;
        default:
          break;
      }
    })
  }
}