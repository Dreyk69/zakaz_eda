import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? address;

  const MyUserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.address,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'address': address,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      email: doc['email'] as String,
      name: doc['name'] as String,
      address: doc['address'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, email, name, address];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      email: $email
      name: $name
      address: $address
    }''';
  }
}