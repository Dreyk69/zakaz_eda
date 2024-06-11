import 'package:equatable/equatable.dart';

import '../entities/my_user_entities.dart';

// ignore: must_be_immutable
class MyUser extends Equatable {
  final String id;
  final String email;
  final String name;
  String? address;

  MyUser({
    required this.id,
    required this.email,
    required this.name,
    this.address,
  });

  static MyUser empty = MyUser(
    id: '',
    email: '',
    name: '',
    address: '',
  );

  MyUser copyWith({
    String? id,
    String? email,
    String? name,
    String? address,
  }) {
    return MyUser(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      email: email,
      name: name,
      address: address,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      address: entity.address,
    );
  }

  @override
  List<Object?> get props =>
      [id, email, name, address];
}