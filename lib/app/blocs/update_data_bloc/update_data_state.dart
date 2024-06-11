part of 'update_data_bloc.dart';

sealed class UpdateDataState extends Equatable {
  const UpdateDataState();

  @override
  List<Object> get props => [];
}

final class UpdateDataInitial extends UpdateDataState {}

class UploadAddressSuccess extends UpdateDataState {
  final String address;

  const UploadAddressSuccess(this.address);

  @override
  List<Object> get props => [address];
}

class UploadDataFailure extends UpdateDataState {}

class UploadDataProcess extends UpdateDataState {}
