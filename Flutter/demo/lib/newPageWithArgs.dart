import 'package:flutter/material.dart';

class NewArgsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 通过setting 读取参数
    var args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(title: Text("NewRouter")),
      body: Center(
        child: Text("This is new route, args is \"$args\" "),
      ),
    );
  }
}
