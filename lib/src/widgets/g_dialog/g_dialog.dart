import 'package:flutter/material.dart';

import '../g_button/g_button.dart';
import '../g_text/g_text.dart';

/// Display a dialog.
class GDialog {
  /// A dialog that is usually displayed asking the user to confirm before taking an action.
  static void showConfirmation(
    BuildContext context, {
    required String title,
    required String subtitle,
    String confirmLabel = "Ok",
    String cancelLabel = "Cancel",
    required void Function()? onConfirm,
  }) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: GText(title, variant: GTextVariant.headline6),
          content: GText(subtitle),
          actions: <Widget>[
            GButton(
              confirmLabel,
              onPressed: onConfirm,
              variant: GButtonVariant.text,
            ),
            GButton(
              cancelLabel,
              onPressed: () => Navigator.of(context).pop(),
              variant: GButtonVariant.text,
            )
          ],
        );
      },
    );
  }

  /// A dialog that is usually displayed to display an alert message.
  static void showAlert(
    BuildContext context, {
    required String title,
    required String subtitle,
    String confirmLabel = "Ok",
    void Function()? onConfirm,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: GText(title, variant: GTextVariant.headline6),
          content: GText(subtitle),
          actions: <Widget>[
            GButton(
              confirmLabel,
              onPressed: () {
                Navigator.of(context).pop();
                if (onConfirm != null) onConfirm();
              },
              variant: GButtonVariant.text,
            )
          ],
        );
      },
    );
  }
}
