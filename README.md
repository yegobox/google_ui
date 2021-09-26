# Google UI
[![edsulaiman - google_ui](https://img.shields.io/static/v1?label=edsulaiman&message=google_ui&color=blue&logo=github)](https://github.com/edsulaiman/google_ui)
[![stars - google_ui](https://img.shields.io/github/stars/edsulaiman/google_ui?style=social)](https://github.com/edsulaiman/google_ui)
[![forks - google_ui](https://img.shields.io/github/forks/edsulaiman/google_ui?style=social)](https://github.com/edsulaiman/google_ui)
[![License](https://img.shields.io/badge/License-MIT-blue)](#license)
[![issues - google_ui](https://img.shields.io/github/issues/edsulaiman/google_ui)](https://github.com/edsulaiman/google_ui/issues)

Flutter UI library using Material Design 2.0.

[Google UI](https://pub.dev/packages/google_ui) is Flutter open-source UI library using [Material Design 2.0](https://uxdesign.cc/previewing-material-design-2-0-ec0215f0588f) with many pre-built widgets to make Flutter development easier and faster.

## Table of contents
- [Screenshots](#screenshots)
- [Get the package](#get-the-package)
- [Font family](#font-family)
- [Apply the theme to the app](#apply-the-theme-to-the-app)

## Screenshots
||||
|:---:|:---:|:---:|
|![](screenshots/button.jpg)|![](screenshots/button_d.jpg)|![](screenshots/select_box.jpg)|
|![](screenshots/select_box_d.jpg)|![](screenshots/text_form.jpg)|![](screenshots/text_form_d.jpg)|

## Get the package
To use this package as a library, [pub.dev](https://pub.dev/packages/google_ui/install)

## Font family
Google UI use Poppins as main font family.
- Download [Poppins](https://fonts.google.com/share?selection.family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500)
- Import font to `pubspec.yaml`
``` yaml
fonts:
  - family: Poppins
    fonts:
      - asset: fonts/Poppins/Poppins-Light.ttf
      - asset: fonts/Poppins/Poppins-LightItalic.ttf
        weight: 300
      - asset: fonts/Poppins/Poppins-Regular.ttf
      - asset: fonts/Poppins/Poppins-Italic.ttf
        weight: 400
      - asset: fonts/Poppins/Poppins-Medium.ttf
      - asset: fonts/Poppins/Poppins-MediumItalic.ttf
        weight: 500
```

## Apply the theme to the app
``` dart
import 'package:google_ui/google_ui.dart';
...
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google UI',
      theme: GThemeGenerator.generate(),
      darkTheme: GThemeGenerator.generateDark(),
      home: const HomePage(),
    );
  }
}
```