/// 2. Method 函数

import 'dart:math';

class Point {
  num x;
  num y;
  Point(this.x, this.y);

  // 实例方法：方法内可以访问 this
  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}

/// Getters and setters
// 使用 get 和 set 增加新属性
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;

  num get bottom => top + height;
  set bottom(num value) => top = value - height;
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
