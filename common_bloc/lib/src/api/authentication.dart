import 'dart:async';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationApi<FirebaseUser> {
  Future<FirebaseUser> signInUsingGoogle();

  Future<FirebaseUser> signInUsingFacebook();

  Future<FirebaseUser> signInSilently();

  void signOut();
}