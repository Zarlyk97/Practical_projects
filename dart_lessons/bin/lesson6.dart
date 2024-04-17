void main() {
  Map<String, int> myMap = {'one': 1, 'two': 2, 'three': 3, 'four': 4};
  print(myMap);
  final map = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};
  print(map);
  map.remove(4);
  print(map);
}
