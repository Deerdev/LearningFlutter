/// Enumerated types（枚举类型）
// 枚举类型通常称之为 enumerations 或者 enums， 是一种特殊的类(也是类)
// 无法继承枚举类型、无法使用 mix in、无法实现一个枚举类型
// 无法显示的初始化一个枚举类型

enum Color { red, green, blue }

testEnum() {
  // 枚举类型中的每个值都有一个 【index】 getter 函数， 该函数返回该值在枚举类型定义中的位置（从 0 开始）。 例如，第一个枚举值的位置为 0， 第二个为 1.
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);

  // 枚举的 values 常量可以返回 所有的枚举值。
  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);

  // switch
  Color aColor = Color.blue;
  switch (aColor) {
    case Color.red:
      print('Red as roses!');
      break;
    case Color.green:
      print('Green as grass!');
      break;
    default: // Without this, you see a WARNING.
      print(aColor); // 'Color.blue'
  }
}
