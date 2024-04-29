import CM from '../../Common/CCommon'
import BaseNaView from '../../View/BaseNavigationView'

/// UI组件：Text
@Entry
@Component
struct FwTextDemoPage {

  build() {

    Scroll(){
      BaseNaView({title: 'UI组件：Text'}){

        Column({ space: 10 }) {
          // 文本水平方向对齐方式设置
          // 单行文本
          Text('textAlign:').fontSize(14).fontColor(Color.Green)
          Text('TextAlign set to Center.')
            .textAlign(TextAlign.Center)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('TextAlign set to Start.')
            .textAlign(TextAlign.Start)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('TextAlign set to End.')
            .textAlign(TextAlign.End)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          // 多行文本
          Text('This is the text content with textAlign set to Center.')
            .textAlign(TextAlign.Center)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('This is the text content with textAlign set to Start.')
            .textAlign(TextAlign.Start)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('This is the text content with textAlign set to End.')
            .textAlign(TextAlign.End)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          // 文本超长时显示方式
          Text('TextOverflow+maxLines: ').fontSize(14).fontColor(Color.Green).margin({top: CM.Utils.vp(20)})
          // 超出maxLines截断内容展示
          Text('This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content. This is the setting of textOverflow to Clip text content This is the setting of textOverflow to None text content.')
            .textOverflow({ overflow: TextOverflow.Clip })
            .maxLines(1)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)

          // 超出maxLines展示省略号
          Text('This is set textOverflow to Ellipsis text content This is set textOverflow to Ellipsis text content.'.split('')
            .join('\u200B'))
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)

          Text('lineHeight').fontSize(14).fontColor(Color.Green).margin({top: CM.Utils.vp(20)})
          Text('This is the text with the line height set. This is the text with the line height set.')
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          Text('This is the text with the line height set. This is the text with the line height set.')
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .lineHeight(20)
            .width(CM.Co.FULL_PARENT)

          Text('decoration:').fontSize(14).fontColor(Color.Green).margin({top: CM.Utils.vp(20)})
          Text('This is the text content with the decoration set to LineThrough and the color set to Red.')
            .decoration({
              type: TextDecorationType.LineThrough,
              color: Color.Red
            })
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          Text('This is the text content with the decoration set to Overline and the color set to Red.')
            .decoration({
              type: TextDecorationType.Overline,
              color: Color.Green
            })
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          Text('This is the text content with the decoration set to Underline and the color set to Red.')
            .decoration({
              type: TextDecorationType.Underline,
              color: Color.Orange
            })
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          // 文本基线偏移
          Text('baselineOffset').fontSize(14).fontColor(Color.Green).margin({top: CM.Utils.vp(20)})
          Text('This is the text content with baselineOffset 0.')
            .baselineOffset(0)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('This is the text content with baselineOffset 30.')
            .baselineOffset(30)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('This is the text content with baselineOffset -20.')
            .baselineOffset(-20)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          // 文本字符间距
          Text('letterSpacing').fontSize(14).fontColor(Color.Green).margin({top: CM.Utils.vp(20)})
          Text('This is the text content with letterSpacing 0.')
            .letterSpacing(0)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('This is the text content with letterSpacing 3.')
            .letterSpacing(3)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)
          
          Text('This is the text content with letterSpacing -1.')
            .letterSpacing(-1)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          Text('textCase').fontSize(14).fontColor(Color.Green).margin({top: CM.Utils.vp(20)})
          Text('This is the text content with textCase set to Normal.')
            .textCase(TextCase.Normal)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          // 文本全小写展示
          Text('This is the text content with textCase set to LowerCase.')
            .textCase(TextCase.LowerCase)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

          // 文本全大写展示
          Text('This is the text content with textCase set to UpperCase.')
            .textCase(TextCase.UpperCase)
            .fontSize(12)
            .border({ width: 1 })
            .padding(10)
            .width(CM.Co.FULL_PARENT)

        }
        .width(CM.Co.FULL_PARENT)
        .padding({ left: 35, right: 35, top: 15 })

      }
    }

  }
}