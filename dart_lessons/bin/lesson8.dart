void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print(numbers);
  numbers.removeAt(2);
  print(numbers);
  numbers.removeLast();
  print(numbers);
  int result = numbers.reduce((value, element) => value + element);
  print(result);
}
