/// 生成器

// 当您需要延迟生成( lazily produce )一系列值时， 可以考虑使用_生成器函数_。 Dart 内置支持两种生成器函数：

// Synchronous 生成器： 返回一个 Iterable 对象。
// Asynchronous 生成器： 返回一个 Stream 对象。


// 1. 同步生成器函数。 使用 yield 语句来传递值：sync*
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) yield k++;
}

// 2. 异步生成器函数。 使用 yield 语句来传递值：async*
Stream<int> asynchronousNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) yield k++;
}

// 如果生成器是递归的，可以使用 yield* 来提高其性能：
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}