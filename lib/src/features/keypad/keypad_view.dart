import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:softphone_flutter/src/util/appbar.dart';

class Keypad extends StatefulWidget {
  const Keypad({super.key});
  static const String routeName = '/Home';

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  List<List<String>> keyList = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['*', '0', '#'],
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: softphoneAppBar(context), body: keypadContainer());
  }

  Column keypadContainer() {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      for (final keys in keyList)
        Expanded(
            child: Row(children: [
          for (final key in keys)
            Expanded(
                child: RawMaterialButton(
              onPressed: () {
                if (int.parse(key) % 2 > 0) {
                  AdaptiveTheme.of(context).setLight();
                } else {
                  AdaptiveTheme.of(context).setDark();
                }
              },
              child: Center(
                  child: Text(key.toString(), textAlign: TextAlign.center)),
            ))
        ]))
    ]);
  }
}
