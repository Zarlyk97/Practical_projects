// ignore_for_file: public_member_api_docs, sort_constructors_first
class OperationDetail {
  final double firstNumber;
  final String operation;
  final double secondNumber;
  final double result;

  OperationDetail({
    required this.firstNumber,
    required this.operation,
    required this.secondNumber,
    required this.result,
  });

  @override
  String toString() {
    return "$firstNumber $operation  $secondNumber = $result";
  }
}
