import 'dart:async';
import 'package:angular/angular.dart';

import 'package:angular_router/angular_router.dart';
import 'src/routes.dart';

import 'package:angular_app/src/components/app_header/app_header_component.dart';

import './src/services/auth_service.dart';
import 'package:pwa/client.dart' as pwa;

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.scss.css'],
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    AppHeaderComponent,
  ],
  providers: [
    ClassProvider(Routes),
    ClassProvider(AuthService)
  ]
)
class AppComponent {
  //****************  PWA setup  *****************//
  pwa.Client _pwaClient;
  pwa.PushPermission _permission;
  bool get isPwaSupported => _pwaClient.isSupported;
  String get status => _permission == null
    ? '[waiting for initialization]'
    : _permission.status.toString();

  bool get showStatusDenied => _permission?.isDenied;
  bool get showStatusGranted => _permission?.isGranted;
  bool get showStatusSubscribed => _permission?.isSubscribed;
  bool get showStatusPrompt => _permission?.isPrompt;

  String get endpointUrl => _permission.endpointUrl;

  bool get isFirefoxEndPoint =>
    endpointUrl.contains('//updates.push.services.mozilla.com/');

  bool get isChromeEndpoint =>
      endpointUrl.contains('//android.googleapis.com/');

  final Routes routes;
  final AuthService authService;

  Future _initStatus() async {
    _permission = await _pwaClient.getPushPermission();
  }

  AppComponent(
    @Inject('pwa.Client') this._pwaClient,
    this.routes,
    this.authService
  ) {
    _initStatus();
  }

}
