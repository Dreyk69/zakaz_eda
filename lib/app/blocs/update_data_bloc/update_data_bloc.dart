
import 'package:eda_gotova/domain/user_repository/lib/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_data_event.dart';
part 'update_data_state.dart';

class UpdateDataBloc extends Bloc<UpdateDataEvent, UpdateDataState> {
  final UserRepository _userRepository;

  UpdateDataBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UpdateDataInitial()) {
    on<UploadAddress>((event, emit) async {
      emit(UploadDataProcess());
      try {
        String address =
            await _userRepository.uploadAddress(event.address, event.userId);
        emit(UploadAddressSuccess(address));
      } catch (e) {
        emit(UploadDataFailure());
      }
    });
  }
}
