import 'dart:async';
import 'package:angular/angular.dart';
import 'package:pwa/client.dart' as pwa;

@Injectable()
class PwaService {

  pwa.Client pwaClient;
  pwa.PushPermission permission;

  Future _initStatus() async {
    permission = await pwaClient.getPushPermission(subscribeIfNeeded: true);
  }

  PwaService() {
    pwaClient = pwa.Client();
    _initStatus();
  }
}