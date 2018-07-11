import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;

import 'components/dashboard/dashboard_component.template.dart' as dashboardct;
import 'components/book_list/book_list_component.template.dart' as booklistct;
import 'components/book_detail/book_detail_component.template.dart' as bookDetailct;

// Admin routes
import 'components/book_form/book_form_component.template.dart' as bookFormct;

@Injectable()
class Routes {

  static final _dashboard = new RouteDefinition(
    routePath: paths.dashboard,
    component: dashboardct.DashboardComponentNgFactory,
    useAsDefault: true
  );
  RouteDefinition get dashboard => _dashboard;

  static final _bookCreate = new RouteDefinition(
    routePath: paths.bookCreate,
    component: bookFormct.BookFormComponentNgFactory
  );
  RouteDefinition get bookCreate => _bookCreate;

  static final _bookEdit = new RouteDefinition(
    routePath: paths.bookEdit,
    component: bookFormct.BookFormComponentNgFactory
  );
  RouteDefinition get bookEdit => _bookEdit;

  static final _bookList = new RouteDefinition(
    routePath: paths.books,
    component: booklistct.BookListComponentNgFactory,
  );
  RouteDefinition get books => _bookList;

  static final _bookDetail = new RouteDefinition(
    routePath: paths.book,
    component: bookDetailct.BookDetailComponentNgFactory,
  );
  RouteDefinition get book => _bookDetail;

  final List<RouteDefinition> all = [
    _dashboard,
    _bookCreate,
    _bookEdit,
    _bookList,
    _bookDetail
  ];
}