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
import CC from '../common/CConstants';
import CCPreference from '../common/CCPreference';
import Logger from '../common/Logger';
import Utils from '../common/CCUtils'

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
    CCPreference.getData(SPLASH_KEY).then((value: string) => {
      if (Utils.isEmpty(value) || value !== SPLASH_VALUE) {
        this.showSwiper = true
      } else {
        this.showSwiper = false;
        this.countdown = 2;
      }
      this.startTiming()
   });
  }

  startTiming() {
    this.timer = setInterval(() => {
      this.countdown--;
      if (this.countdown === 0) {
        this.clearTiming();
        this.jumpToMainPage();
      }
    }, 1000);
  }

  clearTiming() {
    if (this.timer !== -1) {
      clearInterval(this.timer);
      this.timer = -1;
    }
  }

  jumpToMainPage() {
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
                .width(CC.FULL_PARENT)
                .height(CC.FULL_PARENT)
                .objectFit(ImageFit.Cover)
            })
          }
          .loop(true)
          .interval(2 * 1000)
          .duration(1000)
          .autoPlay(true)
          .indicatorStyle({
            bottom: Utils.vp(100),
            color: "#99FFFFFF"
          })
          .curve(Curve.Linear)
          .onChange((index: number) => {
            Logger.debug(index.toString())
            CCPreference.writeData(SPLASH_KEY, SPLASH_VALUE)
          })

          Text() {
            Span('跳过')
            Span(`${this.countdown}`)
          }
          .onClick(() => this.jumpToMainPage())
          .fontColor(Color.White)
          .fontSize(Utils.vp(12))
          .backgroundColor("#4d182431")
          .width(Utils.vp(63))
          .height(Utils.vp(24))
          .borderRadius(Utils.vp(10))
          .textAlign(TextAlign.Center)
          .position({
            x: '78%',
            y: Utils.vp(35)
          })
        } else {
          Image($r('app.media.splash_bg'))
            .width(CC.FULL_PARENT)
            .height(CC.FULL_PARENT)
          Image($r('app.media.ic_splash'))
            .width(Utils.vp(192))
            .height(Utils.vp(192))
            .offset({
              y: `-${'15%'}`
            })
            .objectFit(ImageFit.Contain)

          Column() {
            Text('鸿蒙系统')
              .fontColor(Color.White)
              .fontSize(Utils.vp(24))
              .fontWeight(FontWeight.Medium)

            Text('欢迎来到HmCase')
              .fontSize(Utils.vp(16))
              .fontColor(Color.White)
              .margin({
                top: Utils.vp(5)
              })
          }
          .offset({
            y: '25%'
          })
        }
      }
    }
    .height(CC.FULL_PARENT)
    .width(CC.FULL_PARENT)
  }
}