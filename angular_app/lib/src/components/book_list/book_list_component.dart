import 'dart:async';

import 'package:angular/angular.dart';

import 'package:common_bloc/common_bloc.dart';

import 'package:angular_components/material_button/material_fab.dart';
import 'package:angular_components/material_icon/material_icon.dart';

import '../../state/container.dart';

@Component(
  selector: 'book-list',
  styleUrls: ['book_list_component.scss.css'],
  templateUrl: 'book_list_component.html',
  directives: [
    coreDirectives,
    MaterialFabComponent,
    MaterialIconComponent
  ],
  providers: [
    StateContainer
  ],
  pipes: [commonPipes]
)
class BookListComponent implements AfterViewInit {
  final StateContainer stateContainer;

  BookListComponent(this.stateContainer);

  Stream<List<BookModel>> books;
 
  @override
  void ngAfterViewInit() {
    books = stateContainer.bookBloc.getAllBooks();
  }
}