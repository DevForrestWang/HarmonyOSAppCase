import CCPreference from '../../../common/CCPreference';

const KEY_APP_FONT_SIZE = 'appFontSize'

export class SaveFontSizeUtil {

  saveChangeFontSize(fontSize: number) {
    if (fontSize === undefined) {
      return
    }
    CCPreference.writeData(KEY_APP_FONT_SIZE, fontSize.toString())
  }

  async getChangeFontSize(): Promise<string>  {
    let fontSize = await CCPreference.getData(KEY_APP_FONT_SIZE)
    return fontSize
  }

  async deleteChangeFontSize() {
    CCPreference.deleteData(KEY_APP_FONT_SIZE);
  }
}
export default new SaveFontSizeUtil();