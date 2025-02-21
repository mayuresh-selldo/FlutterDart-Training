import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier {
  int value;

  CounterProvider({
    this.value = 0,
  });

  void incrementCounter() {
    value++;
    notifyListeners();
  }

  void decrementCounter() {
    value--;
    notifyListeners();
  }
}
