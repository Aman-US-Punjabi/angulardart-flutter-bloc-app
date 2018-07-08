import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:common_bloc/common_bloc.dart';


import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_number_accessor.dart';
import 'package:angular_components/material_select/material_dropdown_select.dart';


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

@Component(
  selector: 'book-form',
  templateUrl: 'book_form_component.html',
  styleUrls: [
    'book_form_component.scss.css'
  ],
  providers: popupBindings,
  directives: [
    coreDirectives,
    formDirectives,
    materialInputDirectives,
    materialNumberInputDirectives,
    MaterialDropdownSelectComponent,
    DropdownSelectValueAccessor
  ]
)
class BookFormComponent {
  BookModel book = new BookModel(
    name: null,
    price: null,
    author: null
  );

  bool submitted = false;

  void onSubmit() => submitted = true;
}