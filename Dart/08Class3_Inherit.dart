import 'dart:math';

/// 3.抽象类 接口 扩展(继承)类

/// 抽象类 & 抽象函数
// 抽象类： 定义接口，或接口的默认实现；抽象类不可实例化；（如果要实例化抽象类，可以给抽象类定义工厂函数，由工厂函数类实例化）
// 抽象函数：只定义不实现（由子类实现）
abstract class AbstractContainer {
  // ...Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}

class SpecializedContainer extends AbstractContainer {
  // ...Define more constructors, fields, methods...
  void updateChildren() {
    // ...Implement updateChildren()...
  }
}

/// Implicit interfaces（隐式接口）
// 每个类都隐式的定义了一个包含所有实例成员的接口， 并且这个类实现了这个接口；（每个类自身的方法和变量 其实 都是接口）
// implements 仅仅是实现接口，并不是继承
// implements 可以实现多个接口

// (每个类也是接口声明) 隐式接口里面包含了 greet() 方法声明。
class Person {
  // 包含在接口里，但只在当前库中可见。
  final _name;

  // 不包含在接口里，因为这是一个构造函数。
  Person(this._name);

  // 包含在接口里。
  String greet(who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Imposter implements Person {
  // We have to define this, but we don't use it.
  final _name = "";

  String greet(who) => 'Hi $who. Do you know who I am?';
}

greetBob(Person person) => person.greet('bob');

main() {
  print(greetBob(new Person('kathy')));
  print(greetBob(new Imposter()));
}

/// Extending a class（扩展类）=== 继承
// 类似于override父类的方法
// 使用 extends 定义子类， supper 引用 超类:
class Television {
  void turnOn() {
    // _illuminateDisplay();
    // _activateIrSensor();
  }
  // ...
}

class SmartTelevision extends Television {
  @override // [可选]可以使用 @override 注解来 表明你的函数是想覆写超类的一个函数
  void turnOn() {
    super.turnOn();
    // _bootNetworkInterface();
    // _initializeMemory();
    // _upgradeApps();
  }
  // ...
}

/// 重载操作符
// http://dart.goodev.org/guides/language/language-tour#overridable-operators%E5%8F%AF%E8%A6%86%E5%86%99%E7%9A%84%E6%93%8D%E4%BD%9C%E7%AC%A6
// 如果你覆写了 == ，则还应该覆写对象的 hashCode getter 函数。 关于 覆写 == 和 hashCode 的示例请参考 http://dart.goodev.org/guides/libraries/library-tour#implementing-map-keys

class Vector {
  final int x;
  final int y;
  const Vector(this.x, this.y);

  /// Overrides + (a + b).
  Vector operator +(Vector v) {
    return new Vector(x + v.x, y + v.y);
  }

  /// Overrides - (a - b).
  Vector operator -(Vector v) {
    return new Vector(x - v.x, y - v.y);
  }
}

/// noSuchMethod()
// 覆写 Object 类的 noSuchMethod() 函数的例子， 如果调用了对象上不存在的函数，则就会触发 noSuchMethod() 函 数。
// 如果你使用 noSuchMethod() 函数来实现每个可能的 getter 、setter、 以及其他类型的函数，你可以使用 @proxy 注解来避免警告信息
// @proxy: to implement a class that isn't known statically, as documented at the end of this text (将在Dart2废弃)

// @proxy
class A {
  // 如果不重写 noSuchMethod，访问
  // 不存在的实例变量时会导致 NoSuchMethodError 错误。
  @override
  void noSuchMethod(Invocation mirror) {
    // 实现未实现的方法
  }
}

// 如果你知道编译时的具体类型，则可以 实现这些类来避免警告，和 使用 @proxy 效果一样：
class B /*implements SomeClass, SomeOtherClass */ {
  @override
  void noSuchMethod(Invocation mirror) {
    // ...
  }
}

/// 静态方法 静态属性

// 静态变量等到使用时(被调用时)才会初始化
class Queue {
  static const initialCapacity = 16;
  // ···
}

// 静态方法 可以认为是 编译时静态变量，所以可以作为参数 传递给 静态（常量）构造函数
class Point {
  num x, y;
  Point(this.x, this.y);

  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}
