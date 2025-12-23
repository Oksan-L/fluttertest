import 'package:flutter/material.dart';

class LongListPage extends StatelessWidget {
  final List<String> items;
  const LongListPage({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Long List';

    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: ListView.builder(
        key: const Key('long_list'),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index],
              key: Key('item_${index}_text'),
            ),
          );
        },
      ),
    );
  }
}
