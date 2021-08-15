import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_ui/google_ui.dart';

class SelectBoxPage extends HookWidget {
  const SelectBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectBoxValue = useState(1);
    final multipleSelectBoxValue = useState(<int>[1]);
    final iconSelectBoxValue = useState(1);

    return Scaffold(
      appBar: const GAppBar(title: "Select Box"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GSectionTitle("Single select"),
            GSelectBox<int>(
              value: selectBoxValue.value,
              items: [
                GSelectBoxItem(
                  title: "Option 1",
                  subtitle: "This is description of current option",
                  value: 1,
                ),
                GSelectBoxItem(
                  title: "Option 2",
                  subtitle: "This is description of current option",
                  value: 2,
                ),
                GSelectBoxItem(
                  title: "Option 3",
                  subtitle: "This is description of current option",
                  value: 3,
                ),
              ],
              onChanged: (value) => selectBoxValue.value = value,
            ),
            const GSectionTitle("Multiple select"),
            GMultipleSelectBox<int>(
              values: multipleSelectBoxValue.value,
              items: [
                GSelectBoxItem(
                  title: "Option 1",
                  subtitle: "This is description of current option",
                  value: 1,
                ),
                GSelectBoxItem(
                  title: "Option 2",
                  subtitle: "This is description of current option",
                  value: 2,
                ),
                GSelectBoxItem(
                  title: "Option 3",
                  subtitle: "This is description of current option",
                  value: 3,
                ),
              ],
              onChanged: (values) => multipleSelectBoxValue.value = [...values],
            ),
            const GSectionTitle("With icon"),
            GSelectBox<int>(
              value: iconSelectBoxValue.value,
              items: [
                GSelectBoxItem(
                  title: "Option 1",
                  icon: const Icon(Icons.wifi),
                  value: 1,
                ),
                GSelectBoxItem(
                  title: "Option 2",
                  icon: const Icon(Icons.bluetooth),
                  value: 2,
                ),
                GSelectBoxItem(
                  title: "Option 3",
                  icon: const Icon(Icons.location_on),
                  value: 3,
                ),
              ],
              onChanged: (value) => iconSelectBoxValue.value = value,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
