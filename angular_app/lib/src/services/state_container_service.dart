import 'package:meta/meta.dart';
import 'package:firebase/firebase.dart';
import 'package:common_bloc/common_bloc.dart';

import '../api/authentication_angular_api.dart';
import '../api/firebase_angular_api.dart';

class StateContainerService {
  final _authApi = AuthenticationAngularApi();

  final _firebaseApi = FirebaseAngularApi();

  AuthenticationBloc<User> authenticationBloc;
  BookBloc bookBloc;

  StateContainerService() {
    authenticationBloc = AuthenticationBloc(_authApi);
    bookBloc = BookBloc(_firebaseApi);
  }

  void dispose() {
    authenticationBloc.dispose();
    bookBloc.dispose();
  }
}