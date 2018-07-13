import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:angular_router/angular_router.dart';

import 'package:common_bloc/common_bloc.dart';


import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/material_button/material_button.dart';


import 'package:angular_components/laminate/enums/alignment.dart';
import 'package:angular_components/laminate/popup/module.dart';
import 'package:angular_components/material_checkbox/material_checkbox.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/material_select/material_dropdown_select_accessor.dart';
import 'package:angular_components/material_select/material_select_searchbox.dart';
import 'package:angular_components/model/selection/select.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/selection/selection_options.dart';
import 'package:angular_components/model/selection/string_selection_options.dart';
import 'package:angular_components/model/ui/display_name.dart';
import 'package:angular_components/model/ui/has_factory.dart';

import '../../services/book_service.dart';

import '../../route_paths.dart' as paths;

@Component(
  selector: 'book-form',
  templateUrl: 'book_form_component.html',
  styleUrls: [
    'book_form_component.scss.css'
  ],
  providers: [
    popupBindings,
    BookService
  ],
  pipes: [commonPipes],
  directives: [
    coreDirectives,
    formDirectives,
    materialInputDirectives,
    materialNumberInputDirectives,
    MaterialButtonComponent,
    MaterialDropdownSelectComponent,
    DropdownSelectValueAccessor
  ]
)
class BookFormComponent implements OnActivate {
  BookService bookService;

  bool isNewBook = true;

  BookModel book = new BookModel(
    author: null,
    name: null,
    price: null
  );

  bool submitted = false;

  void onSubmit() async { 
    submitted = true;

    print(book.toJson());
    if (isNewBook) {
      bookService.bookBloc.create.add(book);
    } else {
      bookService.bookBloc.update.add(book);
    }
  }

  @override
  void onActivate(_, RouterState current) async {
    final id = paths.getId(current.parameters);

    if (id != null) {
      isNewBook = false;
      book = await bookService.bookBloc.getBookById(id: "$id").first;
    } 
  }

  BookFormComponent(this.bookService);
}