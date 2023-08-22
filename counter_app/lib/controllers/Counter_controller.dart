import 'package:counter_app/modal/counter_modal.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterController extends ChangeNotifier {
  Counter _counter = Counter();

  late SharedPreferences preferences;

  CounterController({required this.preferences});

  get getCounter {
    _counter.counterValue = preferences.getInt("counterValue") ?? 0;

    return _counter.counterValue;
  }

  void increase() {
    _counter.counterValue++;
    preferences.setInt("counterValue", _counter.counterValue);
    notifyListeners();
  }

  void decrease() {
    _counter.counterValue--;
    preferences.setInt("counterValue", _counter.counterValue);
    notifyListeners();
  }
}
