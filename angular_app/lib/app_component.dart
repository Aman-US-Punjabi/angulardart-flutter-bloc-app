import 'dart:convert';
import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';

import 'package:angular_router/angular_router.dart';
import 'src/routes.dart';

import 'package:angular_app/src/components/app_header/app_header_component.dart';

import './src/services/auth_service.dart';
import './src/services/pwa_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.scss.css'],
  templateUrl: 'app_component.html',
  directives: [
    coreDirectives,
    routerDirectives,
    AppHeaderComponent,
  ],
  providers: [
    ClassProvider(Routes),
    ClassProvider(AuthService),
  ]
)
class AppComponent {
  //****************  PWA setup  *****************//
  PwaService pwaService;

  bool get isPwaSupported => pwaService.pwaClient.isSupported;

  String get status => pwaService.permission == null
    ? '[waiting for initialization]'
    : pwaService.permission.status.toString();
           
  bool get showStatusDenied => pwaService.permission?.isDenied;
  bool get showStatusGranted => pwaService.permission?.isGranted;
  bool get showStatusSubscribed => pwaService.permission?.isSubscribed;
  bool get showStatusPrompt => pwaService.permission?.isPrompt;

  String get endpointUrl => pwaService.permission.endpointUrl;
  String get clientKeys => json.encode(pwaService.permission.clientKeys);

  bool get isFirefoxEndpoint =>
    endpointUrl.contains('//updates.push.services.mozilla.com/');

  bool get isChromeEndpoint =>
      endpointUrl.contains('//android.googleapis.com/');


  Future subscribe(MouseEvent event) async {
    event.preventDefault();
    pwaService.permission = await pwaService.pwaClient.getPushPermission(subscribeIfNeeded: true);
  }

  Future unsubscribe(MouseEvent event) async {
    event.preventDefault();
    await pwaService.permission.unsubscribe();
  }
  // ----------------  End PWA setup  -------------------//

  final Routes routes;
  final AuthService authService;

  AppComponent(
    this.routes,
    this.authService,
    this.pwaService
  );
}
