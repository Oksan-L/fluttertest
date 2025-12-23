import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            key: const Key('logoutButton'),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              key: const Key('goToCounterButton'),
              onPressed: () => Navigator.pushNamed(context, '/counter'),
              child: const Text('Go to Counter'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              key: const Key('goToLongListButton'),
              onPressed: () => Navigator.pushNamed(context, '/longList'),
              child: const Text('Go to Long List'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              key: const Key('goToProductsButton'),
              onPressed: () => Navigator.pushNamed(context, '/products'),
              child: const Text('Go to Products'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              key: const Key('goToTodoButton'),
              onPressed: () => Navigator.pushNamed(context, '/todo'),
              child: const Text('Go to Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
