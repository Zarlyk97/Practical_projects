import 'package:exemple_dart/calculator.dart';

void main() {
  CalculateScreen calculator = CalculateScreen();

  calculator.setNum1(35);
  calculator.setNum2(4);
  calculator.add();
//////////////////
  calculator.setNum1(256);
  calculator.setNum2(26);
  calculator.subtract();
  ////////////////////
  calculator.setNum1(4100);
  calculator.setNum2(456);
  calculator.multiply();
  ////////////////////
  calculator.setNum1(5446);
  calculator.setNum2(55);
  calculator.divide();

  for (OperationDetail op in HistoryScreen.operations) {
    print(op);
  }
}
