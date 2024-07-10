import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import WindowBarManager from '../Common/WindowBar';
import CM from '../Common/CCommon'
import TaskModel from '../pages/Case/TaskList/ViewModel/TaskModel';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    CM.Logger.info('Ability onCreate');

    // 初始化任务表
    TaskModel.initTaskDB(this.context)
  }

  onDestroy() {
    CM.Logger.info('Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    CM.Logger.info('testTag', '%{public}s', 'Ability onWindowStageCreate');

    const windowBarMag = new WindowBarManager();
    windowBarMag.immersiveWindow(windowStage, CM.Co.TRANSPARENT_COLOR, false);

    windowStage.loadContent('pages/Splash', (err: BusinessError, data) => {
      if (err.code) {
        CM.Logger.error('Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      CM.Logger.info('Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    CM.Logger.info('Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    CM.Logger.info('Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    CM.Logger.info('Ability onBackground');
  }
}
