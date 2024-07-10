import { relationalStore } from '@kit.ArkData';
import TaskInfo from './TaskInfo';

class TaskModel {
	private rdbStore: relationalStore.RdbStore | undefined = undefined

	private tableName: string = 'TASK'

	/**
	 * 初始化任务表
	 */
	initTaskDB(context: Context): void {
		// 1.rdb配置
		const config:relationalStore.StoreConfig = {
			name: 'MyApplication.db',
			securityLevel: relationalStore.SecurityLevel.S1
		}

		// 2.初始化SQL语句
		const sql = `CREATE TABLE IF NOT EXISTS TASK (
                  ID INTEGER PRIMARY KEY AUTOINCREMENT,
                  NAME TEXT NOT NULL,
                  FINISHED bit
                 )`
		// 3.获取rdb
		relationalStore.getRdbStore(context, config, (err, rdbStore) => {
			if (err) {
				console.log('testTag', '获取rdbStore失败！')
				return
			}
			// 执行Sql
			rdbStore.executeSql(sql)
			console.log('testTag', '创建task表成功！')
			// 保存rdbStore
			this.rdbStore = rdbStore
		})
	}

	/**
	 * 查询任务列表
	 */
	async getTaskList(): Promise<TaskInfo[]> {
		// 1.构建查询条件
		let predicates = new relationalStore.RdbPredicates(this.tableName)
		// 2.查询

		// 3.解析查询结果
		// 3.1.定义一个数组，组装最终的查询结果
		let tasks: TaskInfo[] = []

		if (this.rdbStore != undefined) {
			let result = await this.rdbStore.query(predicates, ['ID', 'NAME', 'FINISHED'])

			// 3.2.遍历封装
			while (!result.isAtLastRow) {
				// 3.3.指针移动到下一行
				result.goToNextRow()
				// 3.4.获取数据
				let id = result.getLong(result.getColumnIndex('ID'))
				let name = result.getString(result.getColumnIndex('NAME'))
				let finished = result.getLong(result.getColumnIndex('FINISHED'))
				// 3.5.封装到数组
				let task = new TaskInfo(id, name)
				task.finished = !!finished
				tasks.push(task)
			}
		}

		console.log('testTag', '查询到数据：', JSON.stringify(tasks))
		return tasks
	}

	/**
	 * 添加一个新的任务
	 * @param name 任务名称
	 * @returns 任务id
	 */
	addTask(name: string): Promise<number> {
		return new Promise((resolve: Function, reject: Function) => {
			if (this.rdbStore != undefined) {
				let result = this.rdbStore.insert(this.tableName, { name, finished: false })
				resolve(result)
			} else  {
				reject('插入数据失败')
			}
		})
	}

	/**
	 * 根据id更新任务状态
	 * @param id 任务id
	 * @param finished 任务是否完成
	 */
	updateTaskStatus(id: number, finished: boolean): Promise<number> {
		return new Promise((resolve: Function, reject: Function) => {
			if (this.rdbStore != undefined) {
				// 1.要更新的数据
				let data:relationalStore.ValuesBucket = {
					'FINISHED': finished
				}
				// 2.更新的条件
				let predicates = new relationalStore.RdbPredicates(this.tableName)
				predicates.equalTo('ID', id)
				// 3.更新操作
				let result = this.rdbStore.update(data, predicates)
				resolve(result)
			} else  {
				reject('更新数据失败')
			}
		})
	}

	/**
	 * 根据id删除任务
	 * @param id 任务id
	 */
	deleteTaskById(id: number): Promise<number> {
		return new Promise((resolve: Function, reject: Function) => {
			if (this.rdbStore != undefined) {
				// 1.删除的条件
				let predicates = new relationalStore.RdbPredicates(this.tableName)
				predicates.equalTo('ID', id)
				// 2.删除操作
				let result = this.rdbStore.delete(predicates)
				resolve(result)
			} else  {
				reject('删除数据失败')
			}
		})
	}
}

let taskModel = new TaskModel();

export default taskModel as TaskModel;
