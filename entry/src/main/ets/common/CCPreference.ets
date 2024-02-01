import dataPreferences from '@ohos.data.preferences';
import Logger from './Logger';
import Utils from './CCUtils'

let context = getContext(this);
let preference: dataPreferences.Preferences;
let preferenceTemp: dataPreferences.Preferences;

// The name of the data store.
const PREFERENCES_NAME = 'CCPreferences.db';

/**
 * Preference model.
 *
 * @param fruitData Fruit data.
 */
class CCPreference {

  /**
   * Read the specified Preferences persistence file and load the data into the Preferences instance.
   */
  private async getPreferencesFromStorage() {
    try {
      preference = await dataPreferences.getPreferences(context, PREFERENCES_NAME);
    } catch (err) {
      Logger.error(`Failed to get preferences, Cause: ${err}`);
    }
  }

  /**
   * Save the data to the Preferences.
   */
  public async writeData(key: string, value: string) {
    if (Utils.isEmpty(key) || Utils.isEmpty(value)) {
      return;
    }

    if (!preference) {
      await this.getPreferencesFromStorage();
    }

    try {
      await preference.put(key, value);
    } catch (err) {
      Logger.error(`Failed to put value, Cause: ${err}`);
    }
    // Store the Preference instance in the preference persistence file
    await preference.flush();
  }

  /**
   * Get preference data.
   */
  public async getData(key: string) {
    let value: string | undefined
    if (Utils.isEmpty(key)) {
      return value;
    }

    if (!preference) {
      await this.getPreferencesFromStorage();
    }
    try {
      value = (await preference.get(key, '')).toString();
    } catch (err) {
      Logger.error(`Failed to get value, Cause: ${err}`);
    }

    return value;
  }

  /**
   * 删除保存数据
   */
  public async deleteData(key: string) {
    if (Utils.isEmpty(key)) {
      return;
    }

    if (!preference) {
      await this.getPreferencesFromStorage();
    }

    let deleteValue = preference.delete(key)
    deleteValue.then(() => {
      Logger.info('Succeeded in deleting the key appFontSize.')
    }).catch((err: Error) => {
      Logger.error(`Failed to delete the key appFontSize. Cause: ${err}`)
    });
  }

  /**
   * Deletes the specified Preferences persistence file from memory and removes the Preferences instance.
   */
  public async deletePreferences() {
    try {
      await dataPreferences.deletePreferences(context, PREFERENCES_NAME);
    } catch(err) {
      Logger.error(`Failed to delete preferences, Cause: ${err}`);
    };
    preference = preferenceTemp;
  }

}
export default new CCPreference();