// 006, 007, 008, 009

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/main.dart';
import 'package:fluttertest/pages/login_page.dart';
import 'package:fluttertest/pages/home_page.dart';
import 'test_data.dart'; // importing test data

void main() {
  Widget createTestApp() {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        // fake HomePage for testing navigation
        '/home': (context) => const Scaffold(body: Text('Welcome Home!')),
      },
    );
  }

  group('LoginPage Tests', () {
    
    testWidgets('006 - loginSuccess() - Correct input navigates to Home', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp());
      
      final emailField = find.byKey(const Key('emailField'));
      final passwordField = find.byKey(const Key('passwordField'));
      final loginButton = find.byKey(const Key('loginButton'));

      await tester.enterText(emailField, TestData.validEmail);
      await tester.enterText(passwordField, TestData.validPassword);

      await tester.tap(loginButton);

      await tester.pumpAndSettle();

      // finding HomePage by checking for specific text
      expect(find.text('Welcome Home!'), findsOneWidget);
      
      // make sure LoginPage is gone
      expect(find.byType(LoginPage), findsNothing);
    });

    testWidgets('007 -loginInvalidPassword() - Wrong password shows error message', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp());

      // wrong password generation
      final wrongPassword = TestData.generateInvalidPassword();
      print('Testing with generated password: $wrongPassword');

      await tester.enterText(find.byKey(const Key('emailField')), TestData.validEmail);
      await tester.enterText(find.byKey(const Key('passwordField')), wrongPassword);

      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      expect(find.byKey(const Key('errorText')), findsOneWidget);

      expect(find.text('Invalid password'), findsOneWidget);
      
      // check we are still on LoginPage and not on HomePage
      expect(find.text('Welcome Home!'), findsNothing);
    });

    testWidgets('008 - logout() - Logout button returns to Login Page', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      // login first
      await tester.enterText(find.byKey(const Key('emailField')), TestData.validEmail);
      await tester.enterText(find.byKey(const Key('passwordField')), TestData.validPassword);
      await tester.tap(find.byKey(const Key('loginButton')));

      await tester.pumpAndSettle();
      
      // make sure we are on HomePage
      expect(find.byType(HomePage), findsOneWidget);

      final logoutBtn = find.byKey(const Key('logoutButton'));
      expect(logoutBtn, findsOneWidget);

      await tester.tap(logoutBtn);
      await tester.pumpAndSettle();

      // HomePage must disappear
      expect(find.byType(HomePage), findsNothing);
      // LoginPage must appear
      expect(find.byType(LoginPage), findsOneWidget);
    });

    testWidgets('009 - validationEmptyFields() - Show error when fields are empty', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      // leave email and password fields empty

      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pump();

      // Check for error message
      expect(find.text('Please fill in all fields'), findsOneWidget);
      
      // make sure we are still on LoginPage
      expect(find.byType(HomePage), findsNothing);
      expect(find.byType(LoginPage), findsOneWidget);
    });

  });
}