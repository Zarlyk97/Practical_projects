class Item {
  int _counter = 0;
  void incrementCounter() {
    _counter++;
  }

  void decrementCounter() {
    if (_counter > 0) _counter--;
  }

  int getCounter() {
    return _counter;
  }
}
