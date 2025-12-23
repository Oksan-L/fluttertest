import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});
  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final items = List.generate(5, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() => items.removeAt(index));
            },
            background: Container(color: Colors.red),
            child: ListTile(title: Text(item)),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
        key: const Key('deleteButton'),
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Confirm Delete'),
            content: const Text('Are you sure?'),
            actions: [
              TextButton(
                key: const Key('confirmBtn'),
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Yes'),
              ),
            ],
          ),
        ),
        child: const Text('Delete'),
      ),
    );
  }
}