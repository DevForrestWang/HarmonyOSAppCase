import { HeaderView } from '../../../View/HeaderView'
import CM from '../../../Common/CCommon'
import { StringData, MyDataSource } from './MyDataSource'

@Component
struct ChildComponent {
	@ObjectLink data: StringData

	build() {
		Column() {
			Text(this.data.message).fontSize(50)
				.onAppear(() => {
					console.info("appear:" + this.data.message)
				})
			Image(this.data.imgSrc)
				.width(500)
				.height(200)
		}.margin({ left: 10, right: 10 })
	}
}

@Entry
@Component
struct FwLazyForEachPage {
	@State data: MyDataSource = new MyDataSource();

	aboutToAppear() {
		for (let i = 0; i <= 50; i++) {
			let image = $r('app.media.fig4')
			if (i % 4 == 1) {
				image = $r('app.media.fig1')
			} else if (i % 4 == 2) {
				image = $r('app.media.fig2')
			} else if (i % 4 == 3) {
				image = $r('app.media.fig3')
			} else if (i % 4 == 4) {
				image = $r('app.media.fig4')
			}

			this.data.pushData(new StringData(`Hello ${i}`, image));
		}
	}

	build() {
		Column() {
			HeaderView({
				title: "数据懒加载",
				rightBtnName: $r('app.media.ic_birthdate'),
				rightAction: this.rightButtonAction
			})

			List({ space: 3 }) {
				LazyForEach(this.data, (item: StringData, index: number) => {
					ListItem() {
						ChildComponent({ data: item })
					}
					.onClick(() => {
						item.message += '0';
					})
				}, (item: StringData, index: number) => index.toString())
			}
			.cachedCount(5)
			.margin({ bottom: CM.Co.BAR_HEIGHT }) // 偏移导航栏高度

		}
		.width('100%')

	}

	rightButtonAction() {
		CM.Utils.toast('Button Action.')
	}
}

