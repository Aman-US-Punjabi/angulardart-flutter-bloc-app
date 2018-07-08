import 'dart:async';
import 'dart:io';
import '../api/firebase.dart';
import 'bloc.dart';
import '../model/book.dart';
import 'package:tuple/tuple.dart';
import 'package:meta/meta.dart';

class BookBloc extends Bloc {
  final FirebaseApi _api;

  final StreamController<BookModel> _createController = StreamController<BookModel>();

  final StreamController<BookModel> _updateController = StreamController<BookModel>();

  final StreamController<BookModel> _deleteController = StreamController<BookModel>();

  final StreamController<Tuple3<BookModel, File, String>>
    _uploadImageController = StreamController<Tuple3<BookModel, File, String>>();

  final StreamController<Tuple2<BookModel, String>>
    _deleteImageController = StreamController<Tuple2<BookModel, String>>();

  final StreamController<Tuple2<BookModel, String>> 
    _setMainImageController = StreamController<Tuple2<BookModel, String>>();

  BookBloc(this._api) {
    _createController.stream.listen(_handleCreate);
    _updateController.stream.listen(_handleUpdate);
    _deleteController.stream.listen(_handleDelete);
    _uploadImageController.stream.listen(_handleUploadImage);
    _deleteImageController.stream.listen(_handleDeleteImage);
    _setMainImageController.stream.listen(_handleSetMainImage);
  }

  Stream<List<BookModel>> getAllBooks() => _api.getBooks();

  Stream<BookModel> getBookById({@required String id}) => _api.getBookById(id: id);

  Sink<BookModel> get create => _createController.sink;

  Sink<BookModel> get upload => _updateController.sink;

  Sink<BookModel> get delete => _deleteController.sink;

  Sink<Tuple3<BookModel, File, String>> get uploadImage => _uploadImageController.sink;

  Sink<Tuple2<BookModel, String>> get deleteImage => _deleteImageController.sink;

  Sink<Tuple2<BookModel, String>> get setMainImage => _setMainImageController.sink; 

  void _handleCreate(BookModel book) => _api.addBook(book);

  void _handleDelete(BookModel book) => _api.deleteBook(book);

  void _handleUpdate(BookModel book) => _api.updateBook(book);

  void _handleUploadImage(Tuple3<BookModel, File, String> data) =>
    _api.upLoadBookImage((data.item1), data.item2, data.item3);

  void _handleDeleteImage(Tuple2<BookModel, String> data) =>
    _api.deleteBookImage(data.item1, data.item2);

  void _handleSetMainImage(Tuple2<BookModel, String> data) =>
    _api.setBookMainImage(data.item1, data.item2);

  @override
  void dispose() {
    _createController.close();
    _deleteController.close();
    _updateController.close();
    _uploadImageController.close();
    _deleteController.close();
    _setMainImageController.close();
  }

}