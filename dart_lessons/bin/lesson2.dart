void main() {
  for (int i = 1; i <= 100; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('Super Quize');
    } else if (i % 3 == 0) {
      print('Super');
    } else if (i % 5 == 0) {
      print('Quize');
    } else {
      print(i);
    }
  }

  print(countDigits(2));
  print(countDigits(555));
  print(countDigits(236455));

  print(getCentury(1705)); // Вход: 1705, Выход: 18
  print(getCentury(1900)); // Вход: 1900, Выход: 19
  print(getCentury(1601)); // Вход: 1601, Выход: 17
  print(getCentury(2000)); // Вход: 2000, Выход: 20

  List<dynamic> myList = [60, 999, 14, "dart1", 45, 95, "dart", 1];
  print(containsValue(myList, "dart")); // Вход: "dart", Выход: true
  print(containsValue(myList, 15));
}

int countDigits(int num) {
  int count = 0;
  while (num > 0) {
    num ~/= 10;
    count++;
  }
  return count;
}

int getCentury(int year) {
  return (year - 1) ~/ 100 + 1;
}

bool containsValue(List<dynamic> list, dynamic value) {
  for (var element in list) {
    if (element == value) {
      return true;
    }
  }
  return false;
}
