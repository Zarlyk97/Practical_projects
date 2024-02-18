void main() {
  var zarlyk =
      MyFamily(name: 'Zarlyk', age: 26, profession: 'Flutter developer');
  print(zarlyk);
  var amir =
      MySon(name: 'Amir', age: 8, profession: 'baby', character: ' best');
  print(amir);

  var jumagul = MyWife(
      name: 'Jumagul', age: 22, profession: 'teacher', national: ' kyrgyz');
  print(jumagul);

  zarlyk.flutterDeveloper();
  amir.crying();
  jumagul.toCook();
  amir.grewUp(3);
  print("Возраст:  ${amir.age}");
}

class MyFamily {
  MyFamily({
    required this.name,
    required this.age,
    required this.profession,
  });

  final String name;
  int age;
  final String profession;

  void flutterDeveloper() {
    print('Умеет писать код');
  }

  @override
  String toString() {
    return 'Имя: $name, Возрасть: $age, Профессия: $profession,';
  }
}

class MySon extends MyFamily {
  MySon({
    required super.name,
    required super.age,
    required super.profession,
    required this.character,
  });
  final String character;
  void crying() {
    print('Хорошо умеет плакат');
  }

  void grewUp(int year) {
    age += year;
  }

  @override
  String toString() {
    return super.toString() + '' + 'мой сын,  Характер:$character';
  }
}

class MyWife extends MyFamily {
  MyWife({
    required super.name,
    required super.age,
    required super.profession,
    required this.national,
  });
  final String national;

  void toCook() {
    print('Хорошо готовит');
  }

  @override
  String toString() {
    return super.toString() + '' + 'Моя жена  Ноциональность:$national ';
  }
}
