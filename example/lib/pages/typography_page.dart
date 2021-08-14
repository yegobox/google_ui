import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "Typography"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GText("Font family: Poppins"),
              GText("Font weight: 300, 400, 500"),
              Divider(height: 32),
              GText(
                "headline1",
                variant: GTextVariant.headline1,
              ),
              GText(
                "headline2",
                variant: GTextVariant.headline2,
              ),
              GText(
                "headline3",
                variant: GTextVariant.headline3,
              ),
              GText(
                "headline4",
                variant: GTextVariant.headline4,
              ),
              GText(
                "headline5",
                variant: GTextVariant.headline5,
              ),
              GText(
                "headline6",
                variant: GTextVariant.headline6,
              ),
              GText(
                "subtitle1",
                variant: GTextVariant.subtitle1,
              ),
              GText(
                "subtitle2",
                variant: GTextVariant.subtitle2,
              ),
              GText("bodyText1"),
              GText(
                "bodyText2",
                variant: GTextVariant.bodyText2,
              ),
              GText(
                "button",
                variant: GTextVariant.button,
              ),
              GText(
                "caption",
                variant: GTextVariant.caption,
              ),
              GText(
                "overline",
                variant: GTextVariant.overline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
