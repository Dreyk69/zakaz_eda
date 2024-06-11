part of 'update_data_bloc.dart';

sealed class UpdateDataEvent extends Equatable {
  const UpdateDataEvent();

  @override
  List<Object> get props => [];
}

class UploadAddress extends UpdateDataEvent {
  final String address;
  final String userId;

  const UploadAddress(this.address, this.userId);

  @override
  List<Object> get props => [address, userId];
}
