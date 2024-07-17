import 'package:flutter/material.dart';
import 'package:cyber_safe/core/utils.dart';

extension WidgetExt on Widget {
  void showCustomDialog(BuildContext context, DialogContent dialogContent) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(dialogContent.title),
            content: Text(dialogContent.content),
            actions: dialogContent.buttons
                .asMap()
                .map((index, button) => MapEntry(
                    index,
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        dialogContent.buttonActions[index]();
                      },
                      child: Text(button),
                    )))
                .values
                .toList(),
          );
        });
  }
}
