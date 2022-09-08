//import; 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:auto_test_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Testing tapping all options', () {
    testWidgets('tapping plus button 2 times', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.text('Please choose from below options'), findsOneWidget);

      final Finder plusBtn = find.byKey(const Key('plusButton'));
      await tester.tap(plusBtn);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      final Finder plusBtn2 = find.byKey(const Key('plusButton'));
      await tester.tap(plusBtn2);
      await tester.pumpAndSettle(const Duration(seconds: 3));

      expect(find.text('2'), findsOneWidget);
      await tester.pumpAndSettle();
    });
    testWidgets('tapping minus button 3 times', (WidgetTester tester) async {
      app.main();

      await tester.pumpAndSettle(const Duration(seconds: 2));
      expect(find.text('Please choose from below options'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);

      final Finder minusBtn = find.byKey(const Key('minusButton'));
      await tester.tap(minusBtn);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder minusBtn2 = find.byKey(const Key('minusButton'));
      await tester.tap(minusBtn2);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      final Finder minusBtn3 = find.byKey(const Key('minusButton'));
      await tester.tap(minusBtn3);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.text('-3'), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 2));
    });
  });
}
