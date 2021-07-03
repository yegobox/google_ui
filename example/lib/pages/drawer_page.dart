import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';

class DrawerPage extends HookWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerIndex = useState(0);

    return Scaffold(
      appBar: const GoogleAppBar(title: "Button"),
      // drawer: GoogleGroupedDrawer(
      //   index: drawerIndex.value,
      //   onChanged: (int index) => drawerIndex.value = index,
      //   groups: const [
      //     Icons.shopping_cart,
      //     Icons.inbox,
      //   ],
      //   groupViews: const [
      //     Text("Page 1"),
      //     Text("Page 2"),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Builder(
            builder: (context) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GoogleButton(
                  "Open Drawer".toUpperCase(),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
