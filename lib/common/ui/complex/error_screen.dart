import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {super.key});
  final String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(child: Text(error)),
    );
  }
}
