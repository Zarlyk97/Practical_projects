void main() {
  var zarlyk =
      MyFamily(name: 'Zarlyk', age: 26, profession: 'Flutter developer');
  print(zarlyk);
  var amir =
      MySon(name: 'Amir', age: 8, profession: 'Muftiy', character: ' best');
  print(amir);

  var jumagul = MyWife(
      name: 'Jumagul', age: 22, profession: 'teacher', national: ' kyrgyz');
  print(jumagul);

  zarlyk.flutterDeveloper();
  amir.crying();
  jumagul.toCook();
  amir.grewUp(3);
  print(amir.age);
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
    print('код жазганды билет');
  }

  @override
  String toString() {
    return 'Адамдын аты: $name, жашы: $age, кесиби: $profession,';
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
    print('Ыйлаганды билет');
  }

  void grewUp(int year) {
    age += year;
  }

  @override
  String toString() {
    return super.toString() + '' + 'мой сын,  мүнөзү:$character';
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
    print('тамакты жакшы жасайт');
  }

  @override
  String toString() {
    return super.toString() + '' + 'менин келинчегим  улуту:$national ';
  }
}
