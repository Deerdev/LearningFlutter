/// mixins: adding features to class
// dart 2.1 +
class Performer {}

class Person {
  String name;
}

class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}

// mixin 定义： 可以使用class定义一个不含构造函数的类，或者直接使用mixin关键字

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

class Aggressive {}

mixin Demented {}

// 【限制使用mixin的类】：使用mixin[MusicalPerformer] 的类 必需继承 Musical
mixin MusicalPerformer on Musical {
  // ···
}

class InheritedMixin extends Maestro with MusicalPerformer {
  InheritedMixin() : super('');
}
