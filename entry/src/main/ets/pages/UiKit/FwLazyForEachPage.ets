import { HeaderView } from '../../View/HeaderView';
import CM from '../../Common/CCommon'

@Entry
@Component
struct FwLazyForEachPage {
	@State message: string = 'Hello World'


	build() {
		Column() {
			HeaderView({title: "数据懒加载", rightBtnName: $r('app.media.ic_birthdate'), rightAction: this.rightButtonAction})
		}
		.width('100%')

	}

	rightButtonAction() {
		CM.Utils.toast('Button Action.')
	}

}