/// 1. 构造函数

// 所有没有初始化的变量值都是 null。
// 每个实例变量都会自动生成一个 getter 方法（隐含的）。
// Non-final 实例变量还会自动生成一个 setter 方法。
class Point1 {
  num x;
  num y;
  num z = 0;
  // 构造函数
  Point1(num x, num y) {
    // this 关键字指当前的实例, 变量名不冲突时，不推荐使用this
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y;
  }
}

class Point {
  num x;
  num y;
  // 由于把构造函数参数赋值给实例变量的场景太常见了， Dart 提供了一个语法糖来简化这个操作：
  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  Point(this.x, this.y);
  // 命名构造函数
  Point.fromJson(Map json) {
    x = json['x'];
    y = json['y'];
  }

  /// 重定向构造函数
  // 自身无实现，调用其他构造函数
  // 重定向构造函数的函数体为空， 构造函数的调用在冒号 (:) 之后
  Point.alongXAxis(num x) : this(x, 0);

  // 命名构造函数
  Point.origin() {
    x = 0;
    y = 0;
  }
}

// Default constructors（默认构造函数）
// 如果你没有定义构造函数，则会有个默认构造函数。 默认构造函数没有参数，并且会调用超类的 没有参数的构造函数。

// Constructors aren’t inherited（构造函数不会继承）
// 子类不会继承超类的构造函数。 子类如果没有定义构造函数，则只有一个默认构造函数 （没有名字没有参数）。

// Named constructors（命名构造函数）
// 使用命名构造函数可以为一个类实现多个构造函数， 或者使用命名构造函数来更清晰的表明你的意图：

/// 调用超类构造函数（Invoking a non-default superclass constructor）
// 构造函数默认会调用父类的 无名无参数的默认构造函数

// 构造函数执行顺序：
// initializer list（初始化参数列表）
// superclass’s no-arg constructor（超类的无名构造函数）
// main class’s no-arg constructor（主类的无名构造函数）

// 如果父类没有 无名无参数的默认构造函数, 则需要手动 显式调用父类的其他构造函数
class Point2 extends Point {
  // ...
  // 冒号右边 不能访问this, 因为this还未初始化
  Point2() : super.fromJson({'x': 0, 'y': 0});
}

/// 初始化参数列表
// 初始化列表非常适合用来设置 final 变量的值
class Point3 {
  final num x;
  final num y;

  Point3(this.x, this.y);

  // 在构造函数调用之前，设置实例变量
  // 初始化表达式等号右边的部分不能访问 this
  Point3.fromJson(Map jsonMap)
      : x = jsonMap['x'],
        y = jsonMap['y'] {
    print('In Point.fromJson(): ($x, $y)');
  }

  // 开发阶段可以使用assert判断入参
  Point3.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }
}

/// Constant constructors（常量构造函数）
// 如果你的类提供一个状态不变的对象，可以把这些对象 定义为编译时常量。
// 要实现这个功能，需要定义一个 const 构造函数， 并且声明所有类的变量为 final。

class ImmutablePoint {
  final num x;
  final num y;
  // 变量都是final
  // const 定义构造函数
  const ImmutablePoint(this.x, this.y);

  static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

learningClass() {
  // 有些类提供了常量构造函数。使用常量构造函数 可以创建编译时常量，要使用常量构造函数只需要用 const 替代 new 即可：
  var p = const ImmutablePoint(2, 2);

  // 两个一样的编译时常量其实是 同一个对象：
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);

  assert(identical(a, b)); // They are the same instance!

  /// runtimeType
  // 可以使用 Object 的 runtimeType 属性来判断实例 的类型，该属性 返回一个 Type 对象。
  print('The type of a is ${a.runtimeType}');
}

/// Factory constructors（工厂方法构造函数）
// 使用 factory 来定义 这个构造函数, 这个构造函数并不总是返回一个新的对象
// 返回一个缓存对象
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    /// 工厂函数无法访问this
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

test1() {
  // 使用 new 关键字来调用工厂构造函数。
  var logger = new Logger('UI');
  logger.log('Button clicked');
}
