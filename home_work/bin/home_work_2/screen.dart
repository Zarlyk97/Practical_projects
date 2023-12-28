import 'dart:io';

class Screen {
  double getNumberInput(String prompt) {
    stdout.write(prompt);
    String userInput = stdin.readLineSync()!;
    return double.parse(userInput);
  }

///////////////////////////////////////////////
  String getOperationInput() {
    stdout.write("Operation (+, -, *, /): ");
    String operation = stdin.readLineSync()!.trim();
    return operation;
  }

  void displayResult(double result) {
    print("Result: $result");
  }
}
