// 描述	操作符
// unary postfix	           expr++    expr--    ()    []    .    ?.
// unary prefix	-expr        !expr    ~expr    ++expr    --expr
// multiplicative	           *    /    %  ~/
// additive	                 +    -
// shift	                   <<    >>
// bitwise AND	             &
// bitwise XOR	             ^
// bitwise OR	               |
// relational and type test	 >=    >    <=    <    as    is    is!
// equality	                 ==    !=
// logical AND	             &&
// logical OR	               ||
// if null	                 ??
// conditional	             expr1 ? expr2 : expr3
// cascade	                 ..
// assignment	               =    *=    /=    ~/=    %=    +=    -=    <<=    >>=    &=    ^=    |=    ??=

/// 优先级 上面 > 下面 & 左边 > 右边
// 除号 ~/ : 返回值为整数

class Person {
  var firstName;
}

class AddressBookBuilder {
  var name;
  var email;
  PhoneNumberBuilder phone;
  build() {}
}

class PhoneNumberBuilder {
  var number;
  var label;
  build() {}
}

querySelector(String id) {}
alert(String msg) {}

// -----------------------------------------------------------------------

learningOperators() {
  /// 类型判定操作符 Type test operators
  // as	类型转换
  // is	如果对象是指定的类型返回 True
  // is!	如果对象是指定的类型返回 False
  Object emp = Person();
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }

  // 使用 as 操作符可以简化上面的代码：
  (emp as Person).firstName = 'Bob';
  // *** 注意： 上面这两个代码效果是有区别的。如果 emp 是 null 或者不是 Person 类型， 则第一个示例使用 is 则不会执行条件里面的代码，而第二个情况使用 as 则会抛出一个异常。

  // -----------------------------------------------------------------------
  /// Assignment operators（赋值操作符）
  var b = null;
  var value = 0;
  b ??= value; // 如果 b 是 null，则赋值给 b；
  // 如果不是 null，则 b 的值保持不变
  // b = b ?? value

  // -----------------------------------------------------------------------
  /// 条件运算符
  // ?? 同swift

  // -----------------------------------------------------------------------

  /// Cascade notation (..)（级联操作符）
  // 级联操作符 (..) 可以在同一个对象上 连续调用多个函数以及访问成员变量。
  // 使用级联操作符可以避免创建 临时变量， 并且写出来的代码看起来 更加流畅：
  querySelector('#button') // Get an object.
    ..text = 'Confirm' // Use its members.
    ..classes.add('important')
    ..onClick.listen((e) => alert('Confirmed!'));

  // 同以下代码
  var button = querySelector('#button');
  button.text = 'Confirm';
  button.classes.add('important');
  button.onClick.listen((e) => alert('Confirmed!'));

  // 级联调用也可以嵌套：
  final addressBook = (new AddressBookBuilder()
        ..name = 'jenny'
        ..email = 'jenny@example.com'
        ..phone = (new PhoneNumberBuilder()
              ..number = '415-555-0100'
              ..label = 'home')
            .build())
      .build();

  // 在方法上使用级联操作符需要非常小心， 例如下面的代码就是不合法的：
  // Does not work
  var sb = new StringBuffer();
  // sb.write('foo')..write('bar');

  // sb.write() 函数返回一个 [void]， 无法在 void 上使用级联操作符。

  // *** 注意： 严格来说， 两个点的级联语法不是一个操作符。 只是一个 Dart 特殊语法。

  // -----------------------------------------------------------------------
  /// 其他操作符
  // [？.] 和 . 类似，但是左边的操作对象不能为 null，例如 foo?.bar 如果 foo 为 null 则返回 null，否则返回 bar 成员
}
