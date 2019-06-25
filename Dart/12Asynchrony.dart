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
