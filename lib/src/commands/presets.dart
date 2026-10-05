enum StateManagement {
  bloc('BLoC (flutter_bloc)'),
  riverpod('Riverpod (flutter_riverpod)');

  const StateManagement(this.displayName);
  final String displayName;
}

enum Preset {
  mvp('MVP / Lite'),
  enterprise('Enterprise');

  const Preset(this.displayName);
  final String displayName;
}

List<String> getPresetPackages({
  required Preset preset,
  required StateManagement stateManagement,
  required bool useFirebase,
}) {
  final packages = <String>[];

  switch (stateManagement) {
    case StateManagement.bloc:
      packages.addAll(['flutter_bloc', 'equatable']);
    case StateManagement.riverpod:
      packages.add('flutter_riverpod:^3.0.0');
  }

  packages.addAll(['go_router', 'dio', 'shared_preferences', 'envied']);

  if (preset == Preset.enterprise) {
    packages.addAll(['flutter_secure_storage', 'easy_localization']);
  }

  if (useFirebase) {
    packages.addAll(['firebase_core', 'firebase_analytics']);
  }

  return packages;
}

List<String> getDevDependencies({required StateManagement stateManagement}) {
  final devDeps = <String>['envied_generator', 'build_runner'];

  return devDeps;
}
