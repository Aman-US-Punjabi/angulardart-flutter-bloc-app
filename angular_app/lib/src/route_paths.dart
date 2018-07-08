import 'package:angular_router/angular_router.dart';

final dashboard = new RoutePath(path: 'dashboard');

// Admin Routes
final bookForm = new RoutePath(path: 'book-form');

String getId(Map<String, String> parameters) {
  final id = parameters[bookId];
  return id;
}


final books = new RoutePath(path: 'books');

const bookId = 'id';
final book = new RoutePath(path: 'book/:$bookId');
