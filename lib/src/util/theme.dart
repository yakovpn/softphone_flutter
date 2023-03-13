import 'package:flutter/material.dart';

final kDarkTheme = ThemeData.dark()
    .copyWith(extensions: <ThemeExtension<dynamic>>[SoftphoneColors.dark]);
final kLightTheme = ThemeData.light()
    .copyWith(extensions: <ThemeExtension<dynamic>>[SoftphoneColors.light]);

extension BuildContextExt on BuildContext {
  SoftphoneColors get color => Theme.of(this).extension<SoftphoneColors>()!;
}

@immutable
class SoftphoneColors extends ThemeExtension<SoftphoneColors> {
  const SoftphoneColors({
    required this.success,
    required this.info,
  });
  final Color? success;
  final Color? info;
  @override
  SoftphoneColors copyWith({
    Color? success,
    Color? info,
  }) {
    return SoftphoneColors(
      success: success ?? this.success,
      info: info ?? this.info,
    );
  }

  // Controls how the properties change on theme changes
  @override
  SoftphoneColors lerp(ThemeExtension<SoftphoneColors>? other, double t) {
    if (other is! SoftphoneColors) {
      return this;
    }
    return SoftphoneColors(
      success: Color.lerp(success, other.success, t),
      info: Color.lerp(info, other.info, t),
    );
  }

  // the light theme
  static const light = SoftphoneColors(
    success: Color(0xff28a745),
    info: Color(0xff17a2b8),
  );
  // the dark theme
  static const dark = SoftphoneColors(
    success: Color(0xff00bc8c),
    info: Color(0xff17a2b8),
  );
}
