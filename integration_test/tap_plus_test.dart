//import; 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_test_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testing tapping options', () {
    testWidgets('tapping plus button 2 times', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.text('Please choose from below options'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      final Finder plusBtn = find.byKey(const Key('plusButton'));
      await tester.tap(plusBtn);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final Finder plusBtn2 = find.byKey(const Key('plusButton'));
      await tester.tap(plusBtn2);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('2'), findsOneWidget);
      await tester.pumpAndSettle();

      final Finder resetBtn = find.byKey(const Key('resetButton'));
      await tester.tap(resetBtn);
      await tester.pumpAndSettle(const Duration(seconds: 3));
    });
  });
}
