import 'package:angular_router/angular_router.dart';

final dashboard = new RoutePath(path: 'dashboard');

final books = new RoutePath(path: 'books');

const bookId = 'id';

final book = new RoutePath(path: 'book/:$bookId');

// Admin Routes
final bookCreate = new RoutePath(path: 'book/create');

final bookEdit = new RoutePath(path: 'book/:$bookId/edit');

String getId(Map<String, String> parameters) {
  final id = parameters[bookId];
  return id == null ? null : id;
}
