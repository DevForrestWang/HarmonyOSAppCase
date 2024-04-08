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

import CommonConstants from '../common/CommonConstants';
import ChatData from '../viewmodel/ChatData';
import { ItemDirection } from '../viewmodel/ItemDirection';

/**
 * Set view model, providing page display data.
 */
export class SetViewModel {
  chatArr: Array<ChatData> = [];

  initChatData(): Array<ChatData> {
    if (this.chatArr.length === 0) {
      this.chatArr = new Array();
      let chatData = new ChatData();
      chatData.itemDirection = ItemDirection.RIGHT;
      chatData.content = 'Did you know that you can now clock in a variety of health goals for healthy living?';
      this.chatArr.push(chatData);

      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.LEFT;
      chatData.content ="Yes, I added exercise and diet related goals.";
      this.chatArr.push(chatData);

      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.RIGHT;
      chatData.content = "That's great. How do you feel?";
      this.chatArr.push(chatData);

      chatData = new ChatData();
      chatData.itemDirection = ItemDirection.LEFT;
      chatData.content = "Life is getting better and better, you have a try!";
      this.chatArr.push(chatData);
    }
    return this.chatArr;
  }

  getTextByFontSize(fontSize: number): string {
    let fontSizeText: Resource | string = '';
    switch (fontSize) {
      case CommonConstants.SET_SIZE_SMALL:
        fontSizeText ="Small";
        break;
      case CommonConstants.SET_SIZE_NORMAL:
        fontSizeText = "Normal";
        break;
      case CommonConstants.SET_SIZE_LARGE:
        fontSizeText = "Large";
        break;
      case CommonConstants.SET_SIZE_EXTRA_LARGE:
        fontSizeText ="Extra large";
        break;
      case CommonConstants.SET_SIZE_HUGE:
        fontSizeText = "Huge";
        break;
      default:
        fontSizeText = "Normal";
    }
    return fontSizeText;
  }
}

export default new SetViewModel();