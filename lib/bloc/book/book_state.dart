import 'package:book_app/model/book_model.dart';

abstract class BookState {}

class BookInitial extends BookState {}

class BookDetailsLoading extends BookState {}

class BookDetailsLoaded extends BookState {
  final List<Book> books;

  BookDetailsLoaded(this.books);
}

class BookDetailsErrorMessage extends BookState {
  final String errormessage;

  BookDetailsErrorMessage(this.errormessage);
}
