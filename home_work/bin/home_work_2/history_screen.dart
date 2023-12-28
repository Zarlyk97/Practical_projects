import 'operation_detail.dart';

class HistoryScreen {
  List<OperationDetail> history = [];

  void addOperationDetails(OperationDetail details) {
    history.add(details);
    print('History updated');
  }

  void showHistory() {
    if (history.isEmpty) {
      print('History is empty');
    } else {
      print('operation history');
      for (var entry in history) {
        print(entry.toString());
      }
    }
  }
}
