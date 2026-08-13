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
      // Pin to Riverpod v2 — riverpod v3 (>=3.4.2) conflicts with
      // envied_generator through analyzer version constraints.
      packages.addAll([
        'flutter_riverpod:^2.6.1',
        'riverpod_annotation:^2.6.1',
      ]);
  }

  packages.addAll([
    'go_router',
    'dio',
    'shared_preferences',
    'envied',
  ]);

  if (preset == Preset.enterprise) {
    packages.addAll([
      'flutter_secure_storage',
      'easy_localization',
    ]);
  }

  if (useFirebase) {
    packages.addAll([
      'firebase_core',
      'firebase_analytics',
    ]);
  }

  return packages;
}

List<String> getDevDependencies({
  required StateManagement stateManagement,
}) {
  final devDeps = <String>[
    'envied_generator',
    'build_runner',
  ];

  if (stateManagement == StateManagement.riverpod) {
    // Pin to riverpod_generator v2 to match flutter_riverpod ^2.6.1.
    devDeps.add('riverpod_generator:^2.6.4');
  }

  return devDeps;
}
