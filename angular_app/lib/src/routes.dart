import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;

import 'components/dashboard/dashboard_component.template.dart' as dashboardct;
// import 'components/book_list/book_list_component.template.dart' as booklct;

// Admin routes
// import 'components/book_form/book_form_component.template.dart' as bookFormct;

@Injectable()
class Routes {

  static final _dashboard = new RouteDefinition(
    routePath: paths.dashboard,
    component: dashboardct.DashboardComponentNgFactory,
    useAsDefault: true
  );
  RouteDefinition get dashboard => _dashboard;

  // static final _bookForm = new RouteDefinition(
  //   routePath: paths.bookForm,
  //   component: bookFormct.BookFormComponentNgFactory
  // );
  // RouteDefinition get bookForm => _bookForm;

  // static final _books = new RouteDefinition(
  //   routePath: paths.books,
  //   component: booklct.BookListComponentNgFactory,
  // );
  // RouteDefinition get books => _books;

  final List<RouteDefinition> all = [
    _dashboard,
    // _bookForm,
    // _books
  ];
}