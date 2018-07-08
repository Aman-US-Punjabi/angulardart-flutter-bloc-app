import 'package:angular/angular.dart';

import 'package:angular_router/angular_router.dart';
import 'src/routes.dart';

import 'package:angular_app/src/components/app_header/app_header_component.dart';

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
  ]
)
class AppComponent {
  final Routes routes;

  AppComponent(this.routes);
}
