void main() {
  //1 задача

  // for (int num = 1; num <= 50; num++) {
  //   if (num % 3 == 0 && num % 5 == 0) {
  //     print('Super Quiz');
  //   } else if (num % 3 == 0) {
  //     print('Super');
  //   } else if (num % 5 == 0) {
  //     print('Quiz');
  //   } else {
  //     print(num);
  //   }
  // }

  // 2 задача

  // Входные данные
//   int num1 = 2;
//   int num2 = 555;
//   int num3 = 236455;

//   // Решение
//   int countDigits1 = countDigits(num1);
//   int countDigits2 = countDigits(num2);
//   int countDigits3 = countDigits(num3);

//   // Вывод результатов
//   print(countDigits1);
//   print(countDigits2);
//   print(countDigits3);
// }

// int countDigits(int number) {
//   int count = 0;
//   while (number != 0) {
//     number ~/= 10; // Деление нацело на 10
//     count++;
//   }
//   return count;

  // 3 задача
  // Входные данные
//   int year1 = 1705;
//   int year2 = 1900;
//   int year3 = 1601;
//   int year4 = 2000;

//   // Решение и вывод результатов
//   print(findCentury(year1));
//   print(findCentury(year2));
//   print(findCentury(year3));
//   print(findCentury(year4));
// }

// int findCentury(int year) {
//   // Для нахождения века можно разделить год на 100 и добавить 1
//   // Если год делится на 100 без остатка, то нужно добавить 1 только если он больше 0
//   return (year % 100 == 0) ? (year ~/ 100) : (year ~/ 100 + 1);
  // Входные данные
  List<dynamic> myList = [60, 999, 14, "dart1", 45, 95, "dart", 1];
  dynamic value1 = "dart";
  dynamic value2 = 15;

  // Решение и вывод результатов
  print(containsValue(myList, value1)); // Вернет true
  print(containsValue(myList, value2)); // Вернет false
}

bool containsValue(List<dynamic> list, dynamic value) {
  // Проходимся по элементам списка и сравниваем с заданным значением
  for (var item in list) {
    if (item == value) {
      return true;
    }
  }
  return false;
}
