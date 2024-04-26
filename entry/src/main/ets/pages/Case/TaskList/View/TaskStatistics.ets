// 统一的卡片样式
@Styles function card() {
	.width('95%')
	.padding(20)
	.backgroundColor(Color.White)
	.borderRadius(15)
	.shadow({ radius: 6, color: '#1F000000', offsetX: 2, offsetY: 4 })
}

@Component
export default struct TaskStatistics {
	@Prop totalTask: number
	@Prop finishTask: number

	build() {
		Row() {
			Text('任务进度：')
				.fontSize(30)
				.fontWeight(FontWeight.Bold)
			Stack() {
				Progress({
					value: this.finishTask,
					total: this.totalTask,
					type: ProgressType.Ring
				})
					.width(100)
				Row() {
					Text(this.finishTask.toString())
						.fontSize(24)
						.fontColor('#36D')
					Text(' / ' + this.totalTask.toString())
						.fontSize(24)
				}
			}
		}
		.card()
		.margin({ top: 5, bottom: 10 })
		.justifyContent(FlexAlign.SpaceEvenly)
	}
}