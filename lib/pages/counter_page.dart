import 'package:flutter/material.dart';
import 'dart:async';

class CounterPage extends StatefulWidget {
  final String title;
  final bool enableDelayedText;
  const CounterPage({super.key, required this.title, this.enableDelayedText = true});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  bool _showTemporaryText = true;
  bool _delayedTextVisible = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.enableDelayedText) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _delayedTextVisible = true;
          });
        }
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _hideText() {
    setState(() {
      _showTemporaryText = false;
    });
  }

  void _returnText() {
    setState(() {
      _showTemporaryText = true;
    });
  }

  void _submit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Button tapped!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TextField(
            key: const Key('textField'),
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Enter text here',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            key: const Key('submitButton'),
            onPressed: _submit,
            child: const Text('Submit'),
          ),
          const SizedBox(height: 10),
          if (_showTemporaryText)
            Text(
              'Temporary message',
              key: const Key('temporaryText'),
            ),
          const SizedBox(height: 10),
          if (_showTemporaryText)
            ElevatedButton(
              key: const Key('removeTextButton'),
              onPressed: _hideText,
              child: const Text('Remove Text'),
            )
          else
            ElevatedButton(
              key: const Key('returnTextButton'),
              onPressed: _returnText,
              child: const Text('Return Text'),
            ),
          const SizedBox(height: 20),
          Text(
            'Counter: $_counter',
            key: const Key('counterText'),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          if (_delayedTextVisible)
            const Text(
              'Loaded after delay',
              key: Key('delayedText'),
            ),
          const SizedBox(height: 10),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
