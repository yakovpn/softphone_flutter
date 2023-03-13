import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:softphone_flutter/generated/locale_keys.g.dart';
import 'package:softphone_flutter/src/util/theme.dart';

AppBar softphoneAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: context.color.success,
    title: Text(LocaleKeys.appName.tr()),
    leading: IconButton(
      icon: const Icon(Icons.language),
      onPressed: () {
        if (context.locale == const Locale('ru')) {
          context.setLocale(const Locale('en'));
        } else {
          context.setLocale(const Locale('ru'));
        }
      },
    ),
  );
}
