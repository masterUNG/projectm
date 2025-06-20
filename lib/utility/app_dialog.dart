import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectm/widgets/widget_button.dart';

class AppDialog {
  void normalDialog({
    Widget? icon,
    Widget? title,
    Widget? content,
    Widget? firstButton,
    Widget? secondButton,
  }) {
    Get.dialog(
      AlertDialog(
        icon: icon,
        title: title,
        content: content,
        actions: [
          firstButton ?? SizedBox(),
          secondButton ??
              WidgetButton(
                text: 'Cancel',
                onPressed: () {
                  Get.back();
                },
              ),
        ],
      ),
    );
  }
}
