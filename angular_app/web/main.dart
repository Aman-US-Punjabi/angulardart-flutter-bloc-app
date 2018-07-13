import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_app/app_component.template.dart' as ng;
import 'package:firebase/firebase.dart' as fb;
import 'package:pwa/client.dart' as pwa;

import 'main.template.dart' as self;

@GenerateInjector(
  routerProvidersHash, // You can use routerProviders in production
)
final InjectorFactory injector = self.injector$Injector;

void main() {
  fb.initializeApp(
    apiKey: "AIzaSyAH5audK7N3Xd1028LmjUDtm5Fe8CPbxv0",
    authDomain: "library-579a7.firebaseapp.com",
    databaseURL: "https://library-579a7.firebaseio.com",
    projectId: "library-579a7",
    storageBucket: "library-579a7.appspot.com",
    messagingSenderId: "689903894287"
  );

  // Install service worker.
  pwa.Client();

  runApp(ng.AppComponentNgFactory, createInjector: injector,);
}
