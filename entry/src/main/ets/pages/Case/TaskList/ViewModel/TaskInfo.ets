@Observed
export default class TaskInfo {
	id: number
	// 任务名称
	name: string
	// 任务状态：是否完成
	finished: boolean

	constructor(id: number, name: string) {
		this.id = id
		this.name = name
		this.finished = false
	}
}