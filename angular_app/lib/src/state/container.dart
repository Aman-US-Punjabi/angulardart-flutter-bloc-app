import 'package:meta/meta.dart';
import 'package:firebase/firebase.dart';
import 'package:common_bloc/common_bloc.dart';

class StateContainer {
  final AuthenticationBloc<User> authenticationBloc;
  final BookBloc bookBloc;

  const StateContainer({
    @required this.authenticationBloc,
    @required this.bookBloc
  });

  void dispose() {
    authenticationBloc.dispose();
    bookBloc.dispose();
  }
}