import 'dart:async';
import 'package:common_bloc/src/api/authentication.dart';
import 'bloc.dart';

class AuthenticationBloc<FirebaseUser> extends Bloc {
  final AuthenticationApi _api;

  FirebaseUser _user;

  bool _isAdmin;

  FirebaseUser get user => _user;

  bool get isAdmin => _isAdmin;

  Future<FirebaseUser> signInUsingGoogle() async => _user = await _api.signInUsingGoogle();

  Future<FirebaseUser> signInUsingFacebook() async => _user = await _api.signInUsingFacebook();

  Future<FirebaseUser> signInSilently() async =>
      _user = await _api.signInSilently();

  void signOut() {
    _api.signOut();
    _user = null;
  }

  AuthenticationBloc(this._api);

  @override
  void dispose() {}
}
