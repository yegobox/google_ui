import 'package:flutter/material.dart';

class GoogleTabBarIndicator extends Decoration {
  const GoogleTabBarIndicator(this.color);

  final Color color;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _GoogleTabBarIndicatorPainter(color);
  }
}

class _GoogleTabBarIndicatorPainter extends BoxPainter {
  const _GoogleTabBarIndicatorPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromCenter(
          center: offset +
              Offset(
                configuration.size!.width / 2,
                configuration.size!.height,
              ),
          width: configuration.size!.width,
          height: configuration.size!.height / 8,
        ),
        topRight: const Radius.circular(3),
        topLeft: const Radius.circular(3),
      ),
      paint,
    );
  }
}
