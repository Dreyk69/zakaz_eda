import 'package:auto_route/auto_route.dart';
import 'package:eda_gotova/constants/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/blocs/auth_bloc/auth_bloc.dart';
import '../../../../app/blocs/get_data_bloc/get_data_bloc.dart';
import '../../../../app/blocs/sign_in_bloc/sign_in_bloc.dart';
import '../../../../app/blocs/update_data_bloc/update_data_bloc.dart';
import '../../../../constants/styles/images.dart';
import '../../../../constants/styles/styles_text_field.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _signInRequired = false;
  String textField1Value = '';
  Map<String, dynamic>? dataUser;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetDataBloc>(
      create: (context) => GetDataBloc(
          myUserRepository: context.read<AuthBloc>().userRepository),
      child: BlocBuilder<GetDataBloc, GetDataState>(
        builder: (context, state) {
          if (state is GetDataInitial) {
            _signInRequired = false;
          } else if (state is GetDataProcess) {
            _signInRequired = true;
          } else if (state is GetDataSuccess) {
            _signInRequired = false;
            dataUser = state.user;
          } else if (state is GetDataFailure) {
            _signInRequired = false;
          }
          return BlocProvider(
            create: (context) => UpdateDataBloc(userRepository: context.read<AuthBloc>().userRepository),
            child: BlocBuilder<UpdateDataBloc, UpdateDataState>(
              builder: (context, state) {
                if (state is UploadAddressSuccess) {
                  dataUser?['address'] = state.address;
                }
                return Scaffold(
                    floatingActionButton: FloatingActionButton.extended(
                      label: const Text('Выйти'),
                      backgroundColor: mainColor,
                      onPressed: () {
                        context.read<SignInBloc>().add(const SignOutRequired());
                        context.router.replaceNamed('/auth');
                      },
                    ),
                    body: !_signInRequired
                        ? Column(
                            children: [
                              DecoratedBox(
                                decoration: const BoxDecoration(
                                    color: Color.fromRGBO(196, 223, 230, 1)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2, horizontal: 0),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 30),
                                      Row(
                                        children: [
                                          const SizedBox(width: 20),
                                          ClipOval(
                                              child: SizedBox.fromSize(
                                                  size:
                                                      const Size.fromRadius(35),
                                                  child: avatar)),
                                          const SizedBox(width: 15),
                                          Text('${dataUser?['name']}',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600))
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Row(
                                    children: [
                                      const Text('Email:',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(width: 20),
                                      Text('${dataUser?['email']}',
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600)),
                                      const SizedBox(width: 35),
                                      const Text('Изменить..',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(
                                indent: 20,
                                endIndent: 20,
                                color: Colors.black45,
                              ),
                              dataUser?['address'] != ''
                                  ? SizedBox(
                                      height: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Row(
                                          children: [
                                            const Text('Адрес:',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            const SizedBox(width: 20),
                                            SizedBox(
                                              width: 200,
                                              child: Text('${dataUser?['address']}',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                            ),
                                            const SizedBox(width: 15),
                                            const Text('Изменить..',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 100,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 20),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 230,
                                              child: TextField(
                                                onChanged: (value) {
                                                  textField1Value = value;
                                                },
                                                decoration:
                                                    const StylesTextField(
                                                  hintText:
                                                      'Введите свой адрес',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              width: 130,
                                              child: FilledButton(
                                                onPressed: () {
                                                  context
                                                      .read<UpdateDataBloc>()
                                                      .add(UploadAddress(
                                                          textField1Value,
                                                          dataUser?['id']));
                                                },
                                                child: const Text('Сохранить'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                            ],
                          )
                        : const Center(child: CircularProgressIndicator()));
              },
            ),
          );
        },
      ),
    );
  }
}
