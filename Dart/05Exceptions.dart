/// Dart 提供了 Exception 和 Error 类型， 以及一些子类型。你还 可以定义自己的异常类型。
/// 但是， Dart 代码可以 抛出任何非 null 对象为异常，不仅仅是实现了 Exception 或者 Error 的对象。

breedMoreLlamas() {
  throw new FormatException('Expected at least 1 section');
  // 可以抛出任意的非null对象：
  // throw 'Out of llamas!';
}

class OutOfLlamasException implements Exception {
  @pragma("vm:entry-point")
  const OutOfLlamasException();
  String toString() => "OutOfLlamasException";
}

buyMoreLlamas() {}
clean() {}

learningException() {
  try {
    breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    buyMoreLlamas();
  } on Exception catch (e) {
    // 可以使用on 或者 catch 来声明捕获语句，也可以 同时使用。使用 on 来指定异常类型，使用 catch 来 捕获异常对象。
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
    // 使用 rethrow 关键字可以 把捕获的异常给 重新抛出。
    rethrow;
  } catch (e, s) {
    // 函数 catch() 可以带有一个或者两个参数， 第一个参数为抛出的异常对象， 第二个为堆栈信息 (一个 StackTrace 对象)。
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }

  // finally 保证代码执行
  try {
    breedMoreLlamas();
  } catch (e) {
    print('Error: $e'); // Handle the exception first.
  } finally {
    clean(); // Then clean up.
  }
}
