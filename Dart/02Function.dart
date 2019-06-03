
/// 函数也是一个类型`Function`, 继承自 Object
/// 所有的函数都返回一个值。如果没有指定返回值，则 默认把语句 return null; 作为函数的最后一个语句执行。

var _nobleGases = [1, 2, 3];
// type 1
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// type 2
isNoble2(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

// type 3: 箭头函数，只能是一行语句
bool isNoble3(int atomicNumber) => _nobleGases[atomicNumber] != null;

/// 可选命名参数 Map
// 可选命名参数：使用 {} 包起来的参数是可选命名参数
// 用 {} 包起来的参数是可选命名参数，前面讲数据类型的时候，使用 {} 来赋值的数据类型是 Map，所以可选的命名参数的类型也是 Map， 因此调用函数时，可选参数的赋值必须是 paramName: value 这种 key: value 格式的，下面是可选命名参数的例子：

bool say(String msg, {String from, int clock}) {
  print(msg + " from " + from + " at " + clock.toString());
  return true;
}
// 这里参数 from 就是可选命名参数。

testSay() {
  // 要调用 say 函数，方法如下：
  say('Hello Flutter'); //✅ 因为 from 和 clock 是可选参数，所以可以不填

  say('Hello Flutter', from: 'XiaoMing'); //对 用命名参数格式 paramName: value 为 from 赋值
  say('Hello Flutter', clock: 11); //✅
  say('Hello Flutter', from: 'XiaoMing', clock: 11); //✅
}

// 同时还可以给命名参数加 @required ，意思是这个也是必填参数，例子如下：
// 只有 Flutter 支持？
// bool say2(String msg, {@required String from, int clock}) {
bool say2(String msg, {String from, int clock}) {
  print(msg + " from " + from + " at " + clock.toString());
  return true;
}

testSay2() {
  // 这时候要调用 say 函数，方法如下：
  say2('Hello Flutter'); //❌  错误调用方式，因为 from 是必选参数，不填的话会报错
  say2('Hello Flutter', from: 'XiaoMing'); //✅ 正确调用方式
  say2('Hello Flutter', from: 'XiaoMing', clock: 11); //✅ 这个调用方式也是正确的
}

/// 可选位置参数 List
// 用 [] 包起来的参数是可选位置参数，前面讲数据类型的时候，使用 [] 来赋值的数据类型是 List，所以可选的命名参数的类型也是 List，所以赋值和参数是一一对应的
bool say3(String msg, [String from, int clock]) {
  print(msg + " from " + from + " at " + clock.toString());
  return true;
}

// 要给可选位置参数赋值时，必选按照顺序来赋值：
testSay3() {
  say3('Hello Flutter'); //✅ 因为 from 和 clock 是可选参数，所以可以不填
  say3('Hello Flutter', 'XiaoMing', 1); //✅ 为可选位置参数赋值，只能一个参数一个参数对应的赋值，所以要全部赋值
  say3('Hello Flutter', 'XiaoMing'); //✅
  // say3('Hello Flutter',1)//❌ 因为  1 赋值给了 from,但是 from 是String，所以会报错
}

/// 可选参数的默认值 ：=
// 因为参数是可选的，那么参数的值很可能没有赋值，就是 null ，用到的时候就有可能会触发 NPE，所以可以给可选参数赋默认值

bool say4(String msg, {String from = 'empty', int clock = 0}) {
  print(msg + " from " + from + " at " + clock.toString());
  return true;
}

bool say5(String msg, [String from = 'empty', int clock = 0]) {
  print(msg + " from " + from + " at " + clock.toString());
  return true;
}

/// 入口函数 main
// 每个应用都需要有个顶级的 main() 入口方法才能执行。 main() 方法的返回值为 void 并且有个可选的 List<String> 参数。

// 命令行程序，携带arguments参数（相关库：https://pub.dev/packages/args）
// Run the app like this: dart args.dart 1 test
void main(List<String> arguments) {
  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');
}

// void main() {
//   querySelector("#sample_text_id")
//     ..text = "Click me!"
//     ..onClick.listen(reverseText);
// }

/// 函数作为参数(Functions as first-class objects)
printElement(element) {
  print(element);
}

testPrintElement() {
  var list = [1, 2, 3];
  // Pass printElement as a parameter.
  list.forEach(printElement);
}

/// 闭包捕获
// Returns a function that adds [addBy] to the
// 捕获 addBy 变量
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

testMakeAdder() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}

/// 函数是变量，也可以相等比较
