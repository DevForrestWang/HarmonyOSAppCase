import TaskInfo from '../ViewModel/TaskInfo'
import TaskModel from '../ViewModel/TaskModel'

@Component
export default struct TaskItem {
	@ObjectLink item: TaskInfo
	onTaskChange: (item: TaskInfo) => void

	build() {
		Row() {
			if (this.item.finished) {
				Text(this.item.name)
					.finishedTask()
			} else {
				Text(this.item.name)
			}
			Checkbox()
				.select(this.item.finished)
				.onChange(async val => {
					// 1.更新当前任务状态
					TaskModel.updateTaskStatus(this.item.id, val)
						.then(() => {
							this.item.finished = val
							// 2.更新已完成任务数量
							this.onTaskChange(this.item)
						})
						.catch(error => console.log('testTag', '更新任务状态失败, id = ', this.item.id, JSON.stringify(error)))

				})
		}
		.card()
		.justifyContent(FlexAlign.SpaceBetween)
	}
}

// 任务完成样式
@Extend(Text) function finishedTask() {
	.decoration({ type: TextDecorationType.LineThrough })
	.fontColor('#B1B2B1')
}

// 统一的卡片样式
@Styles function card() {
	.width('95%')
	.padding(20)
	.backgroundColor(Color.White)
	.borderRadius(15)
	.shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}