// 005

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/pages/long_list_page.dart';

void main() {
  testWidgets('005 - scrollUntilVisible() - Scrolls to specific item', (WidgetTester tester) async {
    // generate test data
    final List<String> testItems = List.generate(100, (index) => 'Item $index');

    // start the LongListPage
    await tester.pumpWidget(MaterialApp(
      home: LongListPage(items: testItems),
    ));

    final itemFinder = find.byKey(const Key('item_80_text'));

    // scroll until the item is visible
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
    );

    expect(itemFinder, findsOneWidget);
  });
}