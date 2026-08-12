import 'package:flutter/material.dart';
{{#use_bloc}}import 'package:flutter_bloc/flutter_bloc.dart';{{/use_bloc}}
{{#use_riverpod}}import 'package:flutter_riverpod/flutter_riverpod.dart';{{/use_riverpod}}
import 'router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;

    {{#use_riverpod}}return ProviderScope(
      child: MaterialApp.router(
        title: '{{project_name.titleCase()}}',
        theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );{{/use_riverpod}}
    {{^use_riverpod}}return MaterialApp.router(
      title: '{{project_name.titleCase()}}',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      routerConfig: router,
    );{{/use_riverpod}}
  }
}
