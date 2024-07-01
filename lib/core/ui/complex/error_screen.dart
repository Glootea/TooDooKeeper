import 'package:flutter/material.dart';
import 'package:yandex_summer_school/core/extensions/l10n_extension.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({this.error, super.key});

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(child: Text(context.loc.error)),
    );
  }
}
