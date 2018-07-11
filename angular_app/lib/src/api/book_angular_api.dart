import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:convert';

import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart';
import 'package:common_bloc/common_bloc.dart';

import 'package:http/http.dart' as http;

class BookAngularApi extends BookApi {

  static final BookAngularApi _instance = BookAngularApi._();

  BookAngularApi._();

  factory BookAngularApi() => _instance;

  @override
  void addBook(BookModel book) {
    fb.firestore().collection('books').add(book.toJson());
  }

  @override
  void deleteBook(BookModel book) {
    fb.firestore().doc('books/${book.id}').delete();
  }

  @override
  void deleteBookImage(BookModel book, String imageUrl) {
    
    var imagesInBook = new Map.from(book.allImages);
    // remove where value is equal to imageUrl
    imagesInBook.removeWhere((key, value) {
      if (value == imageUrl) {
        
        final fb.StorageReference ref = fb.storage().ref().child(key);
        ref.delete();
      }
      return value == imageUrl;
    });

    BookModel newBook = book.copyWith(allImages: imagesInBook);
    
    updateBook(newBook);
  }

  @override
  Stream<List<BookModel>> getBooks() {
    StreamController<List<BookModel>> controller = StreamController.broadcast();

    fb.firestore()
      .collection('books')
      .onSnapshot
      .listen((QuerySnapshot snapshot) {
        controller.add(snapshot.docs.map<BookModel>((DocumentSnapshot document) {
          var data = document.data();
          data['id'] = document.id;

          BookModel book = BookModel.fromJson(data);
          return book;
        }).toList());
      });

    return controller.stream;
  }

  @override
  Stream<BookModel> getBookById({String id}) {
    StreamController<BookModel> controller = StreamController.broadcast();

    fb.firestore()
      .doc('books/$id')
      .onSnapshot
      .listen((DocumentSnapshot document) {
        var data = document.data();
        data['id'] = document.id;

        BookModel book = BookModel.fromJson(data);

        controller.add(book);
      });

    return controller.stream;
  }

  @override
  void setBookMainImage(BookModel book, String imageUrl) {
    // TODO: implement setBookMainImage
  }

  @override
  Future<Null> upLoadBookImage(BookModel book, File imageFile, String firebaseIdToken) async {
    // Get image from gallery
    final String randNum = '${new Random().nextInt(10000)}';
    final String name = book.name.replaceAll(new RegExp(r' '), '_').toLowerCase();
    await uploadImage(imageFile.path, book, firebaseIdToken);
  }

  Future<Null> uploadImage(String filePath, BookModel book, String firebaseIdToken) async {
    try{
      const api_url = "https://seattle7dayslimo-2370f.firebaseapp.com/api/v1";
      final bookId = book.id;
      final uploadBookImgUrl = "$api_url/books/$bookId/upload/photos";

      var url = Uri.parse(uploadBookImgUrl);
      print(url.toString());
      var request = new http.MultipartRequest("POST", url)
        ..headers.putIfAbsent('Authorization', () => "Bearer $firebaseIdToken");

      var multiPartFile = await http.MultipartFile.fromPath('photos', filePath);

      request.files.add(multiPartFile);

      var response = await request.send();

      print(response.statusCode);
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    } catch (error) {
      print('Error while upload image: $error');
    }
  }

  @override
  void updateBook(BookModel book) {
    fb.firestore()
      .collection('books')
      .doc('${book.id}')
      .update(data:  book.toJson());
  }

}