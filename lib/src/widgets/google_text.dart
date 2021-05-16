import 'package:flutter/material.dart';

enum GoogleTextVariant {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  bodyText2,
  button,
  caption,
  overline,
}

class GoogleText extends StatelessWidget {
  const GoogleText(
    this.text, {
    Key? key,
    this.variant = GoogleTextVariant.bodyText1,
    this.textAlign,
    this.color,
    this.textOverflow,
    this.maxLines,
    this.softWrap,
  }) : super(key: key);

  final String text;
  final GoogleTextVariant variant;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final bool? softWrap;

  TextStyle _textStyle(BuildContext context) {
    switch (variant) {
      case GoogleTextVariant.headline1:
        return Theme.of(context).textTheme.headline1!;

      case GoogleTextVariant.headline2:
        return Theme.of(context).textTheme.headline2!;

      case GoogleTextVariant.headline3:
        return Theme.of(context).textTheme.headline3!;

      case GoogleTextVariant.headline4:
        return Theme.of(context).textTheme.headline4!;

      case GoogleTextVariant.headline5:
        return Theme.of(context).textTheme.headline5!;

      case GoogleTextVariant.headline6:
        return Theme.of(context).textTheme.headline6!;

      case GoogleTextVariant.subtitle1:
        return Theme.of(context).textTheme.subtitle1!;

      case GoogleTextVariant.subtitle2:
        return Theme.of(context).textTheme.subtitle2!;

      case GoogleTextVariant.bodyText1:
        return Theme.of(context).textTheme.bodyText1!;

      case GoogleTextVariant.bodyText2:
        return Theme.of(context).textTheme.bodyText2!;

      case GoogleTextVariant.button:
        return Theme.of(context).textTheme.button!;

      case GoogleTextVariant.caption:
        return Theme.of(context).textTheme.caption!;

      case GoogleTextVariant.overline:
        return Theme.of(context).textTheme.overline!;

      default:
        return Theme.of(context).textTheme.bodyText1!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _textStyle(context).copyWith(color: color),
      overflow: textOverflow,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
