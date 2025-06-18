import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  bool _loading = true;

  bool get loading => _loading;

  toggleLoading() {
    _loading = !_loading;
    notifyListeners();
  }
}
