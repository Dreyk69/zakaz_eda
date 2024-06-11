import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ButtonRegistation extends StatefulWidget {
  const ButtonRegistation({super.key});

  @override
  State<ButtonRegistation> createState() => _ButtonRegistationState();
}

class _ButtonRegistationState extends State<ButtonRegistation> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                context.router.replaceNamed('/registration');
              },
              child: const Text('Регистрация'),
            ),
          );
  }
}