{{#use_bloc}}import 'package:flutter_bloc/flutter_bloc.dart';

import '{{feature_name}}_event.dart';
import '{{feature_name}}_state.dart';

class {{feature_name.pascalCase()}}Bloc
    extends Bloc<{{feature_name.pascalCase()}}Event, {{feature_name.pascalCase()}}State> {
  {{feature_name.pascalCase()}}Bloc() : super(const {{feature_name.pascalCase()}}State()) {
    on<{{feature_name.pascalCase()}}Started>(_onStarted);
  }

  Future<void> _onStarted(
    {{feature_name.pascalCase()}}Started event,
    Emitter<{{feature_name.pascalCase()}}State> emit,
  ) async {
    emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.loading));
    try {
      // TODO: Implement feature logic
      if (emit.isDone) return;
      emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.success));
    } catch (_) {
      if (emit.isDone) return;
      emit(state.copyWith(status: {{feature_name.pascalCase()}}Status.failure));
    }
  }
}
{{/use_bloc}}
