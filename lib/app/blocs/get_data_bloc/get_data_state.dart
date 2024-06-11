part of 'get_data_bloc.dart';

sealed class GetDataState extends Equatable {
  const GetDataState();

  @override
  List<Object> get props => [];
}

final class GetDataInitial extends GetDataState {}

final class GetDataSuccess extends GetDataState {
  final Map<String, dynamic>? user;

  const GetDataSuccess({this.user});
}

final class GetDataFailure extends GetDataState {}

final class GetDataProcess extends GetDataState {}
