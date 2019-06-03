learningVariable() {
  var name = "fish";
  // 默认为 null，所有类型都是 对象，包括数字
  int line;
  // 声明变量可以 加上类型
  String name2 = "test";

// ---------------------------------------------------------------- //

  // final 变量： 只可以初始化一次（在第一次使用的时候初始化）
  // const 变量: 编译时常量（也是final变量）
  // 类实例变量 只能是 final 不能是 const
  final name3 = "aa";
  // error
  // name3 = "bb";

  const name4 = "66";

  // const 创建不变值
  var far = const [];
  const boo = const [];
  final baz = const [];

  // 可以继续修改far
  far = [];
  // error: const final 不可修改
  // boo = [];
  // baz = [];

  // 在使用 const 的时候，如果变量是类里的变量，必须加 static ，是全局变量时不需要加,例如:
  // class MyApp {
  //   static content = 'Dart 语法'; // 这里必须加 static
  // }

// ---------------------------------------------------------------- //
  /// 变量类型
  // Numbers: int double, 继承自 num
  // 类型转换
  var a = int.parse("1");
  var b = double.parse("1.1");
  var c = 1.toString();
  var d = 1.1.toString();
  var e = 1.2.toInt();

// ---------------------------------------------------------------- //

  // Strings
  var s1 = "test";
  var s2 = 'it\'s me';
  var s3 = "I am $s1";
  var s4 = s1 + s2;
  var s5 = '''
  I
  am
  lines
  ''';
  var s6 = """this is 
  multi-lines
  """;
  // raw string，全部都是字符串，不要转义
  var s7 = r"In a raw string, even \n isn't special.";

  // 字符串插值为编译时常量，则自身也是编译时常量
  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  // These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = const [1, 2, 3];
  // validConstString 是编译时常量
  const validConstString = '$aConstNum $aConstBool $aConstString';
  // invalidConstString 不是编译时常量
  // const invalidConstString = '$aNum $aBool $aString $aConstList';

// ---------------------------------------------------------------- //

  /// bool
  // 严格规定 true 和 false，和js不同
  var b1 = "me";
  // b1 != true , 所以if判断为fale
  // if (b1) {
  //   print("js can go in, but dart can not");
  // }

// ---------------------------------------------------------------- //

  /// Lists
  var l1 = [1, 2, 3];
  print(l1.length);
  l1[1] = 6;
  // 在 list 字面量之前添加 const 关键字，可以 定义一个不变的 list 对象（编译时常量）
  var l2 = const [1, 2, 3];
  // error
  l2[1] = 4;

// ---------------------------------------------------------------- //

  /// Maps
  // 字面量创建
  var gifts = {
    // Keys      Values
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    // Keys  Values
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };
  // 构造函数创建
  var gifts2 = new Map();
  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';
  // 添加新的键值
  gifts2['fourth'] = 'calling birds'; // Add a key-value pair
  // 获取不存在的key，返回null
  print(gifts['six']); // null

  // 编译时常量
  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

// ---------------------------------------------------------------- //

  /// Runes
  /// runes 代表字符串的 UTF-32 code point, Dart 默认编码是 UTF-16
  // 表示采用 UTF-32 的字符串，用于显示 Unicode
  // 因为Dart字符串是UTF-16，因此在Dart中表示32位的Unicode值需要Runes这个特殊语法。
  Runes input = new Runes('\u{1f600}');
  print(new String.fromCharCodes(input)); // 打印出来的是笑脸emoji：😆

  /// 通常使用 \uXXXX 的方式来表示 Unicode code point， 这里的 XXXX 是4个 16 进制的数。 例如，心形符号 (♥) 是 \u2665。 对于非 4 个数值的情况， 把编码值放到大括号中即可。 例如，笑脸 emoji (😆) 是 \u{1f600}。
  var clapping = '\u{1f44f}';
  print(clapping); // 👏
  print(clapping.codeUnits); // [128079]
  print(clapping.runes.toList()); // [55357, 56399]
  Runes input2 = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input2)); // ♥  😅  😎  👻  🖖  👍

// ---------------------------------------------------------------- //

  /// Symboal: http://dart.goodev.org/guides/libraries/library-tour#dartmirrors---reflection

  // ---------------------------------------------------------------- //

  /// dynamic

  dynamic example = 'example';

  // 意思是数据类型是动态可变的，也可以定义任何变量，但是和 var 不同的是，var 一旦赋值后，就不能改变数据类型了，例如以下用法就是错误的
  var content = 'Dart 语法';
  // content = 1; //❌ 错误的使用方法，content为String，不能赋值数字类型

  // 但是 dynamic 就可以，dynamic 可以这么使用：
  dynamic example2 = 'example';
  example = 1; //✅  这个使用方法正确，因为 dynamic 的类型是动态可变的

  // ---------------------------------------------------------------- //

  /// Object

  Object index = 100;

  // Dart 里所有东西都是对象，是因为 Dart 的所有东西都继承自 Object，因此 Object 可以定义任何变量，而且赋值后，类型也可以更改：
  Object index2 = 100;
  index = 'string'; //✅ 因为  'String' 也是 Object

  // 注意：请不要滥用 dynamic，一般情况下都可以用 Object 代替 dynamic。

  // *** 那什么情况下可以用 dynamic 呢？ *** [Native 交互]
  // 当这个变量没法用 Dart 的类型来表示时，比如 Native 和 Flutter 交互，从 Native 传来的数据。
  // 所以你会看到 PlatformChannel 里有很多地方使用到了 dynamic。
}
