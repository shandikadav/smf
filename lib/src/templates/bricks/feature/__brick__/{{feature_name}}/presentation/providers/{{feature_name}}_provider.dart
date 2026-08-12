{{#use_riverpod}}import 'package:flutter_riverpod/flutter_riverpod.dart';

enum {{feature_name.pascalCase()}}Status { initial, loading, success, failure }

class {{feature_name.pascalCase()}}State {
  const {{feature_name.pascalCase()}}State({
    this.status = {{feature_name.pascalCase()}}Status.initial,
  });

  final {{feature_name.pascalCase()}}Status status;

  {{feature_name.pascalCase()}}State copyWith({
    {{feature_name.pascalCase()}}Status? status,
  }) {
    return {{feature_name.pascalCase()}}State(
      status: status ?? this.status,
    );
  }
}

class {{feature_name.pascalCase()}}Notifier extends StateNotifier<{{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Notifier() : super(const {{feature_name.pascalCase()}}State());

  Future<void> load() async {
    state = state.copyWith(status: {{feature_name.pascalCase()}}Status.loading);
    try {
      // TODO: Implement feature logic
      state = state.copyWith(status: {{feature_name.pascalCase()}}Status.success);
    } catch (_) {
      state = state.copyWith(status: {{feature_name.pascalCase()}}Status.failure);
    }
  }
}

final {{feature_name.camelCase()}}Provider =
    StateNotifierProvider<{{feature_name.pascalCase()}}Notifier, {{feature_name.pascalCase()}}State>(
  (ref) => {{feature_name.pascalCase()}}Notifier(),
);
{{/use_riverpod}}
