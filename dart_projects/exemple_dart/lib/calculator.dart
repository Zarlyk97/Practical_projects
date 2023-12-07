import 'dart:io';

class Math {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) => a / b;
}

class Screen {
  Math math = Math();

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
}
