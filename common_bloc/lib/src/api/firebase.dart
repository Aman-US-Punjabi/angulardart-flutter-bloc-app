import 'dart:async';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:common_bloc/src/model/book.dart';

@immutable
abstract class FirebaseApi {
  // Book Api

  // Get all books
  Stream<List<BookModel>> getBooks();

  // Get a book by id
  Stream<BookModel> getBookById({String id});

  // Add a new book to database
  void addBook(BookModel book);

  // Delete a book from database
  void deleteBook(BookModel book);

  // Update a book in database
  void updateBook(BookModel book);

  // Upload the image for the book
  void upLoadBookImage(
      BookModel book, File imageFile, String firebaseIdToken);

  // Delete the image from the Book
  void deleteBookImage(BookModel book, String imageUrl);

  // Set the main image for the book
  void setBookMainImage(BookModel book, String imageUrl);
}
