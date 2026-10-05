import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{project_name}}/app/app.dart';

void main() {
  testWidgets('Home page loads state', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Status: initial'), findsOneWidget);

    await tester.tap(find.widgetWithText(ElevatedButton, 'Load'));
    await tester.pumpAndSettle();

    expect(find.text('Status: success'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
