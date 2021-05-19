# Google UI
A collection of widgets that look similar to widgets in the Google Ads app.

I created this project to speed up my application development process by creating some reusable widgets. every widget in this project is made to look similar to the widgets in the Google Ads application.

## Screenshots
|Light mode|Dark Mode|
|:---:|:---:|
|![](screenshots/light_mode.jpg)|![](screenshots/dark_mode.jpg)|

## Getting Started

Apply google_ui theme to your app
```dart
import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

import 'pages/index.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const theme = GoogleTheme();

    return MaterialApp(
      title: "Google UI",
      theme: theme.apply(),
      darkTheme: theme.apply(darkMode: true),
      home: const HomePage(),
    );
  }
}
```
## Using Widget
### GoogleButton
```dart
// Elevated Button
GoogleButton(
  "Elevated".toUpperCase(),
  onPressed: () {},
),

//Elevated Icon Button
GoogleButton(
  "Elevated".toUpperCase(),
  onPressed: () {},
  icon: const Icon(Icons.add),
),

// Text Button
GoogleButton(
  "Text".toUpperCase(),
  onPressed: () {},
  variant: GoogleButtonVariant.text,
),

...
// Available Variant
GoogleButtonVariant.elevated
GoogleButtonVariant.text
GoogleButtonVariant.outlined
```

### GoogleSwitch 
``` dart
GoogleSwitch(
  label: "Dark mode",
  value: themeProviderConsumer.state,
  onChanged: (value) {
    themeProviderConsumer.state = value;
  },
)
```

### GoogleGrid 
``` dart
GoogleGrid(
  padding: const EdgeInsets.all(16),
  gap: 10,
  children: [],
)
```

### Typography
``` dart
GoogleText(
  "headline1",
  variant: GoogleTextVariant.headline1,
),
....
// Available Variant
GoogleTextVariant.headline1
GoogleTextVariant.headline2
GoogleTextVariant.headline3
GoogleTextVariant.headline4
GoogleTextVariant.headline5
GoogleTextVariant.headline6
GoogleTextVariant.subtitle1
GoogleTextVariant.subtitle2
GoogleTextVariant.bodyText1
GoogleTextVariant.bodyText2
GoogleTextVariant.button
GoogleTextVariant.caption
GoogleTextVariant.overline
```