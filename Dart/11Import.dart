/// 通过import 导入 package
import 'dart:html';

/// 如果库内方法重名，可以指定一个新的 名称
import 'package:lib/lib1.dart';
import 'package:lib/lib2.dart' as lib2;

/// 只导入 部分功能  或  不导入某个功能
// Import only foo.
import 'package:lib1/lib1.dart' show foo;
// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;

/// lazy import
// - 在加载之前，库内import file的常量无法使用
import 'package:greetings/hello.dart' deferred as hello;

Future greet() async {
  // 加载库
  await hello.loadLibrary();
  hello.printGreeting();
}
