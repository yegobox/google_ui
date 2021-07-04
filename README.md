# Google UI
Flutter UI library using Material Design 2.0.

[Google UI](https://pub.dev/packages/google_ui) is Flutter open-source UI library using [Material Design 2.0](https://uxdesign.cc/previewing-material-design-2-0-ec0215f0588f) with many pre-built widgets to make Flutter development easier and faster.

## Screenshots
|Light mode|Dark Mode|
|:---:|:---:|
|![](screenshots/light_mode.jpg)|![](screenshots/dark_mode.jpg)|


## Getting Started

### Font family
Google UI use Poppins as main font family.
- Donwload [Poppins](https://fonts.google.com/share?selection.family=Poppins:ital,wght@0,300;0,400;0,500;1,300;1,400;1,500)
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

### Apply the theme to the app
```
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const theme = GoogleTheme();

    return MaterialApp(
      title: 'Google UI',
      theme: theme.apply(),
      darkTheme: theme.apply(darkMode: true),
      home: const HomePage(),
    );
  }
}
```

## Usage
All Google UI class has `Google` prefix e.g `GoogleButton`

### Available widget
- GoogleAppBar
- GoogleBottomBar
- GoogleButton
- GoogleCalendar
- GoogleConditional
- GoogleCustomAppBar
- GoogleDateTextFormField
- GoogleDialog
- GoogleDrawer
- GoogleErrorMessage
- GoogleGrid
- GoogleGroupedDrawer
- GoogleIconButton
- GooglePopupMenuButton
- GoogleSearchAppBar
- GoogleSectionTitle
- GoogleSelectBox
- GoogleSwitch
- GoogleTextFormField
- GoogleText

### Available util
- GoogleColorUtil