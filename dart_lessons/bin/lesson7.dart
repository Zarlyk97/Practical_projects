void main() {
  print("Hello, World!");
  final set = {'one', 'two', 'three', 'four'};
  print(set);
  set.add('five');
  print(set);
  print(set.contains('four'));
  print(set.contains('six'));
}
