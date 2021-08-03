import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';

class SelectBoxPage extends HookWidget {
  const SelectBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectBoxValue = useState(1);
    final multipleSelectBoxValue = useState(<int>[1]);

    return Scaffold(
      appBar: const GoogleAppBar(title: "Select Box"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GoogleSectionTitle("Single select"),
            GoogleSelectBox<int>(
              value: selectBoxValue.value,
              items: [
                GoogleSelectBoxItem(
                  label: "Option 1",
                  value: 1,
                ),
                GoogleSelectBoxItem(
                  label: "Option 2",
                  value: 2,
                ),
                GoogleSelectBoxItem(
                  label: "Option 3",
                  value: 3,
                ),
              ],
              onChanged: (value) => selectBoxValue.value = value,
            ),
            const GoogleSectionTitle("Multiple select"),
            GoogleMultipleSelectBox<int>(
              values: multipleSelectBoxValue.value,
              items: [
                GoogleSelectBoxItem(
                  label: "Option 1",
                  value: 1,
                ),
                GoogleSelectBoxItem(
                  label: "Option 2",
                  value: 2,
                ),
                GoogleSelectBoxItem(
                  label: "Option 3",
                  value: 3,
                ),
              ],
              onChanged: (values) => multipleSelectBoxValue.value = [...values],
            )
          ],
        ),
      ),
    );
  }
}
