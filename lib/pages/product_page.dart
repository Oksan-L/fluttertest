import 'package:flutter/material.dart';
import 'checkout_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int cartCount = 0;

  void _addToCart() {
    setState(() {
      cartCount++;
    });
  }

  void _checkout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CheckoutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Center(
            child: Text(
              '$cartCount',
              key: const Key('cartBadge'),
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            key: const Key('addToCart_1'),
            onPressed: _addToCart,
            child: const Text('Add Product 1 to Cart'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            key: const Key('goToCartButton'),
            onPressed: _checkout,
            child: const Text('Go to Cart / Checkout'),
          ),
        ],
      ),
    );
  }
}
