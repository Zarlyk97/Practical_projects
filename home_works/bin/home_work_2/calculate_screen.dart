import 'history_screen.dart';
import 'math.dart';
import 'operation_detail.dart';
import 'screen.dart';

class CalculateScreen extends Screen {
  HistoryScreen historyScreen = HistoryScreen();
  Math math = Math();

  CalculateScreen() : super();

  double performOperation(double num1, double num2, String operation) {
    late double result;

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
        return double.nan;
    }

    OperationDetail operationDetail = OperationDetail(
      firstNumber: num1,
      operation: operation,
      secondNumber: num2,
      result: result,
    );
    historyScreen.addOperationDetails(operationDetail);
    return result;
  }
}
