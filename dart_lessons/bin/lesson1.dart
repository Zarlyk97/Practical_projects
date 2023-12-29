void main() {
  var grade = 54;

  if (grade == 5) {
    print("hello  Zarlyk ");
  } else {
    print('very good');
  }
  var zarlyk = 27;

  if (zarlyk >= 90 && zarlyk < 100) {
    print('old');
  } else if (zarlyk >= 80 && zarlyk < 90) {
    print('good');
  } else if (zarlyk >= 25 && zarlyk < 30) {
    print('The best');
  } else {
    print('The invalid age');
  }

  int y = 15;
  int x = 10;
  if (x < y) {
    print(x + y);
  } else {
    print(x - y);
  }
  int zarlyk1 = x < y ? (x + y) : (x - y);
  print(zarlyk1);
}
