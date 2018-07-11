import 'package:common_bloc/common_bloc.dart';

import '../api/book_angular_api.dart';

class BookService {
  final _bookApi = BookAngularApi();

  BookBloc bookBloc;

  BookService() {
    bookBloc = BookBloc(_bookApi);
  }

  void dispose() {
    bookBloc.dispose();
  }
}