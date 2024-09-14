import 'dart:math';

import 'package:cyber_safe/core/utils/global_keys.dart';
import 'package:cyber_safe/ui/base/base_view_model.dart';
import 'package:flutter/material.dart';

class PassGenViewModel extends BaseViewModel {
  bool isFromForm = false;
  Function(String)? onPasswordChanged;

  ValueNotifier<int> passLength = ValueNotifier<int>(8);

  ValueNotifier<bool> isNumber = ValueNotifier<bool>(true);
  ValueNotifier<bool> isSymbol = ValueNotifier<bool>(true);

  ValueNotifier<String> password = ValueNotifier<String>("");

  ValueNotifier<List<InlineSpan>> passwordInline =
      ValueNotifier<List<InlineSpan>>([]);

  final String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
  final String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  final String numbers = "0123456789";
  final String special = "@#=+!£\$%&?[](){}";

  void generatePassword() {
    String allowedChars = "";
    passwordInline.value = [];
    allowedChars += (_lowerCaseLetters);
    allowedChars += (_upperCaseLetters);
    if (isNumber.value) {
      allowedChars += (numbers);
    }
    if (isSymbol.value) {
      allowedChars += (special);
    }

    String result = "";
    for (int i = 0; i < passLength.value; i++) {
      result += allowedChars[Random().nextInt(allowedChars.length)];
    }
    password.value = result;

    //if symble is allowed add TextSpan color red

    for (int i = 0; i < result.length; i++) {
      if (special.contains(result[i])) {
        passwordInline.value.add(
          TextSpan(
            text: result[i],
            style: const TextStyle(color: Colors.redAccent),
          ),
        );
      } else if (numbers.contains(result[i])) {
        passwordInline.value.add(
          TextSpan(
            text: result[i],
            style: const TextStyle(color: Colors.blueAccent),
          ),
        );
      } else {
        passwordInline.value.add(
          TextSpan(
            text: result[i],
            style: TextStyle(
                color: Theme.of(GlobalKeys.appRootNavigatorKey.currentContext!)
                    .colorScheme
                    .onSecondaryContainer),
          ),
        );
      }
      notifyListeners();
    }
  }
}
