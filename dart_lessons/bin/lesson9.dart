void main() {
  Person myAnimals =
      Person(name: 'Zarlyk', age: 26, profession: 'Flutter developer');
  print(myAnimals.name);
  print(myAnimals.age);
  print(myAnimals.profession);
  myAnimals.changed();
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
