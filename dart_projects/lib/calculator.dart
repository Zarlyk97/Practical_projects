import 'package:exemple_dart/screen.dart';

class CalculateScreen extends Screen {
  late double num1;
  late double num2;

  void setNum1(double number) {
    num1 = number;
  }

  void setNum2(double number) {
    num2 = number;
  }

  void add() {
    double result = num1 + num2;
    HistoryScreen.addOperationDetails("$num1 + $num2 = $result");
  }

  void subtract() {
    double result = num1 - num2;
    HistoryScreen.addOperationDetails("$num1 - $num2 = $result");
  }

  void multiply() {
    double result = num1 * num2;
    HistoryScreen.addOperationDetails("$num1 * $num2 = $result");
  }

  void divide() {
    double result = num1 / num2;
    HistoryScreen.addOperationDetails("$num1 / $num2 = $result");
  }
}

class HistoryScreen extends Screen {
  static List<OperationDetail> operations = [];

  static void addOperationDetails(String details) {
    operations.add(OperationDetail(details));
  }

  // void removeOperation(int index) {
  //   operations.removeAt(index);
  // }
}

class OperationDetail {
  String expression;

  OperationDetail(this.expression);

  @override
  String toString() => expression;
}
