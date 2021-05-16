import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _PageAppBar(),
      drawer: _PageDrawer(),
      body: _PageBody(),
    );
  }
}

class _PageAppBar extends GoogleAppBar {
  const _PageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleAppBar(
      title: "Google UI",
      subtitle: "Awesome Flutter",
      actions: [
        IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
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
            title: const GoogleText("Accounts"),
            leading: const Icon(Icons.people_alt_outlined),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const GoogleText("username@gmail.com"),
            subtitle: const GoogleText(
              "111-111-1111",
              color: Colors.grey,
            ),
            onTap: () {},
          ),
          ListTile(
            title: const GoogleText("Campaign"),
            leading: const Icon(Icons.home_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const GoogleText("Billing Payments"),
            leading: const Icon(Icons.account_balance_outlined),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const GoogleText("Settings"),
            leading: const Icon(Icons.settings_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const GoogleText("Feedback"),
            leading: const Icon(Icons.feedback_outlined),
            onTap: () {},
          ),
          ListTile(
            title: const GoogleText("Support"),
            leading: const Icon(Icons.help_outlined),
            onTap: () {},
          ),
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
          _Switch(),
          Divider(),
          _Button(),
          Divider(),
          _Form(),
          Divider(),
          Typography()
        ],
      ),
    );
  }
}

class _Switch extends HookWidget {
  const _Switch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProviderConsumer = useProvider(themeProvider);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GoogleSwitch(
        label: "Dark mode",
        value: themeProviderConsumer.state,
        onChanged: (value) {
          themeProviderConsumer.state = value;
        },
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
            GoogleButton("login", onPressed: submit),
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

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleGrid(
      padding: const EdgeInsets.all(16),
      gap: 10,
      children: [
        GoogleButton(
          "Elevated",
          onPressed: () {},
        ),
        GoogleButton(
          "Text",
          onPressed: () {},
          variant: GoogleButtonVariant.text,
        ),
        GoogleButton(
          "Outlined",
          onPressed: () {},
          variant: GoogleButtonVariant.outlined,
        ),
        GoogleButton(
          "Elevated",
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        GoogleButton(
          "Text",
          onPressed: () {},
          variant: GoogleButtonVariant.text,
          icon: const Icon(Icons.add),
        ),
        GoogleButton(
          "Outlined",
          onPressed: () {},
          variant: GoogleButtonVariant.outlined,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
