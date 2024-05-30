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

import router from '@ohos.router';
import CM from '../Common/CCommon'

const SPLASH_KEY = 'ShowSplashKey'
const SPLASH_VALUE = 'ShowSplash'

@Entry
@Component
struct Splash {
  private swiperController: SwiperController = new SwiperController();
  private data: Resource[] = [ $r('app.media.splash1'), $r('app.media.splash2'), $r('app.media.splash3')];
  @State countdown: number = 5;
  @State showSwiper: boolean = false;
  private timer:number = -1;

  aboutToAppear(): void {
    CM.CCPreference.getData(SPLASH_KEY).then((value: string) => {
      if (CM.Utils.isEmpty(value) || value !== SPLASH_VALUE) {
        this.showSwiper = true
      } else {
        this.showSwiper = false;
        this.countdown = 2;
      }
      this.startTiming()
   });
  }

  startTiming(): void {
    this.timer = setInterval(() => {
      this.countdown--;
      if (this.countdown === 0) {
        this.clearTiming();
        this.jumpToMainPage();
      }
    }, 1000);
  }

  clearTiming(): void {
    if (this.timer !== -1) {
      clearInterval(this.timer);
      this.timer = -1;
    }
  }

  jumpToMainPage(): void {
    this.clearTiming();
    router.replaceUrl({
      url: 'pages/MainPage'
    });
  }

  aboutToDisappear() {
    this.clearTiming();
  }

  build() {
    Column() {
      Stack() {
        if (this.showSwiper) {
          Swiper(this.swiperController) {
            ForEach(this.data, (item: Resource) => {
              Image(item)
                .width(CM.Co.FULL_PARENT)
                .height(CM.Co.FULL_PARENT)
                .objectFit(ImageFit.Cover)
            })
          }
          .loop(true)
          .interval(2 * 1000)
          .duration(1000)
          .autoPlay(true)
          .indicatorStyle({
            bottom: CM.Utils.vp(100),
            color: "#99FFFFFF"
          })
          .curve(Curve.Linear)
          .onChange((index: number) => {
            CM.Logger.debug(index.toString())
            CM.CCPreference.writeData(SPLASH_KEY, SPLASH_VALUE)
          })

          Text() {
            Span('跳过')
            Span(`${this.countdown}`)
          }
          .onClick(() => this.jumpToMainPage())
          .fontColor(Color.White)
          .fontSize(CM.Utils.vp(12))
          .backgroundColor("#4d182431")
          .width(CM.Utils.vp(63))
          .height(CM.Utils.vp(24))
          .borderRadius(CM.Utils.vp(10))
          .textAlign(TextAlign.Center)
          .position({
            x: '78%',
            y: CM.Utils.vp(35)
          })
        } else {
          Image($r('app.media.splash_bg'))
            .width(CM.Co.FULL_PARENT)
            .height(CM.Co.FULL_PARENT)
          Image($r('app.media.ic_splash'))
            .width(CM.Utils.vp(192))
            .height(CM.Utils.vp(192))
            .offset({
              y: `-${'15%'}`
            })
            .objectFit(ImageFit.Contain)

          Column() {
            Text('鸿蒙系统')
              .fontColor(Color.White)
              .fontSize(CM.Utils.vp(24))
              .fontWeight(FontWeight.Medium)

            Text('欢迎来到HmCase')
              .fontSize(CM.Utils.vp(16))
              .fontColor(Color.White)
              .margin({
                top: CM.Utils.vp(5)
              })
          }
          .offset({
            y: '25%'
          })
        }
      }
    }
    .height(CM.Co.FULL_PARENT)
    .width(CM.Co.FULL_PARENT)
  }
}