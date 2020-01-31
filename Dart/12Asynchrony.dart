/// Future

// 定义 异步方法： 使用 async标记body
Future<String> lookUpVersion() async => '1.0.0';

Future checkVersion() async {
  var version = await lookUpVersion();

  // try catch 捕获出错逻辑
  try {
    version = await lookUpVersion();
  } catch (e) {
    // React to inability to look up the version
  }
  // Do something with version
}


/// stream
// await for, 不适合监听 UI 事件
/*
表达式 返回的值必须是 Stream 类型。 执行流程如下：

1.等待，直到流发出一个值。
2.执行 for 循环体，将变量设置为该发出的值
3.重复1和2，直到关闭流。
*/
Future main() async {
  // ...
  await for (var request in requestServer) {
    handleRequest(request);
  }
  // ...
}

// ***使用 break 或者 return 语句可以停止接收 stream 的数据， 这样就跳出了 for 循环， 并且从 stream 上取消注册

