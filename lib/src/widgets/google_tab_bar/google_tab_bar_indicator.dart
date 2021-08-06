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

    const double height = 3;
    const double borderRadius = 8;

    final rect = Offset(
          offset.dx,
          configuration.size!.height - height,
        ) &
        Size(
          configuration.size!.width,
          height,
        );

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(borderRadius),
        topLeft: const Radius.circular(borderRadius),
      ),
      paint,
    );
  }
}
