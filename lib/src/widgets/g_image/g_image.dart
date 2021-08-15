import 'package:flutter/material.dart';

/// Creates a widget that displays an image.
class GImage extends StatelessWidget {
  const GImage({
    Key? key,
    required this.image,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.isAntiAlias = false,
    this.filterQuality = FilterQuality.low,
    this.frameBuilder,
    this.loadingBuilder,
    this.errorBuilder,
  }) : super(key: key);

  /// The image to display.
  final ImageProvider<Object> image;

  /// If non-null, require the image to have this width.
  final double? width;

  /// If non-null, require the image to have this height.
  final double? height;

  /// The border radius of the rounded corners.
  final BorderRadius? borderRadius;

  /// The color to paint behind the [image].
  final Color? backgroundColor;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit fit;

  /// Whether to paint the image with anti-aliasing.
  final bool isAntiAlias;

  /// The rendering quality of the image.
  final FilterQuality filterQuality;

  /// A builder function responsible for creating the widget that represents this image.
  final Widget Function(BuildContext, Widget, int?, bool)? frameBuilder;

  /// A builder that specifies the widget to display to the user while an image is still loading.
  final Widget Function(BuildContext, Widget, ImageChunkEvent?)? loadingBuilder;

  /// A builder function that is called if an error occurs during image loading.
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
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
      ),
    );
  }
}
