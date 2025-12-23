// 001, 002, 003, 004, 014

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/pages/counter_page.dart'; 
import 'dart:math'; 

void main() {
  group('CounterPage Isolated Tests', () {
    
    Widget createCounterScreen() {
      return const MaterialApp(
        home: CounterPage(title: 'Test Counter'),
      );
    }

    testWidgets('001 - enterText check', (WidgetTester tester) async {
      // teleport to CounterPage
      await tester.pumpWidget(createCounterScreen());

      await tester.enterText(find.byKey(const Key('textField')), 'Hello Isolated');
      await tester.pump();
      expect(find.text('Hello Isolated'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2)); // because on 003 we have delayed text
    });

    testWidgets('002 - tap check', (WidgetTester tester) async {
      await tester.pumpWidget(createCounterScreen());

      await tester.tap(find.byKey(const Key('submitButton')));
      await tester.pump();
      expect(find.text('Button tapped!'), findsOneWidget);

      await tester.pump(const Duration(seconds: 2)); // because on 003 we have delayed text
    });

    testWidgets('003 - waitFor logic', (WidgetTester tester) async {
      await tester.pumpWidget(createCounterScreen());

      // text is not here yet
      expect(find.byKey(const Key('delayedText')), findsNothing);
      
      // wait for it
      await tester.pump(const Duration(seconds: 2));
      
      // now it should appear
      expect(find.byKey(const Key('delayedText')), findsOneWidget);
    });

    testWidgets('004 - waitForAbsent logic', (WidgetTester tester) async {
       await tester.pumpWidget(createCounterScreen());
       
       // initially text is present
       expect(find.text('Temporary message'), findsOneWidget);
       
       // remove the text
       await tester.tap(find.byKey(const Key('removeTextButton')));
       await tester.pump();
       
       // now text should be absent
       expect(find.text('Temporary message'), findsNothing);

       await tester.pump(const Duration(seconds: 2)); // because on 003 we have delayed text
    });

    testWidgets('014 - counterIncrementRandom() - Tap N times (Random 2-6)', (WidgetTester tester) async {
      // generate random number between 2 and 6
      // nextInt(5) -> 0..4. Add 2 => obtain 2..6
      final int randomCount = Random().nextInt(5) + 2; 
      print('🎲 Test 14 Target: $randomCount clicks'); 

      await tester.pumpWidget(const MaterialApp(
        home: CounterPage(title: 'Test Counter', enableDelayedText: false),
      ));

      final incrementBtn = find.byKey(const Key('increment'));
      
      // variable to find counter text
      final counterFinder = find.byKey(const Key('counterText'));

      // check initial value is 0
      expect(tester.widget<Text>(counterFinder).data, 'Counter: 0');

      // click randomCount times
      for (int i = 0; i < randomCount; i++) {
        await tester.tap(incrementBtn);
        // 1 second delay between taps
        await tester.pump(const Duration(seconds: 1));
      }

      // verify counter value
      expect(tester.widget<Text>(counterFinder).data, 'Counter: $randomCount');
    });

  });
}