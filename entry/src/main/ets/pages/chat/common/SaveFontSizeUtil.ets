import CM from '../../../common/CCommon'

const KEY_APP_FONT_SIZE = 'appFontSize'

export class SaveFontSizeUtil {

  saveChangeFontSize(fontSize: number): void {
    if (fontSize === undefined) {
      return
    }
    CM.CCPreference.writeData(KEY_APP_FONT_SIZE, fontSize.toString())
  }

  async getChangeFontSize(): Promise<string>  {
    let fontSize = await CM.CCPreference.getData(KEY_APP_FONT_SIZE)
    return fontSize
  }

  async deleteChangeFontSize(): Promise<void> {
    CM.CCPreference.deleteData(KEY_APP_FONT_SIZE);
  }
}
export default new SaveFontSizeUtil();