import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Bar"),
          bottom: const TabBar(
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
          elevation: 1,
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
      ),
    );
  }
}
