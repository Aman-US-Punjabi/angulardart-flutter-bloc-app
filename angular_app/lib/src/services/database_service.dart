import 'dart:async';
import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fbStore;

@Injectable()
class DatabaseService {
  fb.Auth _fbAuth;
  fb.User user;
  fb.GoogleAuthProvider _fbGoogleAuthProvider;
  fb.FacebookAuthProvider _fbFacebookAuthProvider;
  fb.Storage _fbStorage;
  fbStore.Firestore _firestore;

  DatabaseService() {
    fb.initializeApp(
      apiKey: "AIzaSyDBoHqajuX0q4-HqF9ZB7MCmbd5AJyh3ms",
      authDomain: "seattle7dayslimo-2370f.firebaseapp.com",
      databaseURL: "https://seattle7dayslimo-2370f.firebaseio.com",
      projectId: "seattle7dayslimo-2370f",
      storageBucket: "seattle7dayslimo-2370f.appspot.com",
      messagingSenderId: "920446274421"
    );

    _fbGoogleAuthProvider = new fb.GoogleAuthProvider();
    _fbFacebookAuthProvider = new fb.FacebookAuthProvider();
    _fbAuth = fb.auth();
    _fbAuth.onAuthStateChanged.listen(_authChanged);
  }

  void _authChanged(fb.User fbUser) {
    user = fbUser;
  }

  Future signInWithGoogle() async {
    try {
      await _fbAuth.signInWithPopup(_fbGoogleAuthProvider);
    } catch (error) {
      print('$runtimeType::login() -- $error');
    }
  }

  Future signInWithFacebook() async {
    try {
      await _fbAuth.signInWithPopup(_fbFacebookAuthProvider);
    } catch (error) {
      print('$runtimeType::login() -- $error');
    }
  }

  void signOut() {
    _fbAuth.signOut();
  }
}