import 'package:flutter/material.dart';
import 'package:cyber_safe/core/enums.dart';
import 'package:cyber_safe/core/extensions/widget+ext.dart';
import 'package:cyber_safe/core/utils.dart';

class BaseViewModel extends ChangeNotifier {
  State? widgetState;
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void showDialog(DialogContent dialogContent) {
    if (widgetState == null) {
      return;
    }
    widgetState!.widget.showCustomDialog(widgetState!.context, dialogContent);
  }

  void setState(ViewState state) {
    _state = state;
    notifyListeners();
  }
}
