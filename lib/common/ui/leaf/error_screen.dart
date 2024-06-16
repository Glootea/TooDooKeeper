import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.message, super.key});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('${AppLocalizations.of(context)?.error}: $message')));
  }
}
