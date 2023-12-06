// class Calculator {
//   late double _result;

//   // Конструктор по умолчанию
//   Calculator() {
//     _result = 0.0;
//   }

//   // Геттер для получения результата
//   double get result => _result;

//   // Метод для сложения
//   void add(double value) {
//     _result += value;
//   }

//   // Метод для вычитания
//   void subtract(double value) {
//     _result -= value;
//   }

//   // Метод для умножения
//   void multiply(double value) {
//     _result *= value;
//   }

//   // Метод для деления
//   void divide(double value) {
//     if (value != 0) {
//       _result /= value;
//     } else {
//       print("Ошибка: Деление на ноль!");
//     }
//   }

//   // Метод для сброса результата
//   void reset() {
//     _result = 0.0;
//   }
// }

// void main() {
//   // Пример использования класса Calculator
//   Calculator myCalculator = Calculator();

//   myCalculator.add(5.0);
//   print("Результат после сложения: ${myCalculator.result}");

//   myCalculator.multiply(2.0);
//   print("Результат после умножения: ${myCalculator.result}");

//   myCalculator.subtract(3.0);
//   print("Результат после вычитания: ${myCalculator.result}");

//   myCalculator.divide(2.0);
//   print("Результат после деления: ${myCalculator.result}");

//   // Сброс результата
//   myCalculator.reset();
//   print("Результат после сброса: ${myCalculator.result}");
// }

// int add(int a, int b) {
//   return a + b;
// }

// int subtract(int a, int b) {
//   return a - b;
// }

// int multiply(int a, int b) {
//   return a * b;
// }

// double division(double a, double b) {
//   return a / b;
// }

// int modulus(int a, int b) {
//   // modulus
//   return a - b;
// }

// void main() {
//   print(add(24, 9));
//   print(subtract(7, 3));
//   print(multiply(4, 50));
//   print(division(120, 4));
//   print(modulus(9, 3));
// }
import 'dart:io';

class MathOperations {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) => a / b;
}

class Screen {
  MathOperations math = MathOperations();

  void queryNumbersAndOperation() {
    print("Enter the first number:");
    double num1 = double.parse(stdin.readLineSync()!);

    print("Enter the second number:");
    double num2 = double.parse(stdin.readLineSync()!);

    print("Choose operation (+, -, *, /):");
    String operation = stdin.readLineSync()!;

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

void main() {
  Screen calculatorScreen = Screen();
  calculatorScreen.queryNumbersAndOperation();
  print(calculatorScreen);
}
