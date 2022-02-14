import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_ui/google_ui.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Google UI example",
      theme: GThemeGenerator.generate(),
      darkTheme: GThemeGenerator.generateDark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GAppBar(title: "Google UI example"),
      drawer: const _Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            _Button(),
            _ListTile(),
            _Switch(),
            _CheckBox(),
            _Radio(),
            _SelectBox(),
            _TextFormField(),
            _AppBar(),
            _Grid(),
            _ErrorMessage(),
            _Text(),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Button"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GElevatedButton(
                "Elevated",
                onPressed: () {},
              ),
              GTextButton(
                "Text",
                onPressed: () {},
              ),
              GOutlinedButton(
                "Outlined",
                onPressed: () {},
              ),
              GElevatedButton(
                "Elevated",
                icon: const Icon(Icons.star),
                onPressed: () {},
              ),
              GTextButton(
                "Text",
                icon: const Icon(Icons.star),
                onPressed: () {},
              ),
              GOutlinedButton(
                "Outlined",
                icon: const Icon(Icons.star),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GSectionTitle("List tile"),
        GListTile(
          title: "Title",
          subtitle: "Subtitle",
        ),
      ],
    );
  }
}

class _Switch extends StatefulWidget {
  const _Switch({Key? key}) : super(key: key);

  @override
  State<_Switch> createState() => _SwitchState();
}

class _SwitchState extends State<_Switch> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Switch"),
        GSwitch(
          title: "Switch",
          subtitle: "Switch subtitle",
          value: value,
          onChanged: (value) => setState(() => this.value = value),
        ),
      ],
    );
  }
}

class _CheckBox extends StatefulWidget {
  const _CheckBox({Key? key}) : super(key: key);

  @override
  State<_CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<_CheckBox> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Check box"),
        GCheckBox(
          title: "Check box",
          subtitle: "Check box subtitle",
          value: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
      ],
    );
  }
}

class _Radio extends StatefulWidget {
  const _Radio({Key? key}) : super(key: key);

  @override
  State<_Radio> createState() => _RadioState();
}

class _RadioState extends State<_Radio> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Radio"),
        GRadio<int>(
          title: "Radio 1",
          value: 1,
          groupValue: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
        GRadio<int>(
          title: "Radio 2",
          value: 2,
          groupValue: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
        GRadio<int>(
          title: "Radio 3",
          value: 3,
          groupValue: value,
          onChanged: (value) => setState(() => this.value = value!),
        ),
      ],
    );
  }
}

class _SelectBox extends StatefulWidget {
  const _SelectBox({Key? key}) : super(key: key);

  @override
  State<_SelectBox> createState() => _SelectBoxState();
}

class _SelectBoxState extends State<_SelectBox> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Select box"),
        GSelectBox<int>(
          value: value,
          items: [
            GSelectBoxItem(
              title: "Select 1",
              value: 1,
            ),
            GSelectBoxItem(
              title: "Select 2",
              value: 2,
            ),
            GSelectBoxItem(
              title: "Select 3",
              value: 3,
            ),
          ],
          onChanged: (value) => setState(() => this.value = value),
        ),
      ],
    );
  }
}

class _TextFormField extends StatelessWidget {
  const _TextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Text form field"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GTextFormField(labelText: "Username"),
              SizedBox(height: 16),
              GTextFormField(
                labelText: "Password",
                passwordField: true,
              ),
              SizedBox(height: 16),
              GDateTextFormField(labelText: "Date"),
            ],
          ),
        )
      ],
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("App Bar"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              GAppBar(title: "App bar"),
              SizedBox(height: 16),
              GSearchAppBar(
                title: "Search app bar",
                hintText: "Search something...",
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Grid extends StatelessWidget {
  const _Grid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GSectionTitle("Grid"),
        GGrid(
          gap: 16,
          padding: EdgeInsets.all(16),
          columnCount: 3,
          children: [
            GCard(
              padding: EdgeInsets.all(8),
              child: GText("Card"),
            ),
            GCard(
              padding: EdgeInsets.all(8),
              child: GText("Card"),
            ),
            GCard(
              padding: EdgeInsets.all(8),
              child: GText("Card"),
            ),
            GCard(
              padding: EdgeInsets.all(8),
              child: GText("Card"),
            ),
            GCard(
              padding: EdgeInsets.all(8),
              child: GText("Card"),
            ),
            GCard(
              padding: EdgeInsets.all(8),
              child: GText("Card"),
            ),
          ],
        )
      ],
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Error message"),
        GErrorMessage(
          icon: const Icon(Icons.wifi_off_outlined),
          title: "No internet",
          subtitle:
              "Can't connect to the internet.\nPlease check your internet connection",
          onPressed: () {},
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const GSectionTitle("Text"),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
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
              GText(
                "bodyText1",
                variant: GTextVariant.bodyText1,
              ),
              GText("bodyText2"),
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
        )
      ],
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GDrawer(
      child: Column(
        children: [
          const GSectionTitle("Drawer list tile"),
          GDrawerListTile(
            leading: const Icon(Icons.inbox_outlined),
            title: "Inbox",
            trailing: const Text("1"),
            selected: true,
            onTap: () {},
          ),
          GDrawerListTile(
            leading: const Icon(Icons.drafts_outlined),
            title: "Unread",
            onTap: () {},
          ),
          GDrawerListTile(
            leading: const Icon(Icons.star_outlined),
            title: "Starred",
            trailing: const Text("10"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
