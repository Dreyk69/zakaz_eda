import 'dart:developer';
import 'package:eda_gotova/domain/user_repository/lib/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc({required UserRepository myUserRepository})
      : _userRepository = myUserRepository,
        super(SignUpInitial()) {
    on<SignUpRequired>((event, emit) async {
      emit(SignUpProcess());
        try {
          MyUser user = await _userRepository.signUp(
              event.user!, event.password);
          await _userRepository.setData(user);
          emit(SignUpSuccess());
        } catch (e) {
          log(e.toString());
          emit(SignUpFailure());
        }
    });
  }
}
