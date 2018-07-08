import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../routes.dart';

import 'package:angular_components/angular_components.dart';

import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';

import '../../services/database_service.dart';
import '../../state/container.dart';


@Component(
  selector: 'app-header',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'app_header_component.scss.css'
  ],
  templateUrl: 'app_header_component.html',
  directives: [
    CORE_DIRECTIVES,
    routerDirectives,
    DeferredContentDirective,
    MaterialPersistentDrawerDirective,
    MaterialTemporaryDrawerComponent,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialListComponent,
    MaterialListItemComponent,
    MaterialToggleComponent
  ],
  providers: [
    DatabaseService,
    StateContainer,
    materialProviders
  ]
)
class AppHeaderComponent {
  bool end = false;
  // final DatabaseService dbService;
  final StateContainer stateContainer;
  final Routes routes;

  AppHeaderComponent(
    // DatabaseService this.dbService,
    StateContainer this.stateContainer,
    Routes this.routes
  );
}