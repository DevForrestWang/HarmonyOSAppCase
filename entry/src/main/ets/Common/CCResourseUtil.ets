/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Logger from './Logger';

/**
 * Obtains the resource string.
 *
 * @param resource Resource path.
 * @returns Promise instance of a string.
 */
export async function getStringByRes(resource: Resource, component: Object): Promise<string> {
  if (!resource) {
    Logger.error('getStringByRes resource is invalid');
    return '';
  }
  let string = await getContext(component).resourceManager.getStringValue(resource.id);
  return string;
}