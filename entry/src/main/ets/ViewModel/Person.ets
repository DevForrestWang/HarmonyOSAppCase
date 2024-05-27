import ArrayList from '@ohos.util.ArrayList'
import HashMap from '@ohos.util.HashMap'
import CM from '../Common/CCommon'

export let pi = 3.14

export function runAllMethod() {
	baseFunc(5, 6)
	numberMethod()
	stringMethod()
	numberToString()
	arrayMethod()
	mapMethod()
	iterationMethod()
}

/// 基本数据类型
function baseFunc(a: number, b: number): number {

	// 每行指令都是一段语句，你可以使用分号或不使用， 分号在 TypeScript 中是可选的
	// 布尔值: true或者false
	let isDone: boolean = false

	// 数字: 数字都是浮点数，这些浮点数的类型是 number。除了支持十进制，还支持二进制、八进制、十六进制。
	let decLiteral: number = 2023
	let binaryLiteral: number = 0b11111100111
	let octalLiteral: number = 0o3747
	let hexLiteral: number = 0x7e7

	// 数组 参考：https://www.runoob.com/typescript/ts-array.html
	// 在元素类型后面接上 []
	let listAry: number[] = [1, 2, 3]

	// 使用数组泛型，Array<元素类型>
	let listArray: Array<number> = [1, 2, 3]

	// 元组: 表示一个已知元素数量和类型的数组，各元素的类型不必相同
	let x: [string, number]
	x = ['hello', 10]
	CM.Logger.debug(`元组: ${x[0]}, ${x[1]}`)

	// 枚举: 使用枚举类型可以为一组数值赋予友好的名字
	enum Color {Red, Green, Blue}

	let c: Color = Color.Green

	// Unknown: 在编程阶段还不清楚类型的变量指定一个类型。我们可以使用unknown类型来标记这些变量。
	let notSure: unknown = 4
	notSure = 'maybe a string instead'
	notSure = false

	// Void: 当函数没有返回值时，你通常会见到其返回值类型是 void。

	// Null 和 Undefined: undefined和null两者各自有自己的类型分别叫做undefined和null。
	let u: undefined = undefined
	let n: null = null

	// 联合类型（Union Types）表示取值可以为多种类型中的一种。
	let myFavoriteNumber: string | number
	myFavoriteNumber = 'seven'
	myFavoriteNumber = 7

	// 数据类型判断， 判断字符串、整型、对象
	// 使用：typeof strs === "string" typeof strs === "object" typeof padding === "number"
	let list = new ArrayList<number>()
	CM.Logger.debug("ArrayList类型：" + typeof list) // ArrayList类型：object
	let map = new HashMap<string, number>()
	CM.Logger.debug("HashMap类型：" + typeof map) // HashMap类型：object
	CM.Logger.debug("Number类型：" + typeof decLiteral) // Number类型：number
	CM.Logger.debug("string类型：" + typeof 'Mick') // string类型：string

	// 数据类型判断
	let checkType: Date | string
	checkType = new Date()
	if (checkType instanceof Date) {
		CM.Logger.debug("checkType is Date type")
	} else {
		CM.Logger.debug("checkType is string type")
	}

	// let是ES2015引入的关键字，来代替JavaScript关键字var，它比var更加安全，因此被看做是声明变量的标准方式。
	// let和var都允许更改变量中保存的内容；const不允许，const是let的增强，它防止重新分配给变量。
	const constStr: String = 'hello'

	// undefined 和 null 作为值
	let age: number = 24
	age = null
	age = undefined

	// 作为类型
	let udType: undefined = undefined
	let nullType: null = null

	let udNul: undefined = null
	let hulUd: null = undefined

	let anyUd: any = undefined
	let unKnowNul: unknown = null

	// 模块导入、导入
	// import { NewsData, XX  } from '../XX' key导出多个属性或对象
	// import AA from '../BB' 导出含有缺省对象

	return a + b
}

/// Number对象
function numberMethod() {
	// Number 对象属性
	CM.Logger.debug("TypeScript Number 属性: ")
	CM.Logger.debug("最大值为: " + Number.MAX_VALUE)
	CM.Logger.debug("最小值为: " + Number.MIN_VALUE)
	CM.Logger.debug("负无穷大: " + Number.NEGATIVE_INFINITY)
	CM.Logger.debug("正无穷大:" + Number.POSITIVE_INFINITY)

	// Number 对象方法
	//toExponential: 把对象的值转换为指数计数法。
	let num1 = 1225.30
	let val = num1.toExponential()
	CM.Logger.debug(val) // 输出： 1.2253e+

	// toFixed: 把数字转换为字符串，并对小数点指定位数。
	let num2 = 177.236
	CM.Logger.debug("num3.toFixed() 为 " + num2.toFixed()) // 输出：177
	CM.Logger.debug("num3.toFixed(2) 为 " + num2.toFixed(2)) // 输出：177.23
	CM.Logger.debug("num3.toFixed(6) 为 " + num2.toFixed(6)) // 输出：177.234000

	// toPrecision: 把数字格式化为指定的长度
	let num3 = new Number(7.123456)
	CM.Logger.debug(num3.toPrecision()) // 输出：7.123456
	CM.Logger.debug(num3.toPrecision(1)) // 输出：7
	CM.Logger.debug(num3.toPrecision(2)) // 输出：7.1
	CM.Logger.debug(num3.toPrecision(6)) // 输出：7.12346

	// valueOf: 返回一个 Number 对象的原始数字值。
	let num4 = new Number(10)
	CM.Logger.debug(`${num4.valueOf()}`) // 输出：10

	CM.Logger.debug(`${num4.valueOf()}`) // 输出：10
}

/// String 方法
function stringMethod() {
	/// String 方法
	let str = new String("This is string")
	str.length // 字符串的长度
	str.concat(" cat string") // 连接两个或更多字符串，并返回新的字符串。

	// substring() 提取字符串中两个指定的索引号之间的字符。
	CM.Logger.debug(str.substring(0, 10)) // This is st,

	// charAt: 返回在指定位置的字符。
	let str1 = new String("RUNOOB")
	CM.Logger.debug("str.charAt(0) 为:" + str1.charAt(0)) // R

	// indexOf: 返回某个指定的字符串值在字符串中首次出现的位置。
	let str2 = new String("RUNOOB")
	let index = str2.indexOf("OO")
	CM.Logger.debug("查找的字符串位置 :" + index) // 3

	// match: 查找找到一个或多个正则表达式的匹配。
	let str3 = "The rain in SPAIN stays mainly in the plain"
	let match3 = str3.match(/ain/g) // ain,ain,ain

	// 	replace: 替换与正则表达式匹配的子串
	var re4 = /(\w+)\s(\w+)/
	var str4 = "zara ali"
	var str41 = str4.replace(re4, "$2, $1")
	CM.Logger.debug(str41) // ali, zara

	// 	search: 检索与正则表达式相匹配的值
	let re5 = /apples/gi
	let str5 = "Apples are round, and apples are juicy."
	if (str5.search(re5) == -1) {
		CM.Logger.debug("Does not contain Apples")
	} else {
		CM.Logger.debug("Contains Apples") // Contains Apples
	}

	// split: 把字符串分割为子字符串数组。
	let str6 = "Apples are round, and apples are juicy."
	let str6Ary = str6.split(" ", 3)
	CM.Logger.debug(str6Ary.toString()) // Apples,are,round

	// valueOf: 返回指定字符串对象的原始值。
	let str7 = new String("Runoob")
	CM.Logger.debug(str7.valueOf()) // Runoob
}

/// 字符串与数字相互转换
function numberToString() {
	// 数据类型转换 字符串 与 整型
	// string to number
	CM.Logger.debug(Number('123').toString())
	CM.Logger.debug(parseInt('123').toString())
	CM.Logger.debug(parseFloat('123.45').toString())
	CM.Logger.debug(`${parseFloat('123.45')}`)

	if (isNaN(Number('abc1234'))) {
		CM.Logger.debug("The abc1234 is NaN")
	} else {
		CM.Logger.debug("The abc1234 is not NaN")
	}

	// number to string
	const myNumber = 1200
	CM.Logger.debug(myNumber.toString(16))
	CM.Logger.debug(Math.abs(myNumber).toString(16))
	CM.Logger.debug(parseFloat(myNumber.toString()).toFixed(2))
}

/// 数组方法
function arrayMethod() {
	// concat: 连接两个或更多的数组，并返回结果。
	let alpha = ["a", "b", "c"]
	let alphaNumeric = alpha.concat(['d', 'e'])
	CM.Logger.debug("alphaNumeric : " + alphaNumeric) // a,b,c,d,e

	// 	every: 检测数值元素的每个元素是否都符合条件。
	function isBigEnough(element, index, array) {
		return (element >= 10)
	}

	let everyResult = [12, 5, 8, 130, 44].every(isBigEnough);
	CM.Logger.debug("Test Value : " + everyResult) // false

	// filter: 检测数值元素，并返回符合条件所有元素的数组。
	let filterResult = [12, 5, 8, 130, 44].filter(isBigEnough);
	CM.Logger.debug("Test Value : " + filterResult) // 12,130,44

	// forEach: 数组每个元素都执行一次回调函数。
	let num = [7, 8, 9]
	num.forEach(function (value) {
		CM.Logger.debug(`${value}`) // 7,8,9
	});

	// indexOf: 搜索数组中的元素，并返回它所在的位置，如果搜索不到，返回值 -1，代表没有此项。
	let index = [12, 5, 8, 130, 44].indexOf(8)
	CM.Logger.debug("index is : " + index); // 2

	// join: 把数组的所有元素放入一个字符串。
	let jArr = new Array("Google", "Runoob", "Taobao");
	CM.Logger.debug("str : " + jArr.join()); // Google,Runoob,Taobao
	CM.Logger.debug("str : " + jArr.join(" + ")); // Google + Runoob + Taobao

	// lastIndexOf: 返回一个指定的字符串值最后出现的位置，在一个字符串中的指定位置从后向前搜索。
	var lastIndex = [12, 5, 8, 130, 44].lastIndexOf(130);
	CM.Logger.debug("index is : " + lastIndex); // 3

	// 	map: 通过指定函数处理数组的每个元素，并返回处理后的数组。
	var numbers = [1, 4, 9];
	var roots = numbers.map(Math.sqrt);
	CM.Logger.debug("roots is : " + roots); // 1,2,3

	// pop: 删除数组的最后一个元素并返回删除的元素。
	var element = numbers.pop();
	CM.Logger.debug("element is : " + element); // 9

	// push: 向数组的末尾添加一个或更多元素，并返回新的长度。
	var length = numbers.push(10);
	CM.Logger.debug("new numbers is : " + numbers); // 1,4,10

	// reverse: 反转数组的元素顺序。
	var reverArr = [0, 1, 2, 3].reverse();
	CM.Logger.debug("Reversed array is : " + reverArr); // 3,2,1,0

	// shift: 删除并返回数组的第一个元素。
	CM.Logger.debug("Shifted value is : " + [10, 1, 2, 3].shift()); // 10

	// slice: 选取数组的的一部分，并返回一个新数组。
	var sliceArr = ["orange", "mango", "banana", "sugar", "tea"];
	CM.Logger.debug("arr.slice( 1, 3) : " + sliceArr.slice(1, 3)); // mango,banana

	// some: 检测数组元素中是否有元素符合指定条件。
	var retval = [2, 5, 8, 1, 4].some(isBigEnough);
	CM.Logger.debug("Returned value is : " + retval); // false

	var retval = [12, 5, 8, 1, 4].some(isBigEnough);
	CM.Logger.debug("Returned value is : " + retval); // true

	// sort: 对数组的元素进行排序。
	var sortArr = new Array("orange", "mango", "banana", "sugar");
	CM.Logger.debug("Returned string is : " + sortArr.sort()); // banana,mango,orange,sugar

	{
		// splice: 从数组中添加或删除元素。
		var arr = ["orange", "mango", "banana", "sugar", "tea"];
		var removed = arr.splice(2, 0, "water");
		CM.Logger.debug("After adding 1: " + arr); // orange,mango,water,banana,sugar,tea
		CM.Logger.debug("removed is: " + removed);

		removed = arr.splice(3, 1);
		CM.Logger.debug("After removing 1: " + arr); // orange,mango,water,sugar,tea
		CM.Logger.debug("removed is: " + removed); // banana
	}

	{
		// toString: 把数组转换为字符串，并返回结果。
		var arr = new Array("orange", "mango", "banana", "sugar");
		CM.Logger.debug("Returned string is : " + arr.toString()); // orange,mango,banana,sugar
	}

	{
		// unshift: 向数组的开头添加一个或更多元素，并返回新的长度。
		var arr = new Array("orange", "mango", "banana", "sugar");
		var length = arr.unshift("water");
		CM.Logger.debug("Returned array is : " + arr); // water,orange,mango,banana,sugar
		CM.Logger.debug("Length of the array is : " + length); // 5
	}
}

// Map 方法
function mapMethod() {
	CM.Logger.debug('Enter mapMethod');
	let nameSiteMapping = new Map()

	// 设置 Map 对象
	nameSiteMapping.set("Google", 1)
	nameSiteMapping.set("Runoob", 2)
	nameSiteMapping.set("Taobao", 3)

	// 迭代 Map 中的 key
	for (let key of nameSiteMapping.keys()) {
		CM.Logger.debug(key); // Google ...
	}

	// 迭代 Map 中的 value
	for (let value of nameSiteMapping.values()) {
		CM.Logger.debug("value: " + value);  // value: 1 ...
	}

	// 使用对象解析
	for (let [key, value] of nameSiteMapping) {
		CM.Logger.debug("key:" + key + ", value:" + value) //  key:Google, value:1 ...
	}

	// 获取键对应的值
	CM.Logger.debug("get:" + nameSiteMapping.get("Runoob")) // 2

	// 判断 Map 中是否包含键对应的值
	CM.Logger.debug("Has: " + nameSiteMapping.has("Taobao")) // true
	CM.Logger.debug("Has: " + nameSiteMapping.has("Zhihu")) // false

	// 返回 Map 对象键/值对的数量
	CM.Logger.debug("size: " + nameSiteMapping.size) // 3

	// 删除 Runoob
	CM.Logger.debug("delete: " + nameSiteMapping.delete("Runoob")) // true

	// 移除 Map 对象的所有键/值对
	nameSiteMapping.clear() // 清除 Map
}

/// 循环迭代
function iterationMethod() {
	// for..in 返回被迭代对象的键列表
	let listIteAry: number[] = [4, 5, 6]
	for (let i in listIteAry) {
		CM.Logger.debug(i) // "0", "1", "2",
	}

	// for..of 返回被迭代对象的数字属性的值列表
	for (let i of listIteAry) {
		CM.Logger.debug(i.toString()) // 4, 5, 6
	}

	// 下标循环
	for (let i = 0; i < listIteAry.length; i++) {
		var num = listIteAry[i]
		CM.Logger.debug(`${num}`)
	}

	listIteAry.forEach((val, idx, array) => {
		// val: 当前值
		// idx：当前index
		// array: Array
		CM.Logger.debug(`forEach, val: ${val}, idx:${idx}, array: ${array}`)
	})

	listIteAry.every((val, idx, array) => {
		// val: 当前值
		// idx：当前index
		// array: Array
		CM.Logger.debug(`every, val: ${val}, idx:${idx}, array: ${array}`)
		return true // Continues
		// Return false will quit the iteration
	})
}

// 接口
interface PersonInter {
	name: string
	age: number

	sayHello(): void
}

// 接口实现
export class Person implements PersonInter {
	public name: string
	public age: number

	constructor(name: string, age: number) {
		this.name = name
		this.age = age
	}

	sayHello(): void {
		CM.Logger.debug("sayHello")
	}

	public getPersonInfo(): string {
		return ` My name is ${this.name} and age is ${this.age}`
	}
}

/// 继承
export class Student extends Person {
	public tomObj: PersonInter = {
		name: "Tom",
		age: 18,
		sayHello: function () {
			CM.Logger.debug(`Hello, my name is ${this.name}!, age: ${this.age}`)
		}
	}

	constructor(name: string) {
		super(name, 18)
	}

	public sayHelloToTeacher(teacher: Person) {
		CM.Logger.debug(`Hello, ${teacher.name}, I'm ${this.name}.`)
	}
}

