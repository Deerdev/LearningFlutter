var a = 0;
var b = 1;
var c = [1, 2, 3];

test() {}

learningControl() {
  if (a > 0) {
  } else if (b > 0) {
  } else {}

  for (var i = 0; i < c.length; i++) {}

  /// for 循环 index会被正确捕获，和js不同
  var callbacks = [];
  for (var i = 0; i < 2; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c());
  // 输出的结果为所期望的 0 和 1。但是 上面同样的代码在 JavaScript 中会打印两个 2。

  for (var item in c) {}

  while (a > 0) {}
  do {
    print("test");
  } while (a > 0);

  /// switch-case
  var command = 'OPEN';
  switch (command) {
    case 'CLOSED':
      test();
      break;
    case 'PENDING':
      test();
      break;
    default:
      test();
  }
  // *** case 语句必需有 break

  // 空case 可以 fall through
  switch (command) {
    case 'CLOSED': // Empty case falls through.
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      test();
      break;
  }

  // 从一个case跳转到另一个case
  switch (command) {
    case 'CLOSED':
      test();
      continue nowClosed;
    // Continues executing at the nowClosed label.

    nowClosed:
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      test();
      break;
  }

  /// 断言 Assert
  // 断言执行失败，会抛出一个异常 AssertionError
  var text = "";
  var number = 101;
  var urlString = "https://hellworld.com";
  // Make sure the variable has a non-null value.
  assert(text != null);

  // Make sure the value is less than 100.
  assert(number < 100);

  // Make sure this is an https URL.
  assert(urlString.startsWith('https'));
}
