import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ButtonNavigator extends StatefulWidget {
  const ButtonNavigator({super.key});

  @override
  State<ButtonNavigator> createState() => _ButtonNavigatorState();
}

class _ButtonNavigatorState extends State<ButtonNavigator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () => context.router.pushNamed('/registration'),
        child: const Text('Регистрация'),
      ),
    );
  }
}
