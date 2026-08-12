{{#use_bloc}}import 'package:equatable/equatable.dart';

abstract class {{feature_name.pascalCase()}}Event extends Equatable {
  const {{feature_name.pascalCase()}}Event();

  @override
  List<Object?> get props => [];
}

class {{feature_name.pascalCase()}}Started extends {{feature_name.pascalCase()}}Event {
  const {{feature_name.pascalCase()}}Started();
}
{{/use_bloc}}
