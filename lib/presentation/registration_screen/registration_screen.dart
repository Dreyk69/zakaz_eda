import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/blocs/auth_bloc/auth_bloc.dart';
import '../../app/blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../constants/styles/images.dart';
import '../widgets/text_field_email.dart';
import 'widgets/button_regestation.dart';
import 'widgets/my_text_verefication_widget.dart';
import 'widgets/text_field_name.dart';
import 'widgets/text_field_password_reg.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final ValueNotifier<bool> _containsUpperCase = ValueNotifier(false);
  final ValueNotifier<bool> _containsLowerCase = ValueNotifier(false);
  final ValueNotifier<bool> _containsNumber = ValueNotifier(false);
  final ValueNotifier<bool> _containsSpecialChar = ValueNotifier(false);
  final ValueNotifier<bool> _contains8Length = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
            myUserRepository: context.read<AuthBloc>().userRepository),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              context.router.replaceNamed('/main');
            }
          },
          child:
              BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
            return Scaffold(
                resizeToAvoidBottomInset: false,
                body: Center(
                    child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  logotip,
                                  const SizedBox(height: 10),
                                  TextFieldEmail(
                                    emailController: _emailController,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFieldPasswordReg(
                                    passwordController: _passwordController,
                                    errorMsg: state is SignUpFailure
                                        ? 'Ошибка регистрации'
                                        : null,
                                    containsUpperCase: _containsUpperCase,
                                    containsLowerCase: _containsLowerCase,
                                    containsNumber: _containsNumber,
                                    containsSpecialChar: _containsSpecialChar,
                                    contains8Length: _contains8Length,
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyTextVerefication(
                                            text: '• 1 Заглавная',
                                            verefication: _containsUpperCase,
                                          ),
                                          MyTextVerefication(
                                            text: '• 1 Строчная',
                                            verefication: _containsLowerCase,
                                          ),
                                          MyTextVerefication(
                                            text: '• 1 Цифра',
                                            verefication: _containsNumber,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyTextVerefication(
                                            text: '• 1 Специальный символ',
                                            verefication: _containsSpecialChar,
                                          ),
                                          MyTextVerefication(
                                            text: '• Миниум 8 символов',
                                            verefication: _contains8Length,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  TextFieldName(
                                    nameController: _nameController,
                                  ),
                                  const SizedBox(height: 10),
                                  state is SignUpProcess
                                      ? const CircularProgressIndicator()
                                      : ButtonNavigator(
                                          formKey: _formKey,
                                          emailController: _emailController,
                                          passwordController:
                                              _passwordController,
                                          nameController: _nameController,
                                        )
                                ]),
                          ),
                        ))));
          }),
        ));
  }
}
