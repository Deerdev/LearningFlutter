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
