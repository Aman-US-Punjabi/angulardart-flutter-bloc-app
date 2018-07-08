import 'dart:async';

import 'package:firebase/firebase.dart';
import 'package:common_bloc/common_bloc.dart';

class AuthenticationAngularApi extends AuthenticationApi<User> {
  final Auth _fbAuth = auth();
  final GoogleAuthProvider _fbGoogleAuthProvider = GoogleAuthProvider();
  final FacebookAuthProvider _fbFacebookAuthProvider = FacebookAuthProvider();

   @override
  Future<User> signInUsingFacebook() async {
    try {
      UserCredential userCredential = await _fbAuth.signInWithPopup(_fbFacebookAuthProvider);
      return userCredential.user;
    } catch (error) {
      print('$runtimeType::login() -- $error');
      return null;
    }
  }

  @override
  Future<User> signInUsingGoogle() async {
    try {
      UserCredential userCredential = await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
      return userCredential.user;
    } catch (error) {
      print('$runtimeType::login() -- $error');
      return null;
    }
  }

  @override
  Future<User> signInSilently() {
    // TODO: implement signInSilently
  }

  @override
  void signOut() {
    _fbAuth.signOut();
  }

}