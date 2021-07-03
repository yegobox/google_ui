import 'package:example/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GoogleAppBar(title: "Google UI"),
      drawer: _PageDrawer(),
      body: _PageBody(),
    );
  }
}

class _PageDrawer extends StatelessWidget {
  const _PageDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleDrawer(
      child: Column(
        children: [
          ListTile(
            title: const Text("Button"),
            onTap: () {
              Navigator.of(context)
                ..pop()
                ..push(
                  MaterialPageRoute(builder: (context) => const ButtonPage()),
                );
            },
          ),
          ListTile(
              title: const Text("Text Field"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(
                        builder: (context) => const TextFieldPage()),
                  );
              }),
          ListTile(
              title: const Text("App Bar"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(builder: (context) => const AppBarPage()),
                  );
              }),
          ListTile(title: const Text("Drawer"), onTap: () {}),
          ListTile(
              title: const Text("Calendar"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(
                        builder: (context) => const CalendarPage()),
                  );
              }),
          ListTile(
              title: const Text("Typography"),
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute(
                        builder: (context) => const TypographyPage()),
                  );
              }),
        ],
      ),
    );
  }
}

class _PageBody extends HookWidget {
  const _PageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          GoogleCalendar(),
          Divider(),
          Divider(),
          _Form(),
          Divider(),
          Typography()
        ],
      ),
    );
  }
}

class _Form extends HookWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = useState(GlobalKey<FormState>());
    final username = useState("");
    final password = useState("");
    final dateTime = useState(DateTime.now());

    void onUsernameSave(value) => username.value = value ?? "";

    void onPasswordSave(value) => password.value = value ?? "";

    void onDateSave(value) => dateTime.value = value ?? DateTime.now();

    String? dateValidator(value, isValid) {
      if (!isValid) return "Date is not valid";
    }

    void submit() {
      if (formKey.value.currentState!.validate()) {
        formKey.value.currentState!.save();
      }
    }

    return Form(
      key: formKey.value,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GoogleTextFormField(
              labelText: "Username",
              prefixIcon: const Icon(Icons.person),
              onSaved: onUsernameSave,
            ),
            const SizedBox(height: 16),
            GoogleTextFormField(
              labelText: "Password",
              passwordField: true,
              prefixIcon: const Icon(Icons.vpn_key),
              onSaved: onPasswordSave,
            ),
            const SizedBox(height: 16),
            GoogleDateTextFormField(
              labelText: "Date",
              prefixIcon: const Icon(Icons.vpn_key),
              validator: dateValidator,
              onSaved: onDateSave,
            ),
            GoogleButton("Login", onPressed: submit),
            if (username.value.isNotEmpty || password.value.isNotEmpty)
              GoogleText(
                  "${username.value}\n${password.value}\n${dateTime.value.toString()}"),
          ],
        ),
      ),
    );
  }
}

class Typography extends StatelessWidget {
  const Typography({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
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
    );
  }
}
