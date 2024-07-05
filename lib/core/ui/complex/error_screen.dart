import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({this.error, super.key});
  final String? error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(child: Text(AppLocalizations.of(context)!.error)),
    );
  }
}
