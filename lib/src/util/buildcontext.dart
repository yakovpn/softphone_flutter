import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
//  AppLocalizations get localizations => AppLocalizations.of(this)!;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
