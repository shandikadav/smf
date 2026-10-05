import 'package:flutter/material.dart';
{{#use_bloc}}import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/{{feature_name}}_bloc.dart';
import '../bloc/{{feature_name}}_event.dart';
import '../bloc/{{feature_name}}_state.dart';{{/use_bloc}}
{{#use_riverpod}}import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/{{feature_name}}_provider.dart';{{/use_riverpod}}

class {{feature_name.pascalCase()}}Page extends {{#use_riverpod}}ConsumerWidget{{/use_riverpod}}{{^use_riverpod}}StatelessWidget{{/use_riverpod}} {
  const {{feature_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context{{#use_riverpod}}, WidgetRef ref{{/use_riverpod}}) {
    {{#use_bloc}}return BlocProvider(
      create: (context) => {{feature_name.pascalCase()}}Bloc(),
      child: BlocBuilder<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
        builder: (context, state) => _{{feature_name.pascalCase()}}View(
          status: state.status.name,
          onLoad: () => context.read<{{feature_name.pascalCase()}}Bloc>().add(const {{feature_name.pascalCase()}}Started()),
        ),
      ),
    );{{/use_bloc}}
    {{#use_riverpod}}final state = ref.watch({{feature_name.camelCase()}}Provider);
    return _{{feature_name.pascalCase()}}View(
      status: state.status.name,
      onLoad: () => ref.read({{feature_name.camelCase()}}Provider.notifier).load(),
    );{{/use_riverpod}}
    {{^use_bloc}}{{^use_riverpod}}return const _{{feature_name.pascalCase()}}View(status: null, onLoad: null);{{/use_riverpod}}{{/use_bloc}}
  }
}

class _{{feature_name.pascalCase()}}View extends StatelessWidget {
  const _{{feature_name.pascalCase()}}View({required this.status, required this.onLoad});

  final String? status;
  final VoidCallback? onLoad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{feature_name.titleCase()}}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('{{feature_name.titleCase()}} Page'),
            if (status != null) Text('Status: $status'),
            if (onLoad != null)
              ElevatedButton(
                onPressed: status == 'loading' ? null : onLoad,
                child: const Text('Load'),
              ),
          ],
        ),
      ),
    );
  }
}
