import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eda_gotova/domain/user_repository/lib/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  final UserRepository userRepository;
  late final StreamSubscription<User?> _userSubscription;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  GetDataBloc({required UserRepository myUserRepository})
      : userRepository = myUserRepository,
        super(GetDataInitial()) {
    _userSubscription = userRepository.user.listen((authUser) {
      add(GetDataUser(authUser));
    });
    on<GetDataUser>((event, emit) async {
      emit(GetDataProcess());
      final id = event.user?.uid.toString();
        DocumentSnapshot userSnapshot =
            await firestore.collection('user').doc(id).get();
        
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
      if (userData.isNotEmpty) {
        emit(GetDataSuccess(user: userData));
      } else {
        emit(GetDataFailure());
      }
    });
  }
  @override
    Future<void> close() {
      _userSubscription.cancel();
      return super.close();
    }
}
