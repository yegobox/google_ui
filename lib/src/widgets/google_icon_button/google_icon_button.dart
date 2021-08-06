import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Create an icon button.
class GoogleIconButton extends HookWidget {
  const GoogleIconButton({
    Key? key,
    this.size = const Size(48, 48),
    this.splashSize = const Size(40, 40),
    required this.onPressed,
    this.onLongPress,
    required this.icon,
  }) : super(key: key);

  /// Size of [GoogleIconButton] that can receiving input
  final Size size;

  /// Size of splash effect.
  final Size splashSize;

  /// A callback after user pressed the button.
  final void Function()? onPressed;

  /// A callback when the user long presses the button.
  final void Function()? onLongPress;

  /// An icon to display.
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final showSplash = useState(false);
    final isDisable = onPressed == null && onLongPress == null;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        onLongPress: onLongPress,
        onTapDown: (det) => !isDisable ? showSplash.value = true : null,
        onTapUp: (det) => !isDisable
            ? Future.delayed(
                const Duration(milliseconds: 200),
                () => showSplash.value = false,
              )
            : null,
        onTapCancel: () => !isDisable ? showSplash.value = false : null,
        behavior: HitTestBehavior.translucent,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.slowMiddle,
              width: showSplash.value ? splashSize.width : 0,
              height: showSplash.value ? splashSize.height : 0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(.25),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: Opacity(opacity: isDisable ? .5 : 1, child: icon),
            ),
          ],
        ),
      ),
    );
  }
}
