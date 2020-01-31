// 声明类型即不可改变
// Dart中var变量一旦赋值，类型便会确定，则不能再改变其类型
test() {
  var t;
  t = "hi world";
  // 下面代码在dart中会报错，因为变量t的类型已经确定为String，
  // 类型一旦确定后则不能再更改其类型。
  t = 1000;
}

// import: Dart 所有的变量引用都是对象，数字、方法、null都是对象，都继承自 Object 类
