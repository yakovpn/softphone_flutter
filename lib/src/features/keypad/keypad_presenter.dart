import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/widgets.dart';
import 'package:softphone_flutter/src/features/keypad/keypad_contract.dart';

class KeypadPresenter {
  final KeypadContract _view;
  KeypadPresenter(this._view) {
    onInit();
  }
  onClickNumButton(BuildContext context, String key) {
    if (int.parse(key) % 2 > 0) {
      AdaptiveTheme.of(context).setLight();
    } else {
      AdaptiveTheme.of(context).setDark();
    }
  }

  onInit() {}
}
