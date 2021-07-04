import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class TypographyPage extends StatelessWidget {
  const TypographyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GoogleAppBar(title: "Typography"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GoogleText("Font family: Poppins"),
              GoogleText("Font weight: 300, 400, 500"),
              Divider(height: 32),
              GoogleText(
                "headline1",
                variant: GoogleTextVariant.headline1,
              ),
              GoogleText(
                "headline2",
                variant: GoogleTextVariant.headline2,
              ),
              GoogleText(
                "headline3",
                variant: GoogleTextVariant.headline3,
              ),
              GoogleText(
                "headline4",
                variant: GoogleTextVariant.headline4,
              ),
              GoogleText(
                "headline5",
                variant: GoogleTextVariant.headline5,
              ),
              GoogleText(
                "headline6",
                variant: GoogleTextVariant.headline6,
              ),
              GoogleText(
                "subtitle1",
                variant: GoogleTextVariant.subtitle1,
              ),
              GoogleText(
                "subtitle2",
                variant: GoogleTextVariant.subtitle2,
              ),
              GoogleText("bodyText1"),
              GoogleText(
                "bodyText2",
                variant: GoogleTextVariant.bodyText2,
              ),
              GoogleText(
                "button",
                variant: GoogleTextVariant.button,
              ),
              GoogleText(
                "caption",
                variant: GoogleTextVariant.caption,
              ),
              GoogleText(
                "overline",
                variant: GoogleTextVariant.overline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
