import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginRepo {
  void loginByGoogle();
  Future<UserCredential> logoutfromGoogle();
}
