import 'package:flutter/material.dart';
import 'index.dart';

class GoogleDialog {
  static void showConfirmation(
    BuildContext context, {
    required String title,
    required String subtitle,
    String confirmLabel = "OK",
    String cancelLabel = "CANCEL",
    required void Function()? onConfirm,
  }) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: GoogleText(title, variant: GoogleTextVariant.headline6),
          content: GoogleText(subtitle),
          actions: <Widget>[
            GoogleButton(
              confirmLabel,
              onPressed: onConfirm,
              variant: GoogleButtonVariant.text,
            ),
            GoogleButton(
              cancelLabel,
              onPressed: () => Navigator.of(context).pop(),
              variant: GoogleButtonVariant.text,
            )
          ],
        );
      },
    );
  }

  static void showAlert(
    BuildContext context, {
    required String title,
    required String subtitle,
    String confirmLabel = "OK",
    void Function()? onPressed,
  }) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: GoogleText(title, variant: GoogleTextVariant.headline6),
          content: GoogleText(subtitle),
          actions: <Widget>[
            GoogleButton(
              confirmLabel,
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) onPressed();
              },
              variant: GoogleButtonVariant.text,
            )
          ],
        );
      },
    );
  }
}
