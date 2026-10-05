import 'package:flutter/material.dart';
{{#use_riverpod}}import 'package:flutter_riverpod/flutter_riverpod.dart';{{/use_riverpod}}
import '../core/theme/app_theme.dart';
import 'router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;

    {{#use_riverpod}}return ProviderScope(
      child: MaterialApp.router(
        title: '{{project_name.titleCase()}}',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerConfig: router,
      ),
    );{{/use_riverpod}}
    {{^use_riverpod}}return MaterialApp.router(
      title: '{{project_name.titleCase()}}',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    );{{/use_riverpod}}
  }
}
