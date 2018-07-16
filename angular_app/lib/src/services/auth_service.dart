
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

@Injectable()
class AuthService {

  User user;
  final Auth _fbAuth = auth();
  final GoogleAuthProvider _fbGoogleAuthProvider = new GoogleAuthProvider();
  final FacebookAuthProvider _fbFacebookAuthProvider = new FacebookAuthProvider();

  AuthService() {
    _fbAuth.onAuthStateChanged.listen(_authChanged);
  }

  init() {
    _fbAuth.onAuthStateChanged.listen(_authChanged);
  }

  void _authChanged(User fbUser) {
    user = fbUser;
  }

  void signOut() async {
    await _fbAuth.signOut();
  }

  signInUsingFacebook() async {
    try {
      UserCredential userCredential = await _fbAuth.signInWithPopup(_fbFacebookAuthProvider);
      user = userCredential.user;
    } catch (error) {
      print('$runtimeType::login() -- $error');
    }
  }

  signInUsingGoogle() async {
    try {
      UserCredential userCredential = await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
      print(userCredential.user.refreshToken);
      print(userCredential.user.toJson());
      user = userCredential.user;
    } catch (error) {
      print('$runtimeType::login() -- $error');
    }
  }

}