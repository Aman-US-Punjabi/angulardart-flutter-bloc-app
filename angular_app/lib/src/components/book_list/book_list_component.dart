import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:common_bloc/common_bloc.dart';

import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';

import '../../services/book_service.dart';
import '../../services/auth_service.dart';

import '../../routes.dart';
import '../../route_paths.dart' as paths;


@Component(
  selector: 'book-list',
  styleUrls: ['book_list_component.scss.css'],
  templateUrl: 'book_list_component.html',
  directives: [
    coreDirectives,
    routerDirectives,
    MaterialFabComponent,
    MaterialIconComponent
  ],
  providers: [
    BookService,
    // ClassProvider(AuthService)
  ],
  pipes: [commonPipes]
)
class BookListComponent implements AfterViewInit {
  final AuthService authService;
  final BookService bookService;
  final Routes routes;
  final Router router;

  BookListComponent(
    this.authService,
    this.bookService,
    this.routes,
    this.router
  );

  Stream<List<BookModel>> books;

  void deleteBook(BookModel book) {
    print('Delete Book Button clicked for book: ${book.name}');
    bookService.bookBloc.delete.add(book);
  }
 
  @override
  void ngAfterViewInit() {
    books = bookService.bookBloc.getAllBooks();
  }

  void onEditBook(BookModel book) => _goToBookEditForm(book.id);

  void onGoToBookDetail(BookModel book) => _goToBookDetailPage(book.id);

  String _bookDetailUrl(String id) =>
    paths.book.toUrl(parameters: {paths.bookId: id});

  Future<NavigationResult> _goToBookDetailPage(String id) =>
    router.navigate(_bookDetailUrl(id));

  String _bookFormUrl(String id) =>
      paths.bookEdit.toUrl(parameters: {paths.bookId: id});

  Future<NavigationResult> _goToBookEditForm(String id) => 
    router.navigate(_bookFormUrl(id));
}
