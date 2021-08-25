import 'package:flutter/material.dart';
import 'package:google_ui/google_ui.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: GAppBar(
          title: "Tab Bar",
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight + 1),
            child: Column(
              children: const [
                TabBar(
                  tabs: [
                    Tab(text: "For you"),
                    Tab(text: "Top charts"),
                    Tab(text: "Children"),
                    Tab(text: "Events"),
                    Tab(text: "Premium"),
                    Tab(text: "Categories"),
                    Tab(text: "Editors' Choice"),
                  ],
                  isScrollable: true,
                ),
                Divider(height: 0),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("For you")),
            Center(child: Text("Top charts")),
            Center(child: Text("Children")),
            Center(child: Text("Events")),
            Center(child: Text("Premium")),
            Center(child: Text("Categories")),
            Center(child: Text("Editors' Choice")),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              activeIcon: Icon(Icons.star),
              label: "Starred",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outlined),
              activeIcon: Icon(Icons.people),
              label: "Shared",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_outlined),
              activeIcon: Icon(Icons.folder),
              label: "Files",
            ),
          ],
        ),
      ),
    );
  }
}
