import 'package:flutter/material.dart';

import '../../../domain/logic/auth_registration_logic.dart';

class ButtonNavigator extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _nameController;
  const ButtonNavigator({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController nameController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController,
        _nameController = nameController;

  @override
  State<ButtonNavigator> createState() => _ButtonNavigatorState();
}

class _ButtonNavigatorState extends State<ButtonNavigator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: () => actionButtonRegistation(
          formKey: widget._formKey,
          context: context,
          emailController: widget._emailController,
          passwordController: widget._passwordController,
          nameController: widget._nameController,
        ),
        child: const Text('Зарегистрироваться'),
      ),
    );
  }
}
