import 'package:firebase_auth/firebase_auth.dart';

import '../user_repository.dart';

abstract class UserRepository {
  Stream<User?> get user;

  Future<void> signIn(String email, String password);

  Future<void> logOut();

  Future<MyUser> signUp(MyUser myUser, String password);

  Future<void> setData(MyUser user);

  Future<MyUser> getMyUser(String myUserId);

  Future<String> uploadAddress(String address, String userId);

}