import 'package:flutter/material.dart';

class MyTextVerefication extends StatelessWidget {
  final String text;
  final ValueNotifier<bool> verefication;

  const MyTextVerefication({
    super.key,
    required this.text,
    required this.verefication,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: verefication,
      builder: (context, value, child) {
        return Text(
          text,
          style: TextStyle(
            color: value ? Colors.green : Colors.black,
          ),
        );
      },
    );
  }
}
