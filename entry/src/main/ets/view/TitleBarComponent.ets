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

import router from '@ohos.router';
import CC from '../common/CConstants';
import Utils from '../common/CCUtils'

/**
 * The title bar component.
 */
@Component
export default struct TitleBarComponent {
  isBack: boolean = true;
  title: string = '';

  build() {
    Row() {
      if (this.isBack) {
        Image($r('app.media.ic_public_back'))
          .height(Utils.vp(24))
          .width(Utils.vp(24))
          .margin({ right: Utils.vp(4) })
          .onClick(() => {
            router.back();
          })
      }

      Text(this.title)
        .fontColor(Color.Black)
        .fontSize($r('sys.float.ohos_id_text_size_headline8'))
        .fontWeight(FontWeight.Medium)
        .margin({ left: Utils.vp(8) })
        .textAlign(TextAlign.Center)
        .width(CC.FULL_PARENT)
        .padding({right: Utils.vp(40)})
    }
    .width(CC.FULL_PARENT)
    .height('7.2%')
    .padding({ left: Utils.vp(16) })
  }
}