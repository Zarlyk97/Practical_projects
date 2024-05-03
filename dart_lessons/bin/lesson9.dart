void main() {
  Person persons =
      Person(name: 'Zarlyk', age: 26, profession: 'Flutter developer');
  print(persons.name);
  print(persons.age);
  print(persons.profession);
  persons.changed();
}

class Person {
  Person({
    required this.name,
    required this.age,
    required this.profession,
  });
  String name;
  int age;
  String profession;
  void changed() {
    print('Имя: $name, Возрасть: $age, Профессия: $profession');
  }
}
