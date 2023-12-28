import 'dart:io';

import 'calculate_screen.dart';

void main() {
  CalculateScreen calculateScreen = CalculateScreen();

  while (true) {
    double num1 = calculateScreen.getNumberInput("Enter the first number: ");
    String operation = calculateScreen.getOperationInput();
    double num2 = calculateScreen.getNumberInput("Enter the second number: ");

    double result = calculateScreen.performOperation(num1, num2, operation);

    calculateScreen.displayResult(result);

    stdout.write("Do you want to continue? (yes/no): ");
    String continueInput = stdin.readLineSync()!.trim().toLowerCase();
    if (continueInput != 'yes') {
      print("Досвидос");
      break;
    }
  }
}
