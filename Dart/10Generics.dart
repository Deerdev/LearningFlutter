abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

void testT() {
  var names = <String>['Seth', 'Kathy', 'Lars'];
  var pages = <String, String>{
    'index.html': 'Homepage',
    'robots.txt': 'Hints for web robots',
    'humans.txt': 'We are people, not machines'
  };
  var nameSet = Set<String>.from(names);
  var views = Map<int, String>();
}

/// 限制 T 的类型
class SomeBaseClass {}

class Foo<T extends SomeBaseClass> {
  // Implementation goes here...
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {}

void testTRestricting() {
  var someBaseClassFoo = Foo<SomeBaseClass>();
  var extenderFoo = Foo<Extender>();

  // 也可以不指定 T， 默认 SomeBaseClass
  var foo = Foo();
  print(foo); // Instance of 'Foo<SomeBaseClass>'
}

/// 泛型方法
/*
In the function’s return type (T).
In the type of an argument (List<T>).
In the type of a local variable (T tmp).
*/
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}
