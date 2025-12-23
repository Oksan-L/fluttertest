// 011, 012

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/pages/todo_page.dart';

void main() {
testWidgets('011 - dismissItem() - Swipe to delete', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: TodoPage()));

  final itemFinder = find.text('Item 0');
  expect(itemFinder, findsOneWidget); // Є на екрані

  // Робимо свайп вліво (Drag)
  // Offset(-500, 0) означає "потягни на 500 пікселів вліво"
  await tester.drag(itemFinder, const Offset(-500, 0));
  
  // Чекаємо поки анімація зникнення завершиться
  await tester.pumpAndSettle();

  expect(itemFinder, findsNothing); // Зникло
});

testWidgets('012 - dialogInteraction() - Open and close dialog', (tester) async {
  // Тут вставте MaterialApp з вашою сторінкою
  await tester.pumpWidget(const MaterialApp(home: TodoPage()));

  // 1. Відкриваємо діалог
  await tester.tap(find.byKey(const Key('deleteButton')));
  await tester.pumpAndSettle(); // Чекаємо анімацію появи

  // 2. Перевіряємо, що діалог з'явився
  expect(find.text('Confirm Delete'), findsOneWidget);

  // 3. Тиснемо "Yes"
  await tester.tap(find.byKey(const Key('confirmBtn')));
  await tester.pumpAndSettle(); // Чекаємо закриття

  // 4. Перевіряємо, що діалог зник
  expect(find.text('Confirm Delete'), findsNothing);
});
}