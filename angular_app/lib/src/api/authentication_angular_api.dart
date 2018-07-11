import 'dart:async';

import 'package:firebase/firebase.dart';
import 'package:common_bloc/common_bloc.dart';

class AuthenticationAngularApi extends AuthenticationApi<User> {
  static final AuthenticationAngularApi _instance = AuthenticationAngularApi._();

  AuthenticationAngularApi._();

  factory AuthenticationAngularApi() => _instance;

  User user;
  final Auth _fbAuth = auth();
  final GoogleAuthProvider _fbGoogleAuthProvider = new GoogleAuthProvider();
  final FacebookAuthProvider _fbFacebookAuthProvider = new FacebookAuthProvider();


  init() {
    print('Auth api init()');
    _fbAuth.onAuthStateChanged.listen(_authChanged);
  }

  void _authChanged(User fbUser) {
    print('Auth api _authChanged');
    user = fbUser;
    signInSilently();
  }
  // final _authApi = AuthenticationAngularApi();

  // AuthenticationBloc<User> authBloc;

  // AuthService() {
  //   authBloc = AuthenticationBloc(_authApi);
  // }

  // void dispose() {
  //   authBloc.dispose();
  // }



  @override
  void signOut() async {
    await _fbAuth.signOut();
  }

  @override
  Future<User> signInSilently() async {
    print(user.toJson());
    print('signinSilently 3');
    
    return user;
  }

  @override
  Future<User> signInUsingFacebook() async {
    try {
      UserCredential userCredential = await _fbAuth.signInWithPopup(_fbFacebookAuthProvider);
      User userData = userCredential.user;
      return userData;
    } catch (error) {
      print('$runtimeType::login() -- $error');
      return null;
    }
  }

  @override
  Future<User> signInUsingGoogle() async {
    // TODO: implement signInUsingGoogle
    try {
      UserCredential userCredential = await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
      User userData = userCredential.user;
      return userData;
    } catch (error) {
      print('$runtimeType::login() -- $error');
      return null;
    }
  }

}