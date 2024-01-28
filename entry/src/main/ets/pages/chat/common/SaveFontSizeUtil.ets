// @ts-nocheck
import Logger from '../../../common/FWLog';
import PreferencesUtil from '../../../common/Preferencesutil';
const KEY_APP_FONT_SIZE = 'appFontSize';

export class SaveFontSizeUtil {

  saveChangeFontSize(fontSize: number) {
    PreferencesUtil.saveObject(KEY_APP_FONT_SIZE, fontSize)
  }

  async getChangeFontSize() {
    let fontSize: number = PreferencesUtil.getObject(KEY_APP_FONT_SIZE);
    return fontSize;
  }

  async deleteChangeFontSize() {
    PreferencesUtil.deleteObject(KEY_APP_FONT_SIZE);
  }
}

export default new SaveFontSizeUtil();