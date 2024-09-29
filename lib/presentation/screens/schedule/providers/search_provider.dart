import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchPanelProvider = ChangeNotifierProvider<SearchPanelNotifier>((ref) {
  return SearchPanelNotifier();
});

class SearchPanelNotifier extends ChangeNotifier {
  bool searchPanelVisible = false;

  openPanel(){
    searchPanelVisible = true;
    notifyListeners();
  }

  closePanel(){
    searchPanelVisible = false;
    notifyListeners();
  }
}