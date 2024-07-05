import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yandex_summer_school/core/data/providers/online/online_provider_abst.dart';
import 'package:yandex_summer_school/core/ui/theme/theme_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<OnlineProvider>();
    final todoTheme = context.watch<ThemeBloc>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/dino.png', width: 300),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              AppLocalizations.of(context)!.loginNeeded,
              style: todoTheme.state.textTheme.body,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () async {
              final result = await auth.auth.login();
              if (result == true) {
                if (context.mounted) {
                  context.pushReplacement('/');
                }
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        AppLocalizations.of(context)!.loginFailed,
                        style: todoTheme.state.textTheme.body,
                      ),
                    ),
                  );
                }
              }
            },
            child: Text(
              AppLocalizations.of(context)!.login,
              style: todoTheme.state.textTheme.button.copyWith(color: todoTheme.state.definedColors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
