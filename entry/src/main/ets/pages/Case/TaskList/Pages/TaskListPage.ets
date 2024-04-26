import CM from '../../../../common/CCommon'
import BaseNaView from '../../../../view/BaseNavigationView'

@Entry
@Component
struct TaskListPage {
	build() {

		Column() {
			BaseNaView({ title: '任务列表', hasScroll: false }) {

			}

		}
	}
}