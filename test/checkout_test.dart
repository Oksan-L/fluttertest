// 010, 013, 015

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/pages/product_page.dart';
import 'dart:math'; 

void main() {

    testWidgets('013 - navigationPop() - Verify Back button functionality', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProductPage()));

    // go to cart
    await tester.tap(find.byKey(const Key('goToCartButton')));
    await tester.pumpAndSettle();
    
    expect(find.text('Checkout'), findsOneWidget);
    
    // simulate back button press
    await tester.pageBack();

    await tester.pumpAndSettle();

    // check we are back on ProductPage
    expect(find.text('Checkout'), findsNothing);
    expect(find.text('Products'), findsOneWidget);
  });

  testWidgets('010 - checkoutFlow() - Successful checkout', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ProductPage(),
    ));

    // adding to cart 
    final addToCartBtn = find.byKey(const Key('addToCart_1'));
    
    await tester.tap(addToCartBtn);
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    // go to cart
    final goToCartBtn = find.byKey(const Key('goToCartButton'));
    await tester.tap(goToCartBtn);

    await tester.pumpAndSettle();

    // verifying we are on CheckoutPage
    expect(find.text('Checkout'), findsOneWidget);

    print('Trying to find checkoutButton...');

    // finding checkout button
    final checkoutBtn = find.byKey(const Key('checkoutButton'));

    // "Expected: exactly one matching node in the widget tree, but found no match."
    expect(checkoutBtn, findsOneWidget);

    //await Future.delayed(const Duration(seconds: 2)); // ----! //how to use delay

    await tester.tap(checkoutBtn);
    await tester.pump();
  });

    testWidgets('015 - productStatePersistenceRandom() - Random items survive navigation', (WidgetTester tester) async {
    // generate random number between 2 and 6
    final int itemsToAdd = Random().nextInt(5) + 2;
    print('🛒 Test 15 Items: $itemsToAdd items');

    await tester.pumpWidget(const MaterialApp(
      home: ProductPage(),
    ));

    final addToCartBtn = find.byKey(const Key('addToCart_1'));

    // add random number of items to cart
    for (int i = 0; i < itemsToAdd; i++) {
      await tester.tap(addToCartBtn);
      await tester.pump(); 
    }

    // verify that the badge shows our number
    expect(find.text('$itemsToAdd'), findsOneWidget);

    // move to checkout page
    await tester.tap(find.byKey(const Key('goToCartButton')));
    await tester.pumpAndSettle();

    expect(find.text('Checkout'), findsOneWidget);

    // go back to product page
    await tester.pageBack();
    await tester.pumpAndSettle();

    // verify that the badge still shows our number
    expect(find.text('$itemsToAdd'), findsOneWidget);
  });

}