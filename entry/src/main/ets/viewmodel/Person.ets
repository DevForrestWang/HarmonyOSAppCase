import ArrayList from '@ohos.util.ArrayList'
import HashMap from '@ohos.util.HashMap'
import Log from '../common/Logger'

export let pi = 3.14

export function baseFunc(a: number, b: number): number {

  // 每行指令都是一段语句，你可以使用分号或不使用， 分号在 TypeScript 中是可选的

  // 布尔值: true或者false
  let isDone: boolean = false

  // 数字: 数字都是浮点数，这些浮点数的类型是 number。除了支持十进制，还支持二进制、八进制、十六进制。
  let decLiteral: number = 2023
  let binaryLiteral: number = 0b11111100111
  let octalLiteral: number = 0o3747
  let hexLiteral: number = 0x7e7

  // 字符串: 使用 string表示文本数据类型， 可以使用双引号（ "）或单引号（'）表示字符串；反引号（`）来定义多行文本和内嵌表达式。
  // https://www.runoob.com/typescript/ts-string.html
  let name: string = "Jacky"
  name = 'Mick'
  let str = new String( "This is string")
  str.length // 字符串的长度
  str.charAt(0) //返回在指定位置的字符
  str.concat( " cat string" ) // 连接两个或更多字符串，并返回新的字符串。
  str.indexOf( "ing" ) // 返回某个指定的字符串值在字符串中首次出现的位置
  str.lastIndexOf("ing") // 从后向前搜索字符串，并从起始位置（0）开始计算返回字符串最后出现的位置。

  // match() 查找找到一个或多个正则表达式的匹配。
  let matchsStr="The rain in SPAIN stays mainly in the plain"
  let target = matchsStr.match(/ain/g) // ain,ain,ain

  // split() 把字符串分割为子字符串数组。
  let splitted = str.split(" ")
  Log.debug(splitted[1])

  // substr() 从起始索引号提取字符串中指定数目的字符。

  // substring() 提取字符串中两个指定的索引号之间的字符。
  Log.debug(str.substring(0, 10))

  // replace() 替换与正则表达式匹配的子串
  // search() 搜索 检索与正则表达式相匹配的值


  // Number对象
  // toFixed: 把数字转换为字符串，并对小数点指定位数。
  let baseNum = 177.23456
  Log.debug(baseNum.toFixed()) // 输出：177
  Log.debug(baseNum.toFixed(2))  //输出：177.23

  // toPrecision() 把数字格式化为指定的长度。
  Log.debug(baseNum.toPrecision(2)) // 输出：7.1

  // toString() 把数字转换为字符串数字的基数是 2 ~ 36 之间的整数。若省略该参数，则使用基数 10。
  Log.debug(baseNum.toString())  // 输出10进制：10

  // 数组 参考：https://www.runoob.com/typescript/ts-array.html
  // 在元素类型后面接上 []
  let listAry: number[] = [1, 2, 3]

  // 使用数组泛型，Array<元素类型>
  let listArray: Array<number> = [1, 2, 3]

  // 元组: 表示一个已知元素数量和类型的数组，各元素的类型不必相同
  let x: [string, number]
  x = ['hello', 10]
  Log.debug(`元组: ${x[0]}, ${x[1]}`)

  // 枚举: 使用枚举类型可以为一组数值赋予友好的名字
  enum Color {Red, Green, Blue};
  let c: Color = Color.Green;

  // Unknown: 在编程阶段还不清楚类型的变量指定一个类型。我们可以使用unknown类型来标记这些变量。
  let notSure: unknown = 4
  notSure = 'maybe a string instead'
  notSure = false;

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
  Log.debug("ArrayList类型：" + typeof list) // ArrayList类型：object
  let map = new HashMap<string, number>()
  Log.debug("HashMap类型：" + typeof map)  // HashMap类型：object
  Log.debug("Number类型：" + typeof decLiteral)  // Number类型：number
  Log.debug("string类型：" + typeof name) // string类型：string


  // 数据类型判断
  let checkType: Date | string
  checkType = new Date()
  if (checkType instanceof Date) {
    Log.debug("checkType is Date type")
  } else {
    Log.debug("checkType is string type")
  }

  // for..in 返回被迭代对象的键列表
  let listIteAry: number[] =  [4, 5, 6]
  for (let i in listIteAry) {
    Log.debug(i); // "0", "1", "2",
  }

  // for..of 返回被迭代对象的数字属性的值列表
  for (let i of listIteAry) {
    Log.debug(i.toString()); // 4, 5, 6
  }

  // 下标循环
  for (let i = 0; i < listIteAry.length; i++) {
    var num = listIteAry[i];
    Log.debug(`${num}`);
  }

  listIteAry.forEach((val, idx, array) => {
    // val: 当前值
    // idx：当前index
    // array: Array
    Log.debug(`forEach, val: ${val}, idx:${idx}, array: ${array}`)
  });

  listIteAry.every((val, idx, array) => {
    // val: 当前值
    // idx：当前index
    // array: Array
    Log.debug(`every, val: ${val}, idx:${idx}, array: ${array}`)
    return true // Continues
    // Return false will quit the iteration
  });


  // 使用 const、var 或 let 声明变量时, var 和 let 都允许更改变量中保存的内容，而 const 不允许。const 是 let 的增强，因为它防止重新分配给变量。
  // let关键字来代替大家所熟悉的JavaScript关键字var。 let是ES2015引入的关键字，它比var更加安全，因此被看做是声明变量的标准方式。

  // 模块导入、导入，支持多个导出
  // import { NewsData, XX  } from '../common/bean/NewsData'

  // 数据类型转换 字符串 与 整型
  // string to number
  Log.debug(Number('123').toString())
  Log.debug(parseInt('123').toString())
  Log.debug(parseFloat('123.45').toString())
  Log.debug(`${parseFloat('123.45')}`)

  if (isNaN(Number('abc1234'))) {
    Log.debug("The abc1234 is NaN")
  } else {
    Log.debug("The abc1234 is not NaN")
  }

  // number to string
  const myNumber = 1200;
  Log.debug(myNumber.toString(16))
  Log.debug(Math.abs(myNumber).toString(16))
  Log.debug(parseFloat(myNumber.toString()).toFixed(2))



  // string 函数
  // `Hello ${person}, today is ${date.toDateString()}!`;
  // "Hello ".concat(person, ", today is ").concat(date.toDateString(), "!");

  Log.debug("Hello World".split("").reverse().join(""))

  return a + b;
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
    this.name = name;
    this.age = age;
  }

  sayHello(): void {
    Log.debug("sayHello")
  }

  public getPersonInfo(): string {
    return ` My name is ${this.name} and age is ${this.age}`;
  }
}

/// 继承
export class Student extends Person {

  public tomObj: PersonInter = {
    name: "Tom",
    age: 18,
    sayHello: function() {
      Log.debug(`Hello, my name is ${this.name}!, age: ${this.age}`);
    }
  }

  constructor(name: string) {
    super(name, 18);
  }

  public sayHelloToTeacher(teacher: Person) {
    Log.debug(`Hello, ${teacher.name}, I'm ${this.name}.`);
  }
}

