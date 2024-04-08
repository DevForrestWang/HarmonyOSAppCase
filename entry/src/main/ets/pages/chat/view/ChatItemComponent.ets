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
import CM from '../../../common/CCommon'
import ChatData from '../viewmodel/ChatData';
import { ItemDirection } from '../viewmodel/ItemDirection';
import StyleConstants from '../common/StyleConstants';

/**
 * The chat list item component.
 */
@Component
export default struct ChatItemComponent {
  item: ChatData = new ChatData()
  @Prop changeFontSize: number

  build() {
    Row() {
      Image(this.item.itemDirection === ItemDirection.RIGHT ? $r('app.media.right_head') : $r('app.media.left_head'))
        .width(StyleConstants.SET_CHAT_HEAD_SIZE_PERCENT)
        .aspectRatio(StyleConstants.HEAD_ASPECT_RATIO)
        .margin({
          left: this.item.itemDirection === ItemDirection.RIGHT
            ? StyleConstants.HEAD_LEFT_PERCENT : StyleConstants.HEAD_RIGHT_PERCENT,
          right: this.item.itemDirection === ItemDirection.RIGHT
            ? StyleConstants.HEAD_RIGHT_PERCENT : StyleConstants.HEAD_LEFT_PERCENT
        })

      ChatContent({ item: this.item, changeFontSize: this.changeFontSize })
    }
    .alignItems(VerticalAlign.Top)
    .width(StyleConstants.FULL_WIDTH)
    .direction(this.item.itemDirection === ItemDirection.RIGHT ? Direction.Rtl : Direction.Ltr)
    .margin({ top: StyleConstants.CHAT_TOP_MARGIN_PERCENT })
  }
}


@Component
struct ChatContent {
  item: ChatData = new ChatData()
  @Prop changeFontSize: number
  @State isLineFeed: boolean = false

  build() {
    Row() {
      Text(this.item.content)
        .fontColor("#182431")
        .fontSize(this.changeFontSize + StyleConstants.UNIT_FP)
        .fontWeight(FontWeight.Medium)
        .onAreaChange((oldValue: Area, newValue: Area) => {
          this.isLineFeed = newValue.height > StyleConstants.DOUBLE_ROW_MIN;
        })
      if (this.isLineFeed) {
        Blank().layoutWeight(StyleConstants.WEIGHT_FULL)
      }
    }
    .constraintSize({ maxWidth: StyleConstants.MAX_CHAT_WIDTH_PERCENT })
    .direction(Direction.Ltr)
    .padding({
      left: CM.Utils.vp(20),
      right:  CM.Utils.vp(20),
      top:  CM.Utils.vp(12),
      bottom: CM.Utils.vp(12)
    })
    .backgroundColor(this.item.itemDirection === ItemDirection.RIGHT
      ? "#D7E9F3" : "#FFFFFF")
    .borderRadius(CM.Utils.vp(24))
  }
}
