import ChatItemComponent from '../view/ChatItemComponent';
import TitleBarComponent from '../../../view/TitleBarComponent';
import SetViewModel from '../viewmodel/SetViewModel';
import CommonConstants from '../common/CommonConstants';
import StyleConstants from '../common/StyleConstants';
import Logger from '../../../common/FWLog';
import SaveFontSizeUtil from '../common/SaveFontSizeUtil';
import ChatData from '../viewmodel/ChatData';
import CC from '../../../common/CConstants'


@Entry
@Component
struct SetFontSizePage {
  private contentArr = SetViewModel.initChatData();
  @State changeFontSize: number = 0;
  @State fontSizeText: string = "Normal";

  onPageShow() {
    SaveFontSizeUtil.getChangeFontSize().then((value) => {
      if (value <= 14) {
        value = 14
      }
      this.changeFontSize = value;
      this.fontSizeText = SetViewModel.getTextByFontSize(value);
      Logger.info('Get the value of changeFontSize: ' + this.changeFontSize);
    });
  }

  build() {
    Column() {
      TitleBarComponent({ title: "Font size settings" })

      if (this.changeFontSize > 0) {
        List() {
          ForEach(this.contentArr, (item: ChatData) => {
            ListItem() {
              ChatItemComponent({ item: item, changeFontSize: this.changeFontSize })
            }
          }, (item: ChatData) => JSON.stringify(item))
        }
        .layoutWeight(StyleConstants.WEIGHT_FULL)
      }

      SliderLayout({ fontSizeText: $fontSizeText, changeFontSize: $changeFontSize })
    }
    .backgroundColor($r('sys.color.ohos_id_color_sub_background'))
    .height(StyleConstants.FULL_HEIGHT)
    .width(StyleConstants.FULL_WIDTH)
  }
}

@Component
struct SliderLayout {
  @Link fontSizeText: string;
  @Link changeFontSize: number;

  build() {
    Column() {
      Text("Text size")
        .fontSize(CC.vp(14))
        .fontColor("#182431")
        .margin({ left: StyleConstants.SLIDER_LAYOUT_LEFT_PERCENT, top: StyleConstants.SLIDER_LAYOUT_TOP_PERCENT })
        .fontWeight(FontWeight.Medium)

      Column() {
        Text(this.fontSizeText)
          .fontSize(CC.vp(14))
          .fontColor("#182431")

        Row() {
          Text("A")
            .fontColor("#182431")
            .fontSize(CC.vp(20))
            .fontWeight(FontWeight.Medium)
            .textAlign(TextAlign.End)
            .width(StyleConstants.A_WIDTH_PERCENT)
            .padding({ right: CC.vp(9) })

          Slider({
            value: this.changeFontSize === CommonConstants.SET_SIZE_HUGE
              ? CommonConstants.SET_SLIDER_MAX : this.changeFontSize,
            min: CommonConstants.SET_SLIDER_MIN,
            max: CommonConstants.SET_SLIDER_MAX,
            step: CommonConstants.SET_SLIDER_STEP,
            style: SliderStyle.InSet
          })
            .showSteps(true)
            .width(StyleConstants.SLIDER_WIDTH_PERCENT)
            .onChange(async (value: number) => {
              if (this.changeFontSize === 0) {
                this.changeFontSize = await SaveFontSizeUtil.getChangeFontSize();
                this.fontSizeText = SetViewModel.getTextByFontSize(value);
                return;
              }
              this.changeFontSize = (value === CommonConstants.SET_SLIDER_MAX ?
              CommonConstants.SET_SIZE_HUGE : value);
              this.fontSizeText = SetViewModel.getTextByFontSize(this.changeFontSize);
              SaveFontSizeUtil.saveChangeFontSize(this.changeFontSize);
            })

          Text("A")
            .fontColor("#182431")
            .fontSize(CC.vp(24))
            .fontWeight(FontWeight.Bold)
            .width(StyleConstants.A_WIDTH_PERCENT)
            .padding({ left: CC.vp(8) })
        }
      }
      .backgroundColor(Color.White)
      .borderRadius(CC.vp(24))
      .width(StyleConstants.BLOCK_WIDTH_PERCENT)
      .padding({ top: CC.vp(16), bottom: CC.vp(21) })
      .margin({
        left: StyleConstants.SLIDER_HORIZONTAL_MARGIN_PERCENT,
        right: StyleConstants.SLIDER_HORIZONTAL_MARGIN_PERCENT,
        top: StyleConstants.SLIDER_TOP_MARGIN_PERCENT,
        bottom: StyleConstants.SLIDER_BOTTOM_MARGIN_PERCENT
      })
    }
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.End)
  }
}