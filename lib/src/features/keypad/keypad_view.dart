import 'package:flutter/material.dart';
import 'package:softphone_flutter/src/util/appbar.dart';
import 'package:softphone_flutter/src/features/keypad/keypad_presenter.dart';
import 'package:softphone_flutter/src/features/keypad/keypad_contract.dart';

class Keypad extends StatefulWidget {
  const Keypad({super.key});
  static const String routeName = '/Home';

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> implements KeypadContract {
  late KeypadPresenter _presenter;
  List<List<String>> keyList = [
    ['1', '2', '3'],
    ['4', '5', '6'],
    ['7', '8', '9'],
    ['*', '0', '#'],
  ];
  _KeypadState() {
    _presenter = KeypadPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    _presenter = KeypadPresenter(this);
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
                _presenter.onClickNumButton(context, key);
              },
              child: Center(
                  child: Text(key.toString(), textAlign: TextAlign.center)),
            ))
        ]))
    ]);
  }
}
