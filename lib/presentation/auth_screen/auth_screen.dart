import 'package:auto_route/auto_route.dart';
import 'package:eda_gotova/constants/styles/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/blocs/auth_bloc/auth_bloc.dart';
import '../../app/blocs/sign_in_bloc/sign_in_bloc.dart';

import 'widgets/button_auth.dart';
import 'widgets/button_registration.dart';
import 'widgets/text_field_email.dart';
import 'widgets/text_field_password.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignInBloc>(
      create: (context) =>
          SignInBloc(myUserRepository: context.read<AuthBloc>().userRepository),
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          if (state is SignInSuccess) {
            context.router.replaceNamed('/main');
          }
          return Scaffold(
            body: Center(
                child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      logotip,
                      const SizedBox(height: 10),
                      TextFieldEmail(
                        emailController: _emailController,
                      ),
                      const SizedBox(height: 15),
                      state is SignInFailure
                          ? TextFieldPassword(
                              passwordController: _passwordController,
                              errorMsg:
                                  'Неправильный адрес электронной почты или пароль',
                            )
                          : TextFieldPassword(
                              passwordController: _passwordController,
                            ),
                      const SizedBox(height: 15),
                      state is SignInProcess
                          ? const CircularProgressIndicator()
                          : Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: BottonAuth(
                                    formKey: _formKey,
                                    emailController: _emailController,
                                    passwordController: _passwordController,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const SizedBox(
                                  width: double.infinity,
                                  child: ButtonRegistation(),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
