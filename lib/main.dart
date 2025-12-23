import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/product_page.dart';
import 'pages/checkout_page.dart';
import 'pages/counter_page.dart';
import 'pages/long_list_page.dart';
import 'pages/todo_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Full App',
      home: const LoginPage(),
      routes: {
        '/home': (_) => const HomePage(),
        '/products': (_) => const ProductPage(),
        '/checkout': (_) => const CheckoutPage(),
        '/counter': (_) => const CounterPage(title: 'Counter App Home Page'),
        '/longList': (_) => LongListPage(
              items: List<String>.generate(10000, (i) => 'Item $i'),
            ),
        '/todo': (_) => const TodoPage(),
      },
    );
  }
}
