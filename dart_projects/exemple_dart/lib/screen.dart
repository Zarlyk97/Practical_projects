import 'dart:io';

import 'package:exemple_dart/math.dart';

class Screen {
  Math math = Math();

  void queryNumbersAndOperation() {
    print("Enter the first number:");
    double num1 = double.parse(stdin.readLineSync()!);
    print("Choose operation (+, -, *, /):");
    String operation = stdin.readLineSync()!;

    print("Enter the second number:");
    double num2 = double.parse(stdin.readLineSync()!);

    performOperation(num1, num2, operation);
  }

  void performOperation(double num1, double num2, String operation) {
    double result;

    switch (operation) {
      case '+':
        result = math.add(num1, num2);
        break;
      case '-':
        result = math.subtract(num1, num2);
        break;
      case '*':
        result = math.multiply(num1, num2);
        break;
      case '/':
        result = math.divide(num1, num2);
        break;
      default:
        print("Invalid operation");
        return;
    }

    print("Result: $result");
  }
}

class CalculateScreen extends Screen {}

// class HistoryScreen extends Screen {

//   List<OperationDetail> operations = [];
  
//   void addOperation(OperationDetail detail) {
//     // Операциянын таржымалын кошуу
//   }
  
//   void removeOperation(int index) {
//     // Индекстеги операцияны алып салуу
//   }

// }

// class OperationDetail {
//   String expression;

//   String toString() {
//     // операциянын string түрүндө кайтарымы
//   }
// }