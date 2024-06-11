import 'package:eda_gotova/app/application_view.dart';
import 'package:eda_gotova/domain/user_repository/lib/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/auth_bloc/auth_bloc.dart';
import 'blocs/get_data_bloc/get_data_bloc.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'blocs/sign_up_bloc/sign_up_bloc.dart';
import 'blocs/update_data_bloc/update_data_bloc.dart';

class Application extends StatelessWidget {
  final UserRepository userRepository;
  const Application(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthBloc>(
              create: (_) => AuthBloc(myUserRepository: userRepository)),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<SignInBloc>(
                create: (_) => SignInBloc(myUserRepository: userRepository)),
            BlocProvider<SignUpBloc>(
                create: (_) => SignUpBloc(myUserRepository: userRepository)),
            BlocProvider<GetDataBloc>(
                create: (_) => GetDataBloc(myUserRepository: userRepository)),
            BlocProvider<UpdateDataBloc>(
                create: (_) => UpdateDataBloc(userRepository: userRepository)),
          ],
          child: const ApplicationView(),
        ));
  }
}
