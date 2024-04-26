import BaseNaView from '../../../../view/BaseNavigationView'
import TaskList from '../View/TaskList'
import TaskStatistics from '../View/TaskStatistics'

@Entry
@Component
struct TaskListPage {
	@State totalTask: number = 0
	@State finishTask: number = 0

	build() {

		Column() {
			BaseNaView({ title: '任务列表', hasScroll: false }) {
				// 任务进度卡片
				TaskStatistics({ totalTask: this.totalTask, finishTask: this.finishTask })
				// 任务列表
				TaskList({ totalTask: $totalTask, finishTask: $finishTask })
			}

		}
	}
}