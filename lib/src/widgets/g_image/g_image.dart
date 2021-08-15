import 'package:flutter/material.dart';

class GImage extends StatelessWidget {
  const GImage({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.isAntiAlias = false,
    this.filterQuality = FilterQuality.low,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
  }) : super(key: key);

  final ImageProvider<Object> image;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BoxFit fit;
  final bool isAntiAlias;
  final FilterQuality filterQuality;
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: backgroundColor ?? colorScheme.onBackground.withOpacity(.75),
      child: Image(
        width: width,
        height: height,
        image: image,
        fit: fit,
        isAntiAlias: isAntiAlias,
        filterQuality: filterQuality,
        frameBuilder: frameBuilder,
        loadingBuilder: loadingBuilder,
        errorBuilder: errorBuilder,
      ),
    );
  }
}
