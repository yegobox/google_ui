import 'package:flutter/material.dart';
import '../google_button/google_button.dart';
import '../google_text/google_text.dart';

/// Create a error message,
/// usually displayed on the page when an error occurs
/// such as no internet error, not found error, and others.
class GoogleErrorMessage extends StatelessWidget {
  const GoogleErrorMessage({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonLabel,
    this.onPressed,
  }) : super(key: key);

  /// An icon to display.
  final Widget icon;

  /// An error title.
  final String title;

  /// A description to explain the error
  final String subtitle;

  /// Text that describes the button.
  final String? buttonLabel;

  /// A callback after the user click the button.
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.primary.withOpacity(.2)),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      iconTheme: IconThemeData(
                        size: 40,
                        color: colorScheme.primary,
                      ),
                    ),
                    child: icon,
                  ),
                ),
                const SizedBox(height: 16),
                GoogleText(title),
                const SizedBox(height: 16),
                GoogleText(
                  subtitle,
                  variant: GoogleTextVariant.bodyText2,
                  color: colorScheme.onBackground.withOpacity(.75),
                  textAlign: TextAlign.center,
                ),
                if (onPressed != null) const SizedBox(height: 32),
                if (onPressed != null)
                  GoogleButton(buttonLabel ?? "", onPressed: onPressed)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
