import 'package:flutter/material.dart';

import 'index.dart';

class GoogleErrorPage extends StatelessWidget {
  const GoogleErrorPage({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle1,
    this.label,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle1;
  final String? label;
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
                  child: Icon(icon, color: colorScheme.primary, size: 40),
                ),
                const SizedBox(height: 16),
                GoogleText(title),
                const SizedBox(height: 16),
                GoogleText(
                  subtitle1,
                  variant: GoogleTextVariant.bodyText2,
                  color: colorScheme.onBackground.withOpacity(.75),
                  textAlign: TextAlign.center,
                ),
                if (onPressed != null) const SizedBox(height: 32),
                if (onPressed != null)
                  GoogleButton(label ?? "", onPressed: onPressed)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
